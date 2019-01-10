#use "code-gen.ml";;


let file_to_string f =
  let ic = open_in f in
  let s = really_input_string ic (in_channel_length ic) in
  close_in ic;
  s;;

let string_to_asts s = List.map Semantics.run_semantics
                         (Tag_Parser.tag_parse_expressions
                            (Reader.read_sexprs s));;

let primitive_names_to_labels = Code_Gen.primitive_names_to_labels;; 

let make_prologue consts_tbl fvars_tbl =
  let get_const_address const = "const_tbl + " ^ string_of_int(Code_Gen.get_const_addr const consts_tbl) in
  let get_fvar_address const = "fvar_tbl + " ^ string_of_int(Code_Gen.get_fvar_addr const fvars_tbl) ^ " * WORD_SIZE" in
  let make_primitive_closure (prim, label) =
"    MAKE_CLOSURE(rax, SOB_NIL_ADDRESS, " ^ label  ^ ")
    mov [" ^ (get_fvar_address prim)  ^ "], rax" in
  let make_constant (c, (a, s)) = s in
  
"
;;; All the macros and the scheme-object printing procedure
;;; are defined in compiler.s
%include \"compiler.s\"

section .bss
malloc_pointer:
    resq 1

section .data
const_tbl:
" ^ (String.concat "\n" (List.map make_constant consts_tbl)) ^ "

;;; These macro definitions are required for the primitive
;;; definitions in the epilogue to work properly
%define SOB_VOID_ADDRESS " ^ get_const_address Void ^ "
%define SOB_NIL_ADDRESS " ^ get_const_address (Sexpr Nil) ^ "
%define SOB_FALSE_ADDRESS " ^ get_const_address (Sexpr (Bool false)) ^ "
%define SOB_TRUE_ADDRESS " ^ get_const_address (Sexpr (Bool true)) ^ "

fvar_tbl:
" ^ (String.concat "\n" (List.map (fun (str,index) -> "dq T_UNDEFINED ; i'm " ^ str ^ ", my address is " ^ string_of_int index) fvars_tbl)) ^ "

global main
section .text
main:
    push rbp 
    mov rbp, rsp

    ;; set up the heap
    mov rdi, GB(4)
    call malloc
    mov [malloc_pointer], rax

    ;; Set up the dummy activation frame
    ;; The dummy return address is T_UNDEFINED
    ;; (which a is a macro for 0) so that returning
    ;; from the top level (which SHOULD NOT HAPPEN
    ;; AND IS A BUG) will cause a segfault.
    push 0
    push qword SOB_NIL_ADDRESS
    push qword T_UNDEFINED
    push rsp

    jmp code_fragment

code_fragment:
    ;; Set up the primitive stdlib fvars:
    ;; Since the primtive procedures are defined in assembly,
    ;; they are not generated by scheme (define ...) expressions.
    ;; This is where we emulate the missing (define ...) expressions
    ;; for all the primitive procedures.
" ^ (String.concat "\n" (List.map make_primitive_closure primitive_names_to_labels)) ^ "
    \nuser_code:
";;

let epilogue = " 
car:
    push rbp
    mov rbp, rsp

    mov rsi, PVAR(0) ; rsi got pair
	CAR rax, rsi ; rax got car
    jmp .return

.return:
    leave
    ret

cdr:
    push rbp
    mov rbp, rsp

    mov rsi, PVAR(0)
	CDR rax, rsi
    jmp .return

.return:
    leave
    ret
    
set_car:
    push rbp
    mov rbp, rsp

    mov rsi, PVAR(1) ; rsi got new car
    mov r8, PVAR(0) ; qword of pair
    add r8, 1 ; r8 is car loc
    mov [r8], rsi
    mov r9, qword [r8] ; r9 is car val

    mov rax, SOB_VOID_ADDRESS
    jmp .return

.return:
    leave
    ret

set_cdr:
    push rbp
    mov rbp, rsp

    mov rsi, PVAR(1) ; rsi got new car
    mov r8, PVAR(0) ; qword of pair
    add r8, 9 ; r8 is cdr loc
    mov [r8], rsi
    mov r9, qword [r8] ; r9 is car val

    mov rax, SOB_VOID_ADDRESS
    jmp .return

.return:
    leave
    ret

cons:
    push rbp
    mov rbp, rsp

    mov r8, PVAR(0) ; car
    mov r9, PVAR(1) ; cdr
    MAKE_PAIR (rax, r8, r9) ; pair into rax

    jmp .return

.return:
    leave
    ret  
";;

exception X_missing_input_file;;

try
  let infile = Sys.argv.(1) in
  let code = (file_to_string "stdlib.scm") ^ (file_to_string infile) in
  let asts = string_to_asts code in
  let consts_tbl = Code_Gen.make_consts_tbl asts in
  let fvars_tbl = Code_Gen.make_fvars_tbl asts in
  let generate = Code_Gen.generate consts_tbl fvars_tbl in 
  let code_fragment = String.concat "\n"
                        (List.map
                           (fun ast -> (generate ast) ^ "\tcall write_sob_if_not_void\n")
                           asts) in
  let provided_primitives = file_to_string "prims.s" in
                   
  print_string ((make_prologue consts_tbl fvars_tbl)  ^
                  code_fragment ^ "\t" ^ "add rsp, 4*8 \n" ^ 
                                  "\t" ^ "pop rbp \n" ^
                                  "\t" ^ "ret \n\n" ^
                    provided_primitives ^ "\n" ^ epilogue)

with Invalid_argument(x) -> raise X_missing_input_file;;
