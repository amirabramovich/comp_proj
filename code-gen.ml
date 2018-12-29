#use "semantic-analyser.ml";;

module type CODE_GEN = sig
  val make_consts_tbl : expr' list -> (constant * (int * string)) list
  val make_fvars_tbl : expr' list -> (string * int) list
  val generate : (constant * (int * string)) list -> (string * int) list -> expr' -> string
  val get_const_addr : 'a -> ('a * ('b * 'c)) list -> 'b 
  val get_fvar_addr : 'a -> ('a * 'b) list -> 'b

  (* Add funcs for tests *)
  (* TODO: delete later *)
  val scan_ast : expr' list -> sexpr list
  val remove_dups : 'a list -> 'a list
  val expand_lst : sexpr list -> sexpr list
  val cons_tbl : sexpr list -> (constant * (int * string)) list
end;;

let count = (ref 0);;

module Code_Gen : CODE_GEN = struct

  (* 1. Scan the AST (one recursive pass) & collect the sexprs in all Const records - The result is a list of sexprs *)
  let rec scan_ast asts consts = 
    match asts with
      | car :: cdr -> (match car with
                        | Const' Sexpr expr -> scan_ast cdr [expr] @ consts
                        | Set' (expr1, expr2) | Def' (expr1, expr2) -> scan_ast cdr consts @ (scan_ast ([expr1] @ [expr2]) consts) 
                        | If' (test, dit, dif) -> scan_ast cdr consts @ (scan_ast ([test]@[dit]@[dif]) consts) 
                        | Seq' exprs | Or' exprs  -> scan_ast cdr consts @ (scan_ast exprs consts) 
                        | LambdaSimple' (_, body) | LambdaOpt' (_, _, body) | BoxSet' (_,body) -> raise X_not_yet_implemented
                        | Applic' (op, exprs) | ApplicTP' (op, exprs) -> scan_ast cdr consts @ (scan_ast ([op] @ exprs) consts) 
                        | _ -> scan_ast cdr consts)
      | _ -> consts ;;

  let scan_ast asts = scan_ast asts [] ;;

  (* 2. Convert the list to a set (removing duplicates) *)
  let rec remove_dups lst = 
    match lst with
      | [] -> []
      | car :: cdr -> car :: (remove_dups (List.filter (fun e -> e <> car) cdr)) ;;

  (* 3. Expand list include all sub-constants, list should be sorted topologically, Logic of code from ps #11, 2.2.1 *)
  let rec expand_lst lst newLst =
    match lst with
      | car :: cdr -> 
          (match car with
            | Symbol (str) -> expand_lst cdr ([String str; car] @ newLst)
            | Pair(currCar, currCdr) -> expand_lst cdr ((expand_lst [currCar] []) @ (expand_lst [currCdr] []) @ [car] @ newLst)
            | Vector (elems) -> 
                let vecLst = expand_lst elems [] in
                expand_lst cdr (newLst @ vecLst @ [car])
            | _ -> expand_lst cdr ([car] @ newLst))
      | [] -> newLst ;;

  let expand_lst lst = expand_lst lst [] ;;

  (* Helper func, got sexpr, return size_of it *)
  let rec size_of sexpr =
    match sexpr with
      | Nil -> 1
      | Bool _ | Char _ -> 2
      | Number _ | Symbol _ -> 9
      | String(s) -> 9 + (String.length s)
      | Pair _ -> 17
      | Vector(v) -> 9 + (8 * (List.length v));;

  let get_const const tbl = List.assoc const tbl;;

  (* Helper func, got const and tbl, return addr of const *)
  let get_const_addr const tbl =
    let (addr, _) = get_const const tbl 
  in addr;;

  (* Helper func for parse vec to tbl, got vec and tbl => return string of consts + addr of all elems in vec *)
  let vec_const vec tbl = 
    let lst_string = List.map (fun s -> "const_tbl+" ^ string_of_int (get_const_addr (Sexpr s) tbl)) vec in
    String.concat ", " lst_string;;

  (* Cons_tbl helper func, got consts, tbl and addr, return tbl (at the end of recursion) *)
  let rec cons_tbl consts tbl addr =
    match consts with
    | car :: cdr -> 
      (match car with
        | Bool _ | Nil -> cons_tbl cdr tbl addr
        | Char ch -> cons_tbl cdr (tbl @ [(Sexpr(Char ch), (addr, "MAKE_LITERAL_CHAR('" ^ String.make 1 ch ^ "') ;my address is "^ (string_of_int addr) ))]) (addr + size_of car)
        | String expr -> cons_tbl cdr (tbl @ [(Sexpr(String expr), (addr, "MAKE_LITERAL_STRING \"" ^ expr ^ "\" ;my address is "^ (string_of_int addr)))]) (addr + size_of car)
        | Number(Int num) -> 
          cons_tbl cdr (tbl @ [(Sexpr(Number(Int num)), (addr, "MAKE_LITERAL_INT(" ^ (string_of_int num) ^ ") ;my address is "^ (string_of_int addr)))]) (addr + size_of car)
        | Number(Float num) -> 
          cons_tbl cdr (tbl @ [(Sexpr(Number(Float num)), (addr, "MAKE_LITERAL_FLOAT(" ^ (string_of_float num) ^ ") ;my address is "^ (string_of_int addr)))]) (addr + size_of car)
        | Symbol sym -> 
          cons_tbl cdr (tbl @ [(Sexpr(Symbol sym), (addr, "MAKE_LITERAL_SYMBOL(const_tbl+" ^ 
            string_of_int (get_const_addr (Sexpr(String sym)) tbl) ^ ") ;my address is "^ (string_of_int addr)))]) (addr + size_of car) 
        | Pair (f, s) -> 
          cons_tbl cdr (tbl @ [(Sexpr(Pair (f, s)), (addr, "MAKE_LITERAL_PAIR(const_tbl+" ^ 
            string_of_int (get_const_addr (Sexpr f) tbl) ^ ", const_tbl+" ^ string_of_int (get_const_addr (Sexpr s) tbl) ^ ") ;my address is "^ (string_of_int addr)))]) (addr + size_of car)
        | Vector vec -> cons_tbl cdr (tbl @ [(Sexpr(Vector vec)), (addr, "MAKE_LITERAL_VECTOR " ^ vec_const vec tbl ^" ;my address is "^ (string_of_int addr))]) (addr + size_of car))
    | [] -> tbl ;;
    
  (* Cons_tbl main func *)
  let cons_tbl consts = cons_tbl consts [
    (Void, (0, "MAKE_VOID ;my address is 0"));
    (Sexpr(Nil), (1, "MAKE_NIL ;my address is 1"));
    (Sexpr(Bool false), (2, "MAKE_BOOL(0) ;my address is 2"));
    (Sexpr(Bool true), (4, "MAKE_BOOL(1) ;my address is 4"));
    ] 6;;
    

  (*  expr' list -> (constant * (int * string)) list *)
  let make_consts_tbl asts = cons_tbl(remove_dups(expand_lst(remove_dups(scan_ast asts))));;

  (* ----------------------fvar table---------------------- *)
  let rec scan_fvars asts fvars = 
    match asts with
      | car :: cdr -> (match car with
                        | Var'(VarFree expr) -> scan_fvars cdr [expr] @ fvars
                        | Def'(Var'(VarFree expr), _) -> scan_fvars cdr ([expr] @ fvars) (*TODO: check if add more cases*)
                        | Applic' (op, exprs) -> scan_fvars cdr fvars @ (scan_fvars ([op] @ exprs) fvars) 
                        | _ -> scan_fvars cdr fvars)
      | _ -> fvars ;;

  let scan_fvars asts = scan_fvars asts [] ;;

  let saved_fvars = ["boolean?"; "float?"; "integer?"; "pair?"; "null?"; "char?"; "vector?";
  "string?"; "procedure?"; "symbol?"; "string-length"; "string-ref"; "string-set!"; "make-string";
  "vector-length"; "vector-ref"; "vector-set!"; "make-vector"; "symbol->string"; "char->integer"; "integer->char";
  "eq?"; "+"; "*"; "-"; "/"; "<"; "="];;

  let rec cons_fvars fvars tbl addr =
    match fvars with
    | car :: cdr -> cons_fvars cdr (tbl @ [(car,addr)]) (addr + 1) 
    | [] -> tbl ;;
    
  let cons_fvars fvars = cons_fvars (remove_dups(saved_fvars@fvars)) [] 0;;

  (* expr' list -> (string * int) list *)
  let make_fvars_tbl asts = cons_fvars(scan_fvars asts);;

  let get_fvar_addr fvar tbl = List.assoc fvar tbl;;

  (* (constant * (int * string)) list -> (string * int) list -> expr' -> string *)
  let rec generate consts fvars e = 
    match e with
    | Const' (expr) -> "    mov rax, const_tbl+" ^ (string_of_int(get_const_addr expr consts)) ^ "\n"
    | Var'(VarParam(_,pos)) -> "    mov rax, qword [rbp + 8 ∗ (4 + "^ (string_of_int pos) ^")]\n"
    | Def'(Var'(VarFree(name)),expr) -> (generate consts fvars expr) ^
                                        "    mov qword [fvar_tbl+"^(string_of_int(get_fvar_addr name fvars))^"*WORD_SIZE], rax\n" ^
                                        "    mov rax, SOB_VOID_ADDRESS\n" 
    | Set'(Var'(VarParam(_, pos)),expr) -> (generate consts fvars expr) ^ 
                                            "    mov qword [rbp + 8 ∗ (4 + "^(string_of_int pos)^")], rax\n"^
                                            "    mov rax, SOB_VOID_ADDRESS\n"
    | Var'(VarBound(_,depth,pos)) -> "    mov rax, qword [rbp + 8 ∗ 2]\n" ^
                                      "    mov rax, qword [rax + 8 ∗ " ^ (string_of_int depth) ^ "]\n" ^
                                      "    mov rax, qword [rax + 8 ∗ " ^ (string_of_int pos) ^ "]\n" 
    | Set'(Var'(VarBound(_,depth,pos)),expr) -> (generate consts fvars expr) ^
                                                "    mov rbx, qword [rbp + 8 ∗ 2]\n" ^
                                                "    mov rbx, qword [rbx + 8 ∗ "^(string_of_int depth)^"]\n"^
                                                "    mov qword [rbx + 8 ∗ "^(string_of_int pos)^"], rax\n" ^
                                                "    mov rax, SOB_VOID_ADDRESS\n"
    | Var'(VarFree v) -> "    mov rax, qword [fvar_tbl+"^ (string_of_int(get_fvar_addr v fvars)) ^"*WORD_SIZE]\n"
    | Set'(Var'(VarFree(v)),expr) -> (generate consts fvars expr) ^ 
                                      "    mov qword [fvar_tbl+"^(string_of_int(get_fvar_addr v fvars))^"*WORD_SIZE], rax\n"^
                                      "    mov rax, SOB_VOID_ADDRESS\n"
    | Seq'(exprs) -> String.concat "\n" (List.map (generate consts fvars) exprs)
    | Or'(exprs) -> let current = !count in
                    count := !count +1;
                    let or_gen consts fvars expr =
                      (generate consts fvars expr) ^ 
                      "    cmp rax, SOB_FALSE_ADDRESS\n" ^
                      "    jne LexitOr"^(string_of_int current)^"\n" in
                      String.concat "\n" (List.map (or_gen consts fvars) exprs) ^
                      "    LexitOr"^(string_of_int current)^":\n"
    | If'(test, dit, dif) -> let current = !count in
                              count := !count +1;
                              (generate consts fvars test) ^ 
                              "    cmp rax, SOB_FALSE_ADDRESS\n" ^
                              "    je Lelse"^(string_of_int current)^"\n"^
                              (generate consts fvars  dit) ^ 
                              "    jmp LexitIf"^(string_of_int current)^"\n"^
                              "    Lelse"^(string_of_int current)^":\n"^
                              (generate consts fvars  dif) ^ 
                              "    LexitIf"^(string_of_int current)^":\n"
    | BoxGet'(VarParam(_,pos)) -> "    mov rax, qword [rbp + 8 ∗ (4 + "^ (string_of_int pos) ^")]\n"^
                                  "    mov rax, qword [rax]\n"
    | BoxGet'(VarBound(_,depth,pos)) -> "    mov rax, qword [rbp + 8 ∗ 2]\n" ^
                                        "    mov rax, qword [rax + 8 ∗ " ^ (string_of_int depth) ^ "]\n" ^
                                        "    mov rax, qword [rax + 8 ∗ " ^ (string_of_int pos) ^ "]\n" ^
                                        "    mov rax, qword [rax]\n"
    | BoxSet'(VarParam(_,pos),expr) -> (generate consts fvars expr) ^ 
                                        "    push rax\n" ^
                                        "    mov rax, qword [rbp + 8 ∗ (4 + "^ (string_of_int pos) ^")]\n"^
                                        "    pop qword [rax]\n" ^
                                        "    mov rax, SOB_VOID_ADDRESS\n"
    | BoxSet'(VarBound(_,depth,pos),expr) -> (generate consts fvars expr) ^ 
                                             "    push rax\n" ^
                                             "    mov rax, qword [rbp + 8 ∗ 2]\n" ^
                                             "    mov rax, qword [rax + 8 ∗ " ^ (string_of_int depth) ^ "]\n" ^
                                             "    mov rax, qword [rax + 8 ∗ " ^ (string_of_int pos) ^ "]\n" ^
                                             "    pop qword [rax]\n" ^
                                             "    mov rax, SOB_VOID_ADDRESS\n"
    | LambdaSimple'(vars, body) -> raise X_not_yet_implemented
    | LambdaOpt'(vars, opt, body) -> raise X_not_yet_implemented
    | Applic'(op, args) -> raise X_not_yet_implemented
    | ApplicTP'(op, args) -> raise X_not_yet_implemented
    | _ -> raise X_not_yet_implemented;; (* TODO: check if all cases are checked. *)

end;;

