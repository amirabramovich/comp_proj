; 1 2 #t 5 3.14 #\a '() "yo" #(1 2 3) 'cool '(1) '(1 2 3) '(9 . 9) '(3.14)
;  (if (if (if 1 2 3) (if 4 (if 5 (if 6 7 8) 9) 10) (if 11 (if 12 (if 13 14 15) 16) 17)) (if 18 (if 19 20 21) 22) 23)
; (or (or (or 1 2 3) (or 4 (or 5 (or 6 7 8) 9) 10) (or 11 (or 12 (or 13 14 15) 16) 17)) (or 18 (or 19 20 21) 22) 23)
;  (if (if (if 1 2 3) (if 4 (if 5 (or 6 7 8) 9) 10) (or 11 (or 12 (or 13 14 15) 16) 17)) (or 18 (or 19 20 21) 22) 23)
;  (if (or (if 1 2 3) (if 4 (if 5 (if 6 7 8) 9) 10) (if 11 (or 12 (or 13 14 15) 16) 17)) (if 18 (or 19 20 21) 22) 23)
; (boolean? 99)
;  1
;  (define x '(1 2))
;  (car '(1 2))
;   (cdr '(1 2))
;  x
;  (set! x 3)
;  (set! x '(1 2))
;  (car x)
;  (cdr x)
;  (define x '(1 2))
;   (set-car! x 0)
;   (set-cdr! x 0)
;   x ;; should print '(0 0)
; (cons 1 2) ;; should print (1 . 2)
; (cons 3 4) ;; should print (3 . 4)
;  (define goo (lambda(x)(lambda()1)))
; ((goo 9))
; (define g (lambda (x) x))
; ((lambda (x) (g (g x))) 1)
; (define yosi (lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) d))))
; (((yosi 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6)
; ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) y))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6)
; ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) d))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6)

; (define (func .  x) x)
; (define gaa (lambda (a b . c) (+ a b)))
; (define voo (lambda (x . y) (begin x y)))
; (define adder (lambda (x) (lambda (y) (+ x y))))
; adder
; ((adder 3)9)
; (let ((a 3)(b 4)(c 5)(d 6)(e 7)(f 9))(let () f))
;  (define (func .  x) x)
;  (func) ; ()
;  (func 1) ; (1)
;  (func 1 2) ; (1 2)
;   (define gaa (lambda (a b . c) (+ a b)))
;   (gaa 2 3) ; 5
;   (gaa 2 3 4) ; 5
;   (define voo (lambda (x . y) (begin x y)))
;   (voo 1) ; ()
;   (voo 1 2) ; (2)
;   (voo 1 2 3) ; (2 3)
;   (voo 1 2 ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) y))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6))
;   (voo 1 ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) y))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6) 3)
;   (voo 1 2 ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) (voo 1 y p)))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6))
;   (voo 1 ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) (voo 1 x (gaa 2 y i))))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6) 3) 
; (define adder (lambda (x) (lambda (y) (+ x y))))
;  adder
; ((adder 3)9)
;  (define plus3 (adder 3))
;  (plus3 9)
;  adder
;  ((adder ((goo 9)))10)
; (define g (lambda(x)x))
; (define f (lambda(x)(+ x 1)))
; ((lambda (x) (f (g (g x))))5)
; (define yo (lambda (x y) (lambda (z) (+ (+ 1 y) z))))
;  ((yo 3 5) 9) 

; Test N31
; (define foo5
;     (lambda (x y)
;         (lambda () 
;                 "\n \r \f this is \n \r \f "
;                 (set! x 5))
;         (lambda () x)
;     ))
; ((foo5 1 2))  

; Test N47
; (define x_0 0)
; (define x_1 1)
; (define x_2 2)
; (set! x_0 -0)
; (set! x_1 -1)
; (set! x_2 -2)
; x_0
; x_1
; x_2

; Test N99
; (+ 3 -0.5) 
; Test N155
; (define x1 (lambda y y))           
; (define x2 (lambda (y1 . y2) `(y1 ,@y2)))          
; (define x3 (lambda (y1 y2 . y3) `(y1 y2 ,@y3)))
; (define x4 (lambda (y1 y2 y3 . y4) `(y1 y2 y3 ,@y4))) 
; (define x5 (lambda (y1 y2 y3 y4 . y5) `(y1 y2 y3 y4 ,@y5))) 
; (define x6 (lambda (y1 y2 y3 y4 y5 . y6) `(y1 y2 y3 y4 y5 ,@y6))) 

; (x1)
; (x2 1 2 3 4 5 6 7 8 9 10)
; (x3 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
; (x4 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
; (x5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)
; (x6 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50)
; Test N222
; (define x (lambda (x1 x2 x3 x4 x5 x6 x7 x8 x9 . x10) 
; (lambda (y1 y2 y3 y4 y5 y6 y7 y8 y9 . y10) 
; (lambda (z1 z2 z3 z4 z5 z6 z7 z8 z9 . z10) 
; (lambda (k1 k2 k3 k4 k5 k6 k7 k8 k9 . k10) 
; (lambda (l1 l2 l3 l4 l5 l6 l7 l8 l9 . l10) 
; (lambda (h1 h2 h3 h4 h5 h6 h7 h8 h9 . h10) 
; `(,x1 ,x2 ,x3 ,x4 ,x5 ,x6 ,x7 ,x8 ,x9 ,@x10 
; ,y1 ,y2 ,y3 ,y4 ,y5 ,y6 ,y7 ,y8 ,y9 ,@y10
; ,z1 ,z2 ,z3 ,z4 ,z5 ,z6 ,z7 ,z8 ,z9 ,@z10
; ,k1 ,k2 ,k3 ,k4 ,k5 ,k6 ,k7 ,k8 ,k9 ,@k10
; ,l1 ,l2 ,l3 ,l4 ,l5 ,l6 ,l7 ,l8 ,l9 ,@l10
; ,h1 ,h2 ,h3 ,h4 ,h5 ,h6 ,h7 ,h8 ,h9 ,@h10))))))))
; ((((((x 1 2 3 4 5 6 7 8 9 10) 11 12 13 14 15 16 17 18 19 20 -11) 21 22 23 24 25 26 27 28 29 30 -30 -31) 31 32 33 34 35 36 37 38 39 40 -40 -41 -42 -43) 41 42 43 44 45 46 47 48 49 50 -50 -51 -52 -53 -54 -55 -56) 51 52 53 54 55 56 57 58 59 60 -55 -66 -77 -88 -99 -100) 

; Test N223
; (define x (lambda x10 (lambda y10 (lambda z10 (lambda k10 (lambda l10 (lambda h10 
;     `(,@x10 ,@y10 ,@z10 ,@k10 ,@l10 ,@h10))))))))
; ((((((x 1 2 3 4 5 6 7 8 9 10) 11 12 13 14 15 16 17 18 19 20 -11) 21 22 23 24 25 26 27 28 29 30 -30 -31) 31 32 33 34 35 36 37 38 39 40 -40 -41 -42 -43) 41 42 43 44 45 46 47 48 49 50 -50 -51 -52 -53 -54 -55 -56) 51 52 53 54 55 56 57 58 59 60 -55 -66 -77 -88 -99 -100)       
;  ((yo 3 5) 9)

;; (list? 1)
;; (apply < '(1 2 3 4)) ; #t
;; (apply list '(1 2 3)) ;; (1 2 3)
                      ;; (3 2)
;; (apply list '(1 2)) ;; (1 2)
                      ;; (2 1) 

;; false ?
                    ;;  push only last 2 vars ... 

;; (append '(1 2) '(3 4)) ;(1 2 3 4)

;; (equal? 1 1);#t
;; (equal? '(1 2) '(1 2));#t
;; (equal? '(1 3) '(1 2));#f

;; (define n 1)
;; (= n 1);#t
;; (= n 2);#f
;; (> 1 2);#f
;; (> 2 1 3);#f
;; (< 1 2);#t
;; (< 2 1 3);#f
;; (length '(1 2 3 4));4

;; (define x4 (lambda (y1 y2 y3 . y4) `(y1 y2 y3 ,@y4)))
;; (x4 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
;(y1 y2 y3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
;(y1 y2 y3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
; fixed

; Test N155
; (define x1 (lambda y y))           
; (define x2 (lambda (y1 . y2) `(y1 ,@y2)))          
; (define x3 (lambda (y1 y2 . y3) `(y1 y2 ,@y3)))
; (define x4 (lambda (y1 y2 y3 . y4) `(y1 y2 y3 ,@y4))) 
;; (define x5 (lambda (y1 y2 y3 y4 . y5) `(y1 y2 y3 y4 ,@y5))) 
;; (define x6 (lambda (y1 y2 y3 y4 y5 . y6) `(y1 y2 y3 y4 y5 ,@y6))) 

; (x1)
; (x2 1 2 3 4 5 6 7 8 9 10)
; (x3 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
; (x4 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
;; (x5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)
; (y1 y2 y3 y4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)
; (y1 y2 y3 y4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)
;; (x6 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50)
; (y1 y2 y3 y4 y5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50)
; (y1 y2 y3 y4 y5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50)


; Test N222
;; (define x (lambda (x1 x2 x3 x4 x5 x6 x7 x8 x9 . x10)
;; (lambda (y1 y2 y3 y4 y5 y6 y7 y8 y9 . y10) 
;; (lambda (z1 z2 z3 z4 z5 z6 z7 z8 z9 . z10) 
;; (lambda (k1 k2 k3 k4 k5 k6 k7 k8 k9 . k10) 
;; (lambda (l1 l2 l3 l4 l5 l6 l7 l8 l9 . l10) 
;; (lambda (h1 h2 h3 h4 h5 h6 h7 h8 h9 . h10) 
;; `(,x1 ,x2 ,x3 ,x4 ,x5 ,x6 ,x7 ,x8 ,x9 ,@x10 
;;  ,y1 ,y2 ,y3 ,y4 ,y5 ,y6 ,y7 ,y8 ,y9 ,@y10
;;  ,z1 ,z2 ,z3 ,z4 ,z5 ,z6 ,z7 ,z8 ,z9 ,@z10
;;  ,k1 ,k2 ,k3 ,k4 ,k5 ,k6 ,k7 ,k8 ,k9 ,@k10
;;  ,l1 ,l2 ,l3 ,l4 ,l5 ,l6 ,l7 ,l8 ,l9 ,@l10
;;  ,h1 ,h2 ,h3 ,h4 ,h5 ,h6 ,h7 ,h8 ,h9 ,@h10))))))))
;;  ((((((x 1 2 3 4 5 6 7 8 9 10) 11 12 13 14 15 16 17 18 19 20 -11) 21 22 23 24 25 26 27 28 29 30 -30 -31) 31 32 33 34 35 36 37 38 39 40 -40 -41 -42 -43) 41 42 43 44 45 46 47 48 49 50 -50 -51 -52 -53 -54 -55 -56) 51 52 53 54 55 56 57 58 59 60 -55 -66 -77 -88 -99 -100)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 -11 21 22
; 23 24 25 26 27 28 29 30 -30 -31 31 32 33 34 35 36 37 38 39
; 40 -40 -41 -42 -43 41 42 43 44 45 46 47 48 49 50 -50 -51 -52
; -53 -54 -55 -56 51 52 53 54 55 56 57 58 59 60 -55 -66 -77
; -88 -99 -100)

; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 -11 21 22 
; 23 24 25 26 27 28 29 30 -30 -31 31 32 33 34 35 36 37 38 39 
; 40 -40 -41 -42 -43 41 42 43 44 45 46 47 48 49 50 -50 -51 -52 
; -53 -54 -55 -56 51 52 53 54 55 56 57 58 59 60 -55 -66 -77
; -88 -99 -100)

; Finally works ... 

; (1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18 19 
; 21 22 23 24 25 26 27 28 29 31 32 33 34 35 36 37 38 39 
; 41 42 43 44 45 46 47 48 49 51 52 53 54 55 56 57 58 59 -100 -99 -88 -77 -66 -55 60 -56 -55 -54 -53 -52
; -51 -50 50 -43 -42 -41 -40 40 -31 -30 30 -11 20 10)
; (-100 -99 -88 -77 -66 -55 60 59 58 57 56 55 54 53 52 51 -56 -55 -54 -53 -52 
; -51 -50 50 49 48 47 46 45 44 43 42 41 -43 -42 -41 -40 40 39 38 37 36 35 34 33 32 31 
; -31 -30 30 29 28 27 26 25 24 23 22 21 -11 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)

; reversed OutPut ... (Can Remove List.rev & Change Impl. of SimpleLambda)


;(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
; 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60)


; Test N223
;;  (define x (lambda x10 (lambda y10 (lambda z10 (lambda k10 (lambda l10 (lambda h10 
;;      `(,@x10 ,@y10 ,@z10 ,@k10 ,@l10 ,@h10))))))))
;;  ((((((x 1 2 3 4 5 6 7 8 9 10) 
;;         11 12 13 14 15 16 17 18 19 20 -11) 
;;             21 22 23 24 25 26 27 28 29 30 -30 -31) 
;;                 31 32 33 34 35 36 37 38 39 40 -40 -41 -42 -43) 
;;                     41 42 43 44 45 46 47 48 49 50 -50 -51 -52 -53 -54 -55 -56) 
;;                         51 52 53 54 55 56 57 58 59 60 -55 -66 -77 -88 -99 -100)

; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 -11 21 22
; 23 24 25 26 27 28 29 30 -30 -31 31 32 33 34 35 36 37 38 39
; 40 -40 -41 -42 -43 41 42 43 44 45 46 47 48 49 50 -50 -51 -52
; -53 -54 -55 -56 51 52 53 54 55 56 57 58 59 60 -55 -66 -77
; -88 -99 -100)

; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 -11 21 22
; 23 24 25 26 27 28 29 30 -30 -31 31 32 33 34 35 36 37 38 39
; 40 -40 -41 -42 -43 41 42 43 44 45 46 47 48 49 50 -50 -51 -52 
;-53 -54 -55 -56 51 52 53 54 55 56 57 58 59 60 -55 -66 -77
; -88 -99 -100)

; Finally works ..


; (-100 -99 -88 -77 -66 -55 60 59 58 57 56 55 54 53 52 51 -56 -55 -54 
; -53 -52 -51 -50 50 49 48 47 46 45 44 43 42 41 -43 -42 -41 -40 40 39 38 37 36 35 34 33 32 31 -31
; -30 30 29 28 27 26 25 24 23 22 21 -11 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)

;; OK, now prints all, But reversed.
;; Idea: Do Not Do List.rev to args, and Change Impl. SimpleLambda

; (1 2 3 4 5 6 7 8 9 10 ()
; 11 12 13 14 15 16 17 18 19 20 -11
; 21 22 23 24 25 26 27 28 29 30 -30 31
; 32 33 34 35 36 37 38 39 40 -40 41 42 43
; 44 45 46 47 48 49 50 -50 51 52 53 54 55 56
; 57 58 59 60 -55)


;; (define x (lambda a (lambda b (lambda c (lambda d
;;          `(,@a ,@b ,@c ,@d))))))
;; ((((x 1 2 3)
;;     10 11 12)
;;         20 21 22)
;;             30 31 32)
; (1 2 3 10 11 12 20 21 22 30 31 32)
; (1 2 3 10 11 12 20 21 22 30 31 32)

;; (define x (lambda a (lambda b (lambda c (lambda d (lambda e (lambda f
;;          `(,@a ,@b ,@c ,@d ,@e ,@f))))))))

;; ((((((x 0 1 2)
;;     10 11 12)
;;         20 21 22)
;;             30 31 32)
;;                 40 41 42)
;;                     50 51 52)
; (0 1 2 10 11 12 20 21 22 30 31 32 40 41 42 50 51 52)
; (0 1 2 10 11 12 20 21 22 30 31 32 40 41 42 50 51 52)

;; (define x (lambda a (lambda b (lambda c (lambda d
;;          `(,@a ,@b ,@c ,@d))))))
;; ((((x 1 2 3 4 5 6 7 8 9 10)
;;     11 12 13 14 15 16 17 18 19 20)
;;         21 22 23 24 25 26 27 28 29 30)
;;             31 32 33 34 35 36 37 38 39 40)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
; 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)

;; (define x (lambda a (lambda b (lambda c (lambda d
;;          `(,@a ,@b ,@c ,@d))))))
;; ((((x 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
;;     16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
;;         31 32 33 34 35 36 37 38 39 40 41 42 43 44 45)
;;             46 47 48 49 50 51 52 53 54 55 56 57 58 59 60)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
; 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43
; 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60)

;;  (define x (lambda a (lambda b (lambda c
;;      `(,@a ,@b ,@c)))))
;;  (((x 1 2 3 4 5 6 7 8 9 10) 
;;         11 12 13 14 15 16 17 18 19 20 -11) 
;;             21 22 23 24 25 26 27 28 29 30 -30 -31)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 -11 21
; 22 23 24 25 26 27 28 29 30 -30 -31)

; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)

;;  (define x (lambda a (lambda b (lambda c
;;      `(,@a ,@b ,@c)))))
;;  (((x 1 2 3 4 5 6 7 8 9 10) 
;;         11 12 13 14 15 16 17 18 19 20 21) 
;;             21 22 23 24 25 26 27 28 29 30 31 32)
; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 21 22
; 23 24 25 26 27 28 29 30 31 32)

; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)

;; (define x (lambda a (lambda b (lambda c
;;      `(,@a ,@b ,@c)))))
;; (((x 1 2 3 4 5 6 7 8 9 10 11 12)
;;     21 22 23 24 25 26 27 28 29 30 31 32)
;;         31 32 33 34 35 36 37 38 39 40 41 42)
; (1 2 3 4 5 6 7 8 9 10 11 12 21 22 23 24 25 26 27 28 29 30 31
; 32 31 32 33 34 35 36 37 38 39 40 41 42)

; (1 2 3 4 5 6 7 8 9 10 11 12 21 22 23 24 25 26 27 28 29 30 31 32 31 32 33 34 35 36 37 38 39 40 41 42)

;; (define x (lambda a (lambda b (lambda c
;;      `(,@a ,@b ,@c)))))
;; (((x 1)
;;     21 22)
;;         31 32 33 34 35 36)
; (1 21 22 31 32 33 34 35 36)
; (1 21 31)

;; (define x (lambda a (lambda b
;;      `(,@a ,@b))))
;; ((x 1)
;;     21 22)
; (1 21 22)
; (1 21)

; the bug is that next applic think that it will got the same number of params like the previous,
; covered lambda: 1 param
; inner lambda: 2 params
; take from inner lambda only one param

;; (define x (lambda a (lambda b
;;      b )))
;; ((x 1)
;;     2 3) ; (2 3)
;;          ; (2 3)

;; ((lambda x x) 1)

;; Idea for impelemt- after create pairs, clean the stack of only opt args in.
;; so, in the next application, only <nArgs> + 1 params in the stack.
;; so, need to-
;; after application, 
;; add rsp, 8 * (<nArgs> - (<nParams> + 1))

;; (define x (lambda a (lambda b
;;      b )))
;; ((x 1 2 3 4 5 6)
;;     1 2 3 4 5 6 7 8 9 10 11 12 13)
; (1 2 3 4 5 6 7 8 9 10 11 12 13)
; (((((((((((((() . 1) . 2) . 3) . 4) . 5) . 6) . 7) . 8) . 9) . 10) . 11) . 12) . 13)


;; (define x (lambda a (lambda b
;;      `(,@a ,@b))))
;; ((x 1)
;;     21 22)

;; ((lambda a `(,@a)) 1 2 3)
; (1 2 3)
; new implematation do not support ,@ : |

    ;; ((lambda a a)1 2)


; (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 
; 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60)

;; ((lambda (x)
;;     (+ 1 1)
;;     (+ 3 0)) 1)

;; (apply (lambda x x) '(3 4))
;; '()

;; (+ 1 2 3 4)

;; (apply (lambda(x)x) 5 '())

;; (define foo5
;;     (lambda (x y)
;;         (lambda () y)
;;         (lambda () x)))
;; ((foo5 1 2))
; 1

;; ((lambda(x)
;;     ((lambda(y z)
;;         x)1 2)) 3)
; 3

;; ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) d))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6)
; 10
; 10

;;  ((((lambda (x y d e f g h i j k l m n o p) (lambda (z) (lambda (a b c) m))) 1 2 10 20 30 40 50 60 70 80 90 100 120 130 140) 3)4 5 6)
; 100
; 100

;; (apply - `(3 ,@(append '(4 4) '(4))))
; -9
; -1

;; (define foo5
;;             (lambda (x y)
;;                 (lambda () 
;;                         "\n \r \f this is \n \r \f "
;;                         (set! x 5))
;;                 (lambda () x)
;;             ))

;; ((foo5 1 2)) 
; 1

;; (apply (lambda x x) '())

;; ((lambda x
;;     (lambda y
;;         y) 1) 2)

; T_421
;; (((lambda (x) 
;;                 (lambda (y . z) 
;;                 (if `notbool (+ (+ x  (* y (car z)) (car (cdr z))) 9)))) 8) 10 11 12)
; 139

; T_455
    ;;  (define andmap (lambda (p lst)
    ;;                   (or (null? lst)
    ;;                       (and (p (car lst)) (andmap p (cdr lst)))) ))
    ;;           ; make-matrix creates a matrix (a vector of vectors).
    ;;           ; make-matrix creates a matrix (a vector of vectors).
    ;;           (define make-matrix
    ;;             (lambda (rows columns)
    ;;             (letrec ([loop (lambda (m i)
    ;;             (if (= i rows)
    ;;                 (begin m)
    ;;                 (begin
    ;;                   (vector-set! m i (make-vector columns))
    ;;                   (loop m (+ i 1)))))])
    ;;           (loop (make-vector rows) 0))))

    ;;           ; matrix? checks to see if its argument is a matrix.
    ;;           ; It isn't foolproof, but it's generally good enough.
    ;;           (define matrix?
    ;;             (lambda (x)
    ;;               (and (vector? x)
    ;;                   (> (vector-length x) 0)
    ;;                   (vector? (vector-ref x 0)))))

    ;;           ; matrix-rows returns the number of rows in a matrix.
    ;;           (define matrix-rows
    ;;             (lambda (x)
    ;;               (vector-length x)))

    ;;           ; matrix-columns returns the number of columns in a matrix.
    ;;           (define matrix-columns
    ;;             (lambda (x)
    ;;               (vector-length (vector-ref x 0))))

    ;;           ; matrix-ref returns the jth element of the ith row.
    ;;           (define matrix-ref
    ;;             (lambda (m i j)
    ;;               (vector-ref (vector-ref m i) j)))

    ;;           ; matrix-set! changes the jth element of the ith row.
    ;;           (define matrix-set!
    ;;             (lambda (m i j x)
    ;;               (vector-set! (vector-ref m i) j x)))

    ;;           ; mat-sca-mul multiplies a matrix by a scalar.
    ;;           (define mat-sca-mul
    ;;             (lambda (x m)
    ;;               (let* ([nr (matrix-rows m)]
    ;;                     [nc (matrix-columns m)]
    ;;                     [r (make-matrix nr nc)])
    ;;                     (letrec ([loop (lambda (i)
    ;;                     (if (= i nr)
    ;;                         (begin r)
    ;;                         (begin
    ;;                             (letrec ([loop2 (lambda (j)
    ;;                             (if (= j nc)
    ;;                                 #t
    ;;                                 (begin
    ;;                                   (matrix-set! r i j (* x (matrix-ref m i j)))
    ;;                                   (loop2 (+ j 1)))))])
    ;;             (loop2 0))
    ;;                           (loop (+ i 1)))))])
    ;;           (loop 0)))))

    ;;           ; mat-mat-mul multiplies one matrix by another, after verifying
    ;;           ; that the first matrix has as many columns as the second
    ;;           ; matrix has rows.
    ;;           (define mat-mat-mul
    ;;             (lambda (m1 m2)
    ;;               (let* ([nr1 (matrix-rows m1)]
    ;;                     [nr2 (matrix-rows m2)]
    ;;                     [nc2 (matrix-columns m2)]
    ;;                     [r (make-matrix nr1 nc2)])
    ;;                     (letrec ([loop (lambda (i)
    ;;                     (if (= i nr1)
    ;;                         (begin r)
    ;;                         (begin
    ;;                             (letrec ([loop (lambda (j)
    ;;                             (if (= j nc2)
    ;;                                 #t
    ;;                                 (begin
    ;;                                     (letrec ([loop (lambda (k a)
    ;;                                     (if (= k nr2)
    ;;                                         (begin (matrix-set! r i j a))
    ;;                                         (begin
    ;;                                           (loop
    ;;                                             (+ k 1)
    ;;                                             (+ a
    ;;                                               (* (matrix-ref m1 i k)
    ;;                                                   (matrix-ref m2 k j)))))))])
    ;;                                         (loop 0 0))
    ;;                                   (loop (+ j 1)))))])
    ;;                             (loop 0))
    ;;                     (loop (+ i 1)))))])
    ;;           (loop 0)))))


    ;;             ; mul is the generic matrix/scalar multiplication procedure
    ;;             (define mul
    ;;               (lambda (x y)
    ;;                 (cond
    ;;                   [(number? x)
    ;;                   (cond
    ;;                     [(number? y) (* x y)]
    ;;                     [(matrix? y) (mat-sca-mul x y)]
    ;;                     [else "this should be an error, but you don't support exceptions"])]
    ;;                   [(matrix? x)
    ;;                   (cond
    ;;                     [(number? y) (mat-sca-mul y x)]
    ;;                     [(matrix? y) (mat-mat-mul x y)]
    ;;                     [else "this should be an error, but you don't support exceptions"])]
    ;;                   [else "this should be an error, but you don't support exceptions"])))


            ;;     (mul '#(#(2 3 4)
            ;;     #(3 4 5))
            ;;   '#(#(1) #(2) #(3)))
              ; #(#(20) #(26))

            ;;   (mul '#(#(1 2 3))
            ;;       '#(#(2 3)
            ;;           #(3 4)
            ;;           #(4 5)))
            ; #(#(20 26))

            ;;   (mul '#(#(1 2 3)
            ;;           #(4 5 6))
            ;;       '#(#(1 2 3 4)
            ;;           #(2 3 4 5)
            ;;           #(3 4 5 6)))
            ;#(#(14 20 26 32) #(32 47 62 77))

            ;;   (mul -2
            ;;     '#(#(3 -2 -1)
            ;;       #(-3 0 -5)
            ;;       #(7 -1 -1))
            ;;       )
            ; #(#(-6 4 2) #(6 0 10) #(-14 2 2))

                ;;   (mul 0.5 '#(#(1 2 3)) )
                ;;   ; #(#(0.5 1.0 1.5))
                ;;   ; #(#(0 1 1))

                ;;   (mul 1 0.5)
                ;;     ; 0.5
                ;;     ; 0

;; ; T_47
   
;;             (define x_0 0)
;;             (define x_1 1)
;;             (define x_2 2)
;;             (define x_3 3)
;;             (define x_4 4)
;;             (define x_5 5)
;;             (define x_6 6)
;;             (define x_7 7)
;;             (define x_8 8)
;;             (define x_9 9)
;;             (define x_10 10)
;;             (define x_11 11)
;;             (define x_12 12)
;;             (define x_13 13)
;;             (define x_14 14)
;;             (define x_15 15)
;;             (define x_16 16)
;;             (define x_17 17)
;;             (define x_18 18)
;;             (define x_19 19)
;;             (define x_20 20)
;;             (define x_21 21)
;;             (define x_22 22)
;;             (define x_23 23)
;;             (define x_24 24)
;;             (define x_25 25)
;;             (define x_26 26)
;;             (define x_27 27)
;;             (define x_28 28)
;;             (define x_29 29)
;;             (define x_30 30)
;;             (define x_31 31)
;;             (define x_32 32)
;;             (define x_33 33)
;;             (define x_34 34)
;;             (define x_35 35)
;;             (define x_36 36)
;;             (define x_37 37)
;;             (define x_38 38)
;;             (define x_39 39)
;;             (define x_40 40)
;;             (define x_41 41)
;;             (define x_42 42)
;;             (define x_43 43)
;;             (define x_44 44)
;;             (define x_45 45)
;;             (define x_46 46)
;;             (define x_47 47)
;;             (define x_48 48)
;;             (define x_49 49)
;;             (define x_50 50)
;;             (define x_51 51)
;;             (define x_52 52)
;;             (define x_53 53)
;;             (define x_54 54)
;;             (define x_55 55)
;;             (define x_56 56)
;;             (define x_57 57)
;;             (define x_58 58)
;;             (define x_59 59)
;;             (define x_60 60)
;;             (define x_61 61)
;;             (define x_62 62)
;;             (define x_63 63)
;;             (define x_64 64)
;;             (define x_65 65)
;;             (define x_66 66)
;;             (define x_67 67)
;;             (define x_68 68)
;;             (define x_69 69)
;;             (define x_70 70)
;;             (define x_71 71)
;;             (define x_72 72)
;;             (define x_73 73)
;;             (define x_74 74)
;;             (define x_75 75)
;;             (define x_76 76)
;;             (define x_77 77)
;;             (define x_78 78)
;;             (define x_79 79)
;;             (define x_80 80)
;;             (define x_81 81)
;;             (define x_82 82)
;;             (define x_83 83)
;;             (define x_84 84)
;;             (define x_85 85)
;;             (define x_86 86)
;;             (define x_87 87)
;;             (define x_88 88)
;;             (define x_89 89)
;;             (define x_90 90)
;;             (define x_91 91)
;;             (define x_92 92)
;;             (define x_93 93)
;;             (define x_94 94)
;;             (define x_95 95)
;;             (define x_96 96)
;;             (define x_97 97)
;;             (define x_98 98)
;;             (define x_99 99)
;;             (define x_100 100)
;;             (define x_101 101)
;;             (define x_102 102)
;;             (define x_103 103)
;;             (define x_104 104)
;;             (define x_105 105)
;;             (define x_106 106)
;;             (define x_107 107)
;;             (define x_108 108)
;;             (define x_109 109)
;;             (define x_110 110)
;;             (define x_111 111)
;;             (define x_112 112)
;;             (define x_113 113)
;;             (define x_114 114)
;;             (define x_115 115)
;;             (define x_116 116)
;;             (define x_117 117)
;;             (define x_118 118)
;;             (define x_119 119)
;;             (define x_120 120)
;;             (define x_121 121)
;;             (define x_122 122)
;;             (define x_123 123)
;;             (define x_124 124)
;;             (define x_125 125)
;;             (define x_126 126)
;;             (define x_127 127)
;;             (define x_128 128)
;;             (define x_129 129)
;;             (define x_130 130)
;;             (define x_131 131)
;;             (define x_132 132)
;;             (define x_133 133)
;;             (define x_134 134)
;;             (define x_135 135)
;;             (define x_136 136)
;;             (define x_137 137)
;;             (define x_138 138)
;;             (define x_139 139)
;;             (define x_140 140)
;;             (define x_141 141)
;;             (define x_142 142)
;;             (define x_143 143)
;;             (define x_144 144)
;;             (define x_145 145)
;;             (define x_146 146)
;;             (define x_147 147)
;;             (define x_148 148)
;;             (define x_149 149)
;;             (define x_150 150)
;;             (define x_151 151)
;;             (define x_152 152)
;;             (define x_153 153)
;;             (define x_154 154)
;;             (define x_155 155)
;;             (define x_156 156)
;;             (define x_157 157)
;;             (define x_158 158)
;;             (define x_159 159)
;;             (define x_160 160)
;;             (define x_161 161)
;;             (define x_162 162)
;;             (define x_163 163)
;;             (define x_164 164)
;;             (define x_165 165)
;;             (define x_166 166)
;;             (define x_167 167)
;;             (define x_168 168)
;;             (define x_169 169)
;;             (define x_170 170)
;;             (define x_171 171)
;;             (define x_172 172)
;;             (define x_173 173)
;;             (define x_174 174)
;;             (define x_175 175)
;;             (define x_176 176)
;;             (define x_177 177)
;;             (define x_178 178)
;;             (define x_179 179)
;;             (define x_180 180)
;;             (define x_181 181)
;;             (define x_182 182)
;;             (define x_183 183)
;;             (define x_184 184)
;;             (define x_185 185)
;;             (define x_186 186)
;;             (define x_187 187)
;;             (define x_188 188)
;;             (define x_189 189)
;;             (define x_190 190)
;;             (define x_191 191)
;;             (define x_192 192)
;;             (define x_193 193)
;;             (define x_194 194)
;;             (define x_195 195)
;;             (define x_196 196)
;;             (define x_197 197)
;;             (define x_198 198)
;;             (define x_199 199)
;;             (define x_200 200)
;;             (define x_201 201)
;;             (define x_202 202)
;;             (define x_203 203)
;;             (define x_204 204)
;;             (define x_205 205)
;;             (define x_206 206)
;;             (define x_207 207)
;;             (define x_208 208)
;;             (define x_209 209)
;;             (define x_210 210)
;;             (define x_211 211)
;;             (define x_212 212)
;;             (define x_213 213)
;;             (define x_214 214)
;;             (define x_215 215)
;;             (define x_216 216)
;;             (define x_217 217)
;;             (define x_218 218)
;;             (define x_219 219)
;;             (define x_220 220)
;;             (define x_221 221)
;;             (define x_222 222)
;;             (define x_223 223)
;;             (define x_224 224)
;;             (define x_225 225)
;;             (define x_226 226)
;;             (define x_227 227)
;;             (define x_228 228)
;;             (define x_229 229)
;;             (define x_230 230)
;;             (define x_231 231)
;;             (define x_232 232)
;;             (define x_233 233)
;;             (define x_234 234)
;;             (define x_235 235)
;;             (define x_236 236)
;;             (define x_237 237)
;;             (define x_238 238)
;;             (define x_239 239)
;;             (define x_240 240)
;;             (define x_241 241)
;;             (define x_242 242)
;;             (define x_243 243)
;;             (define x_244 244)
;;             (define x_245 245)
;;             (define x_246 246)
;;             (define x_247 247)
;;             (define x_248 248)
;;             (define x_249 249)
;;             (define x_250 250)
;;             (define x_251 251)
;;             (define x_252 252)
;;             (define x_253 253)
;;             (define x_254 254)
;;             (define x_255 255)
;;             (define x_256 256)
;;             (define x_257 257)
;;             (define x_258 258)
;;             (define x_259 259)
;;             (define x_260 260)
;;             (define x_261 261)
;;             (define x_262 262)
;;             (define x_263 263)
;;             (define x_264 264)
;;             (define x_265 265)
;;             (define x_266 266)
;;             (define x_267 267)
;;             (define x_268 268)
;;             (define x_269 269)
;;             (define x_270 270)
;;             (define x_271 271)
;;             (define x_272 272)
;;             (define x_273 273)
;;             (define x_274 274)
;;             (define x_275 275)
;;             (define x_276 276)
;;             (define x_277 277)
;;             (define x_278 278)
;;             (define x_279 279)
;;             (define x_280 280)
;;             (define x_281 281)
;;             (define x_282 282)
;;             (define x_283 283)
;;             (define x_284 284)
;;             (define x_285 285)
;;             (define x_286 286)
;;             (define x_287 287)
;;             (define x_288 288)
;;             (define x_289 289)
;;             (define x_290 290)
;;             (define x_291 291)
;;             (define x_292 292)
;;             (define x_293 293)
;;             (define x_294 294)
;;             (define x_295 295)
;;             (define x_296 296)
;;             (define x_297 297)
;;             (define x_298 298)
;;             (define x_299 299)
;;             (define x_300 300)
;;             (define x_301 301)
;;             (define x_302 302)
;;             (define x_303 303)
;;             (define x_304 304)
;;             (define x_305 305)
;;             (define x_306 306)
;;             (define x_307 307)
;;             (define x_308 308)
;;             (define x_309 309)
;;             (define x_310 310)
;;             (define x_311 311)
;;             (define x_312 312)
;;             (define x_313 313)
;;             (define x_314 314)
;;             (define x_315 315)
;;             (define x_316 316)
;;             (define x_317 317)
;;             (define x_318 318)
;;             (define x_319 319)
;;             (define x_320 320)
;;             (define x_321 321)
;;             (define x_322 322)
;;             (define x_323 323)
;;             (define x_324 324)
;;             (define x_325 325)
;;             (define x_326 326)
;;             (define x_327 327)
;;             (define x_328 328)
;;             (define x_329 329)
;;             (define x_330 330)
;;             (define x_331 331)
;;             (define x_332 332)
;;             (define x_333 333)
;;             (define x_334 334)
;;             (define x_335 335)
;;             (define x_336 336)
;;             (define x_337 337)
;;             (define x_338 338)
;;             (define x_339 339)
;;             (define x_340 340)
;;             (define x_341 341)
;;             (define x_342 342)
;;             (define x_343 343)
;;             (define x_344 344)
;;             (define x_345 345)
;;             (define x_346 346)
;;             (define x_347 347)
;;             (define x_348 348)
;;             (define x_349 349)
;;             (define x_350 350)
;;             (define x_351 351)
;;             (define x_352 352)
;;             (define x_353 353)
;;             (define x_354 354)
;;             (define x_355 355)
;;             (define x_356 356)
;;             (define x_357 357)
;;             (define x_358 358)
;;             (define x_359 359)
;;             (define x_360 360)
;;             (define x_361 361)
;;             (define x_362 362)
;;             (define x_363 363)
;;             (define x_364 364)
;;             (define x_365 365)
;;             (define x_366 366)
;;             (define x_367 367)
;;             (define x_368 368)
;;             (define x_369 369)
;;             (define x_370 370)
;;             (define x_371 371)
;;             (define x_372 372)
;;             (define x_373 373)
;;             (define x_374 374)
;;             (define x_375 375)
;;             (define x_376 376)
;;             (define x_377 377)
;;             (define x_378 378)
;;             (define x_379 379)
;;             (define x_380 380)
;;             (define x_381 381)
;;             (define x_382 382)
;;             (define x_383 383)
;;             (define x_384 384)
;;             (define x_385 385)
;;             (define x_386 386)
;;             (define x_387 387)
;;             (define x_388 388)
;;             (define x_389 389)
;;             (define x_390 390)
;;             (define x_391 391)
;;             (define x_392 392)
;;             (define x_393 393)
;;             (define x_394 394)
;;             (define x_395 395)
;;             (define x_396 396)
;;             (define x_397 397)
;;             (define x_398 398)
;;             (define x_399 399)     

;;             (set! x_0 -0)
;;             (set! x_1 -1)
;;             (set! x_2 -2)
;;             (set! x_3 -3)
;;             (set! x_4 -4)
;;             (set! x_5 -5)
;;             (set! x_6 -6)
;;             (set! x_7 -7)
;;             (set! x_8 -8)
;;             (set! x_9 -9)
;;             (set! x_10 -10)
;;             (set! x_11 -11)
;;             (set! x_12 -12)
;;             (set! x_13 -13)
;;             (set! x_14 -14)
;;             (set! x_15 -15)
;;             (set! x_16 -16)
;;             (set! x_17 -17)
;;             (set! x_18 -18)
;;             (set! x_19 -19)
;;             (set! x_20 -20)
;;             (set! x_21 -21)
;;             (set! x_22 -22)
;;             (set! x_23 -23)
;;             (set! x_24 -24)
;;             (set! x_25 -25)
;;             (set! x_26 -26)
;;             (set! x_27 -27)
;;             (set! x_28 -28)
;;             (set! x_29 -29)
;;             (set! x_30 -30)
;;             (set! x_31 -31)
;;             (set! x_32 -32)
;;             (set! x_33 -33)
;;             (set! x_34 -34)
;;             (set! x_35 -35)
;;             (set! x_36 -36)
;;             (set! x_37 -37)
;;             (set! x_38 -38)
;;             (set! x_39 -39)
;;             (set! x_40 -40)
;;             (set! x_41 -41)
;;             (set! x_42 -42)
;;             (set! x_43 -43)
;;             (set! x_44 -44)
;;             (set! x_45 -45)
;;             (set! x_46 -46)
;;             (set! x_47 -47)
;;             (set! x_48 -48)
;;             (set! x_49 -49)
;;             (set! x_50 -50)
;;             (set! x_51 -51)
;;             (set! x_52 -52)
;;             (set! x_53 -53)
;;             (set! x_54 -54)
;;             (set! x_55 -55)
;;             (set! x_56 -56)
;;             (set! x_57 -57)
;;             (set! x_58 -58)
;;             (set! x_59 -59)
;;             (set! x_60 -60)
;;             (set! x_61 -61)
;;             (set! x_62 -62)
;;             (set! x_63 -63)
;;             (set! x_64 -64)
;;             (set! x_65 -65)
;;             (set! x_66 -66)
;;             (set! x_67 -67)
;;             (set! x_68 -68)
;;             (set! x_69 -69)
;;             (set! x_70 -70)
;;             (set! x_71 -71)
;;             (set! x_72 -72)
;;             (set! x_73 -73)
;;             (set! x_74 -74)
;;             (set! x_75 -75)
;;             (set! x_76 -76)
;;             (set! x_77 -77)
;;             (set! x_78 -78)
;;             (set! x_79 -79)
;;             (set! x_80 -80)
;;             (set! x_81 -81)
;;             (set! x_82 -82)
;;             (set! x_83 -83)
;;             (set! x_84 -84)
;;             (set! x_85 -85)
;;             (set! x_86 -86)
;;             (set! x_87 -87)
;;             (set! x_88 -88)
;;             (set! x_89 -89)
;;             (set! x_90 -90)
;;             (set! x_91 -91)
;;             (set! x_92 -92)
;;             (set! x_93 -93)
;;             (set! x_94 -94)
;;             (set! x_95 -95)
;;             (set! x_96 -96)
;;             (set! x_97 -97)
;;             (set! x_98 -98)
;;             (set! x_99 -99)
;;             (set! x_100 -100)
;;             (set! x_101 -101)
;;             (set! x_102 -102)
;;             (set! x_103 -103)
;;             (set! x_104 -104)
;;             (set! x_105 -105)
;;             (set! x_106 -106)
;;             (set! x_107 -107)
;;             (set! x_108 -108)
;;             (set! x_109 -109)
;;             (set! x_110 -110)
;;             (set! x_111 -111)
;;             (set! x_112 -112)
;;             (set! x_113 -113)
;;             (set! x_114 -114)
;;             (set! x_115 -115)
;;             (set! x_116 -116)
;;             (set! x_117 -117)
;;             (set! x_118 -118)
;;             (set! x_119 -119)
;;             (set! x_120 -120)
;;             (set! x_121 -121)
;;             (set! x_122 -122)
;;             (set! x_123 -123)
;;             (set! x_124 -124)
;;             (set! x_125 -125)
;;             (set! x_126 -126)
;;             (set! x_127 -127)
;;             (set! x_128 -128)
;;             (set! x_129 -129)
;;             (set! x_130 -130)
;;             (set! x_131 -131)
;;             (set! x_132 -132)
;;             (set! x_133 -133)
;;             (set! x_134 -134)
;;             (set! x_135 -135)
;;             (set! x_136 -136)
;;             (set! x_137 -137)
;;             (set! x_138 -138)
;;             (set! x_139 -139)
;;             (set! x_140 -140)
;;             (set! x_141 -141)
;;             (set! x_142 -142)
;;             (set! x_143 -143)
;;             (set! x_144 -144)
;;             (set! x_145 -145)
;;             (set! x_146 -146)
;;             (set! x_147 -147)
;;             (set! x_148 -148)
;;             (set! x_149 -149)
;;             (set! x_150 -150)
;;             (set! x_151 -151)
;;             (set! x_152 -152)
;;             (set! x_153 -153)
;;             (set! x_154 -154)
;;             (set! x_155 -155)
;;             (set! x_156 -156)
;;             (set! x_157 -157)
;;             (set! x_158 -158)
;;             (set! x_159 -159)
;;             (set! x_160 -160)
;;             (set! x_161 -161)
;;             (set! x_162 -162)
;;             (set! x_163 -163)
;;             (set! x_164 -164)
;;             (set! x_165 -165)
;;             (set! x_166 -166)
;;             (set! x_167 -167)
;;             (set! x_168 -168)
;;             (set! x_169 -169)
;;             (set! x_170 -170)
;;             (set! x_171 -171)
;;             (set! x_172 -172)
;;             (set! x_173 -173)
;;             (set! x_174 -174)
;;             (set! x_175 -175)
;;             (set! x_176 -176)
;;             (set! x_177 -177)
;;             (set! x_178 -178)
;;             (set! x_179 -179)
;;             (set! x_180 -180)
;;             (set! x_181 -181)
;;             (set! x_182 -182)
;;             (set! x_183 -183)
;;             (set! x_184 -184)
;;             (set! x_185 -185)
;;             (set! x_186 -186)
;;             (set! x_187 -187)
;;             (set! x_188 -188)
;;             (set! x_189 -189)
;;             (set! x_190 -190)
;;             (set! x_191 -191)
;;             (set! x_192 -192)
;;             (set! x_193 -193)
;;             (set! x_194 -194)
;;             (set! x_195 -195)
;;             (set! x_196 -196)
;;             (set! x_197 -197)
;;             (set! x_198 -198)
;;             (set! x_199 -199)
;;             (set! x_200 -200)
;;             (set! x_201 -201)
;;             (set! x_202 -202)
;;             (set! x_203 -203)
;;             (set! x_204 -204)
;;             (set! x_205 -205)
;;             (set! x_206 -206)
;;             (set! x_207 -207)
;;             (set! x_208 -208)
;;             (set! x_209 -209)
;;             (set! x_210 -210)
;;             (set! x_211 -211)
;;             (set! x_212 -212)
;;             (set! x_213 -213)
;;             (set! x_214 -214)
;;             (set! x_215 -215)
;;             (set! x_216 -216)
;;             (set! x_217 -217)
;;             (set! x_218 -218)
;;             (set! x_219 -219)
;;             (set! x_220 -220)
;;             (set! x_221 -221)
;;             (set! x_222 -222)
;;             (set! x_223 -223)
;;             (set! x_224 -224)
;;             (set! x_225 -225)
;;             (set! x_226 -226)
;;             (set! x_227 -227)
;;             (set! x_228 -228)
;;             (set! x_229 -229)
;;             (set! x_230 -230)
;;             (set! x_231 -231)
;;             (set! x_232 -232)
;;             (set! x_233 -233)
;;             (set! x_234 -234)
;;             (set! x_235 -235)
;;             (set! x_236 -236)
;;             (set! x_237 -237)
;;             (set! x_238 -238)
;;             (set! x_239 -239)
;;             (set! x_240 -240)
;;             (set! x_241 -241)
;;             (set! x_242 -242)
;;             (set! x_243 -243)
;;             (set! x_244 -244)
;;             (set! x_245 -245)
;;             (set! x_246 -246)
;;             (set! x_247 -247)
;;             (set! x_248 -248)
;;             (set! x_249 -249)
;;             (set! x_250 -250)
;;             (set! x_251 -251)
;;             (set! x_252 -252)
;;             (set! x_253 -253)
;;             (set! x_254 -254)
;;             (set! x_255 -255)
;;             (set! x_256 -256)
;;             (set! x_257 -257)
;;             (set! x_258 -258)
;;             (set! x_259 -259)
;;             (set! x_260 -260)
;;             (set! x_261 -261)
;;             (set! x_262 -262)
;;             (set! x_263 -263)
;;             (set! x_264 -264)
;;             (set! x_265 -265)
;;             (set! x_266 -266)
;;             (set! x_267 -267)
;;             (set! x_268 -268)
;;             (set! x_269 -269)
;;             (set! x_270 -270)
;;             (set! x_271 -271)
;;             (set! x_272 -272)
;;             (set! x_273 -273)
;;             (set! x_274 -274)
;;             (set! x_275 -275)
;;             (set! x_276 -276)
;;             (set! x_277 -277)
;;             (set! x_278 -278)
;;             (set! x_279 -279)
;;             (set! x_280 -280)
;;             (set! x_281 -281)
;;             (set! x_282 -282)
;;             (set! x_283 -283)
;;             (set! x_284 -284)
;;             (set! x_285 -285)
;;             (set! x_286 -286)
;;             (set! x_287 -287)
;;             (set! x_288 -288)
;;             (set! x_289 -289)
;;             (set! x_290 -290)
;;             (set! x_291 -291)
;;             (set! x_292 -292)
;;             (set! x_293 -293)
;;             (set! x_294 -294)
;;             (set! x_295 -295)
;;             (set! x_296 -296)
;;             (set! x_297 -297)
;;             (set! x_298 -298)
;;             (set! x_299 -299)
;;             (set! x_300 -300)
;;             (set! x_301 -301)
;;             (set! x_302 -302)
;;             (set! x_303 -303)
;;             (set! x_304 -304)
;;             (set! x_305 -305)
;;             (set! x_306 -306)
;;             (set! x_307 -307)
;;             (set! x_308 -308)
;;             (set! x_309 -309)
;;             (set! x_310 -310)
;;             (set! x_311 -311)
;;             (set! x_312 -312)
;;             (set! x_313 -313)
;;             (set! x_314 -314)
;;             (set! x_315 -315)
;;             (set! x_316 -316)
;;             (set! x_317 -317)
;;             (set! x_318 -318)
;;             (set! x_319 -319)
;;             (set! x_320 -320)
;;             (set! x_321 -321)
;;             (set! x_322 -322)
;;             (set! x_323 -323)
;;             (set! x_324 -324)
;;             (set! x_325 -325)
;;             (set! x_326 -326)
;;             (set! x_327 -327)
;;             (set! x_328 -328)
;;             (set! x_329 -329)
;;             (set! x_330 -330)
;;             (set! x_331 -331)
;;             (set! x_332 -332)
;;             (set! x_333 -333)
;;             (set! x_334 -334)
;;             (set! x_335 -335)
;;             (set! x_336 -336)
;;             (set! x_337 -337)
;;             (set! x_338 -338)
;;             (set! x_339 -339)
;;             (set! x_340 -340)
;;             (set! x_341 -341)
;;             (set! x_342 -342)
;;             (set! x_343 -343)
;;             (set! x_344 -344)
;;             (set! x_345 -345)
;;             (set! x_346 -346)
;;             (set! x_347 -347)
;;             (set! x_348 -348)
;;             (set! x_349 -349)
;;             (set! x_350 -350)
;;             (set! x_351 -351)
;;             (set! x_352 -352)
;;             (set! x_353 -353)
;;             (set! x_354 -354)
;;             (set! x_355 -355)
;;             (set! x_356 -356)
;;             (set! x_357 -357)
;;             (set! x_358 -358)
;;             (set! x_359 -359)
;;             (set! x_360 -360)
;;             (set! x_361 -361)
;;             (set! x_362 -362)
;;             (set! x_363 -363)
;;             (set! x_364 -364)
;;             (set! x_365 -365)
;;             (set! x_366 -366)
;;             (set! x_367 -367)
;;             (set! x_368 -368)
;;             (set! x_369 -369)
;;             (set! x_370 -370)
;;             (set! x_371 -371)
;;             (set! x_372 -372)
;;             (set! x_373 -373)
;;             (set! x_374 -374)
;;             (set! x_375 -375)
;;             (set! x_376 -376)
;;             (set! x_377 -377)
;;             (set! x_378 -378)
;;             (set! x_379 -379)
;;             (set! x_380 -380)
;;             (set! x_381 -381)
;;             (set! x_382 -382)
;;             (set! x_383 -383)
;;             (set! x_384 -384)
;;             (set! x_385 -385)
;;             (set! x_386 -386)
;;             (set! x_387 -387)
;;             (set! x_388 -388)
;;             (set! x_389 -389)
;;             (set! x_390 -390)
;;             (set! x_391 -391)
;;             (set! x_392 -392)
;;             (set! x_393 -393)
;;             (set! x_394 -394)
;;             (set! x_395 -395)
;;             (set! x_396 -396)
;;             (set! x_397 -397)
;;             (set! x_398 -398)
;;             (set! x_399 -399)

;;             x_0
;;             x_1
;;             x_2
;;             x_3
;;             x_4
;;             x_5
;;             x_6
;;             x_7
;;             x_8
;;             x_9
;;             x_10
;;             x_11
;;             x_12
;;             x_13
;;             x_14
;;             x_15
;;             x_16
;;             x_17
;;             x_18
;;             x_19
;;             x_20
;;             x_21
;;             x_22
;;             x_23
;;             x_24
;;             x_25
;;             x_26
;;             x_27
;;             x_28
;;             x_29
;;             x_30
;;             x_31
;;             x_32
;;             x_33
;;             x_34
;;             x_35
;;             x_36
;;             x_37
;;             x_38
;;             x_39
;;             x_40
;;             x_41
;;             x_42
;;             x_43
;;             x_44
;;             x_45
;;             x_46
;;             x_47
;;             x_48
;;             x_49
;;             x_50
;;             x_51
;;             x_52
;;             x_53
;;             x_54
;;             x_55
;;             x_56
;;             x_57
;;             x_58
;;             x_59
;;             x_60
;;             x_61
;;             x_62
;;             x_63
;;             x_64
;;             x_65
;;             x_66
;;             x_67
;;             x_68
;;             x_69
;;             x_70
;;             x_71
;;             x_72
;;             x_73
;;             x_74
;;             x_75
;;             x_76
;;             x_77
;;             x_78
;;             x_79
;;             x_80
;;             x_81
;;             x_82
;;             x_83
;;             x_84
;;             x_85
;;             x_86
;;             x_87
;;             x_88
;;             x_89
;;             x_90
;;             x_91
;;             x_92
;;             x_93
;;             x_94
;;             x_95
;;             x_96
;;             x_97
;;             x_98
;;             x_99
;;             x_100
;;             x_101
;;             x_102
;;             x_103
;;             x_104
;;             x_105
;;             x_106
;;             x_107
;;             x_108
;;             x_109
;;             x_110
;;             x_111
;;             x_112
;;             x_113
;;             x_114
;;             x_115
;;             x_116
;;             x_117
;;             x_118
;;             x_119
;;             x_120
;;             x_121
;;             x_122
;;             x_123
;;             x_124
;;             x_125
;;             x_126
;;             x_127
;;             x_128
;;             x_129
;;             x_130
;;             x_131
;;             x_132
;;             x_133
;;             x_134
;;             x_135
;;             x_136
;;             x_137
;;             x_138
;;             x_139
;;             x_140
;;             x_141
;;             x_142
;;             x_143
;;             x_144
;;             x_145
;;             x_146
;;             x_147
;;             x_148
;;             x_149
;;             x_150
;;             x_151
;;             x_152
;;             x_153
;;             x_154
;;             x_155
;;             x_156
;;             x_157
;;             x_158
;;             x_159
;;             x_160
;;             x_161
;;             x_162
;;             x_163
;;             x_164
;;             x_165
;;             x_166
;;             x_167
;;             x_168
;;             x_169
;;             x_170
;;             x_171
;;             x_172
;;             x_173
;;             x_174
;;             x_175
;;             x_176
;;             x_177
;;             x_178
;;             x_179
;;             x_180
;;             x_181
;;             x_182
;;             x_183
;;             x_184
;;             x_185
;;             x_186
;;             x_187
;;             x_188
;;             x_189
;;             x_190
;;             x_191
;;             x_192
;;             x_193
;;             x_194
;;             x_195
;;             x_196
;;             x_197
;;             x_198
;;             x_199
;;             x_200
;;             x_201
;;             x_202
;;             x_203
;;             x_204
;;             x_205
;;             x_206
;;             x_207
;;             x_208
;;             x_209
;;             x_210
;;             x_211
;;             x_212
;;             x_213
;;             x_214
;;             x_215
;;             x_216
;;             x_217
;;             x_218
;;             x_219
;;             x_220
;;             x_221
;;             x_222
;;             x_223
;;             x_224
;;             x_225
;;             x_226
;;             x_227
;;             x_228
;;             x_229
;;             x_230
;;             x_231
;;             x_232
;;             x_233
;;             x_234
;;             x_235
;;             x_236
;;             x_237
;;             x_238
;;             x_239
;;             x_240
;;             x_241
;;             x_242
;;             x_243
;;             x_244
;;             x_245
;;             x_246
;;             x_247
;;             x_248
;;             x_249
;;             x_250
;;             x_251
;;             x_252
;;             x_253
;;             x_254
;;             x_255
;;             x_256
;;             x_257
;;             x_258
;;             x_259
;;             x_260
;;             x_261
;;             x_262
;;             x_263
;;             x_264
;;             x_265
;;             x_266
;;             x_267
;;             x_268
;;             x_269
;;             x_270
;;             x_271
;;             x_272
;;             x_273
;;             x_274
;;             x_275
;;             x_276
;;             x_277
;;             x_278
;;             x_279
;;             x_280
;;             x_281
;;             x_282
;;             x_283
;;             x_284
;;             x_285
;;             x_286
;;             x_287
;;             x_288
;;             x_289
;;             x_290
;;             x_291
;;             x_292
;;             x_293
;;             x_294
;;             x_295
;;             x_296
;;             x_297
;;             x_298
;;             x_299
;;             x_300
;;             x_301
;;             x_302
;;             x_303
;;             x_304
;;             x_305
;;             x_306
;;             x_307
;;             x_308
;;             x_309
;;             x_310
;;             x_311
;;             x_312
;;             x_313
;;             x_314
;;             x_315
;;             x_316
;;             x_317
;;             x_318
;;             x_319
;;             x_320
;;             x_321
;;             x_322
;;             x_323
;;             x_324
;;             x_325
;;             x_326
;;             x_327
;;             x_328
;;             x_329
;;             x_330
;;             x_331
;;             x_332
;;             x_333
;;             x_334
;;             x_335
;;             x_336
;;             x_337
;;             x_338
;;             x_339
;;             x_340
;;             x_341
;;             x_342
;;             x_343
;;             x_344
;;             x_345
;;             x_346
;;             x_347
;;             x_348
;;             x_349
;;             x_350
;;             x_351
;;             x_352
;;             x_353
;;             x_354
;;             x_355
;;             x_356
;;             x_357
;;             x_358
;;             x_359
;;             x_360
;;             x_361
;;             x_362
;;             x_363
;;             x_364
;;             x_365
;;             x_366
;;             x_367
;;             x_368
;;             x_369
;;             x_370
;;             x_371
;;             x_372
;;             x_373
;;             x_374
;;             x_375
;;             x_376
;;             x_377
;;             x_378
;;             x_379
;;             x_380
;;             x_381
;;             x_382
;;             x_383
;;             x_384
;;             x_385
;;             x_386
;;             x_387
;;             x_388
;;             x_389
;;             x_390
;;             x_391
;;             x_392
;;             x_393
;;             x_394
;;             x_395
;;             x_396
;;             x_397
;;             x_398
;;             x_399

;; T_69
;; (append '(1 2 3) '() '(1 2 . 3))            ; (1 . (2 . (3 . (1 . (2 . 3)))))

;; (define fact
;;   (let ((x (lambda (x)
;; 	     ((x (lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))))
;; 	      (lambda (x) (lambda (y) x)))))
;; 	(->
;; 	 ((lambda (x) (x x))
;; 	  (lambda (->)
;; 	    (lambda (n)
;; 	      (if (zero? n)
;; 		  (lambda (x) (lambda (y) y))
;; 		  (let ((z ((-> ->) (- n 1))))
;; 		    (lambda (x)
;; 		      (lambda (y)
;; 			(x ((z x) y)))))))))))
;;     (lambda (n)
;;       ((((((((x (x (x (x x)))) (((x (x (x (x x)))) ((x (x (x x))) (x
;;       (x (x (x x)))))) (((x (x (x (x x)))) ((x (x (x x))) (x (x (x x
;;       ))))) (x (x (x (x x))))))) ((x (x (x x))) (x (x (x x))))) ((((
;;       (x (x (x (x x)))) (((x (x (x (x x)))) ((x (x (x x))) (x (x (x
;;       (x x)))))) (((x (x (x (x x)))) ((x (x (x x))) (x (x (x x)))))
;;       (x (x (x (x x))))))) ((x (x (x x))) (x (x (x x))))) (((((x (x
;;       (x (x x)))) (((x (x (x (x x)))) ((x (x (x x))) (x (x (x (x x))
;;       )))) (((x (x (x (x x)))) ((x (x (x x))) (x (x (x x))))) (x (x
;;       (x (x x))))))) ((x (x (x x))) (x (x (x x))))) (((x (x (x (x x)
;;       ))) (x (x (x x)))) (x (x (x x))))) (((x (x (x(x x)))) (((((x (
;;       x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (x (x (x x)))
;;       ) (((x (x (x (x x)))) ((x (x (x x))) (((x(x (x (x x)))) (((x (
;;       x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (((x (x (x (x
;;       x)))) ((x (x (x x))) (x (x (x x))))) (x(x (x (x x))))))) ((x (
;;       x (x x))) (x (x (x x))))))) ((((x (x(x (x x)))) (((x (x (x (x
;;       x)))) ((x (x (x x))) (x (x (x (x x)))))) (((x (x (x (x x)))) (
;;       (x (x (x x))) (x (x (x x))))) (x(x (x (x x))))))) ((x (x (x x)
;;       )) (x (x (x x))))) (((x (x (x (x x)))) (x (x (x x)))) (x (x (x
;;       x))))))) (((((x (x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))
;;       ))) (x (x (x x)))) ((x (x(x (x x)))) (((x (x (x (x x)))) ((x (
;;       x (x x))) (x (x (x (x x)))))) (x (x (x x)))))) (((((x (x (x (x
;;       x)))) (((x (x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (
;;       ((x (x (x (x x)))) ((x (x (x x))) (x (x (x x))))) (x (x (x (x
;;       x))))))) ((x (x (x x))) (x (x (x x))))) (((x (x (x (x x)))) (x
;;       (x (x x)))) (x (x (x x))))) (x (x (x x))))))) (((x (x (x (x x)
;;       ))) (((((x (x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (
;;       x(x (x x)))) (((x(x (x (x x)))) ((x (x (x x))) (x (x (x (x x))
;;       )))) (x (x (x x))))) (((((x (x (x (x x)))) (((x (x (x (x x))))
;;       ((x (x (x x)))(x (x (x (x x)))))) (((x (x (x (x x)))) ((x (x (
;;       x x))) (x (x(x x))))) (x (x (x (x x))))))) ((x (x (x x))) (x (
;;       x (x x)))))(((x (x (x (x x)))) (x (x (x x)))) (x (x (x x)))))
;;       (x (x (x x)))))) (((((x (x (x (x x)))) (((x (x (x (x x)))) ((x
;;       (x (x x)))(x (x (x (x x)))))) (((x (x (x (x x)))) ((x (x (x x)
;;       )) (x (x(x x))))) (x (x (x (x x))))))) ((x (x (x x))) (x (x (x
;;       x)))))(((x (x (x (x x)))) (x (x (x x)))) (x (x (x x))))) ((x (
;;       x (x x))) (((x (x (x (x x)))) (x (x (x x)))) (x (x (x x)))))))
;;       )))(((((x (x (x (x x)))) ((x (x (x x))) (((x (x (x (x x)))) ((
;;       (x(x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (((x (x (x
;;       (x x)))) ((x (x (x x))) (x (x (x x))))) (x (x (x (x x)))))))((
;;       x (x (x x))) (x (x (x x))))))) ((((x (x (x (x x)))) (((x (x(x
;;       (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (((x (x (x (x x)))
;;       )((x (x (x x))) (x (x (x x))))) (x (x (x (x x))))))) ((x(x (x
;;       x))) (x (x (x x))))) (((x (x (x (x x)))) (x (x (x x))))(x (x (
;;       x x)))))) (((x (x (x (x x)))) (((x (x (x (x x)))) ((x (x (x x)
;;       ))(x (x (x (x x)))))) (x (x (x x))))) ((x (x (x x)))(((x (x (x
;;       (x x)))) (x (x (x x)))) (x (x (x x))))))) (((x (x(x (x x)))) (
;;       ((x (x (x (x x)))) ((x (x (x x))) (x (x (x (x x)))))) (x (x (x
;;       x))))) ((x (x (x x))) (((x (x (x (x x)))) (x(x (x x)))) (x (x
;;       (x x))))))))) ((x (x (x x))) (((x (x (x (x x)))) (x (x (x x)))
;;       )(x (x (x x))))))
;; 	 (-> n))
;; 	(lambda (x) (+ x 1))) 0))))

;; (fact 5)
;; ; 120   

;; T_0_Mayer
;; (((((lambda (a)
;;       (lambda (b)
;;         (((lambda (a) (lambda (b) ((a b) (lambda (x) (lambda (y) y)))))
;; 	  ((lambda (n)
;; 	     ((n (lambda (x) (lambda (x) (lambda (y) y))))
;; 	      (lambda (x) (lambda (y) x))))
;; 	   (((lambda (a)
;; 	       (lambda (b)
;; 		 ((b (lambda (n)
;; 		       ((lambda (p) (p (lambda (a) (lambda (b) b))))
;; 			((n (lambda (p)
;; 			      (((lambda (a)
;; 				  (lambda (b) (lambda (c) ((c a) b))))
;; 				((lambda (n)
;; 				   (lambda (s)
;; 				     (lambda (z) (s ((n s) z)))))
;; 				 ((lambda (p)
;; 				    (p (lambda (a) (lambda (b) a))))
;; 				  p)))
;; 			       ((lambda (p)
;; 				  (p (lambda (a) (lambda (b) a))))
;; 				p))))
;; 			 (((lambda (a)
;; 			     (lambda (b) (lambda (c) ((c a) b))))
;; 			   (lambda (x) (lambda (y) y)))
;; 			  (lambda (x) (lambda (y) y)))))))
;; 		  a)))
;; 	     a)
;; 	    b)))
;; 	 ((lambda (n)
;; 	    ((n (lambda (x) (lambda (x) (lambda (y) y))))
;; 	     (lambda (x) (lambda (y) x))))
;; 	  (((lambda (a)
;; 	      (lambda (b)
;; 		((b (lambda (n)
;; 		      ((lambda (p) (p (lambda (a) (lambda (b) b))))
;; 		       ((n (lambda (p)
;; 			     (((lambda (a)
;; 				 (lambda (b) (lambda (c) ((c a) b))))
;; 			       ((lambda (n)
;; 				  (lambda (s)
;; 				    (lambda (z) (s ((n s) z)))))
;; 				((lambda (p)
;; 				   (p (lambda (a) (lambda (b) a))))
;; 				 p)))
;; 			      ((lambda (p)
;; 				 (p (lambda (a) (lambda (b) a))))
;; 			       p))))
;; 			(((lambda (a)
;; 			    (lambda (b) (lambda (c) ((c a) b))))
;; 			  (lambda (x) (lambda (y) y)))
;; 			 (lambda (x) (lambda (y) y)))))))
;; 		 a)))
;; 	    b)
;; 	   a)))))
;;     ((lambda (n)
;;        ((lambda (p) (p (lambda (a) (lambda (b) b))))
;; 	((n (lambda (p)
;; 	      (((lambda (a) (lambda (b) (lambda (c) ((c a) b))))
;; 		((lambda (n) (lambda (s) (lambda (z) (s ((n s) z)))))
;; 		 ((lambda (p) (p (lambda (a) (lambda (b) a)))) p)))
;; 	       (((lambda (a)
;; 		   (lambda (b)
;; 		     ((b (a (lambda (a)
;; 			      (lambda (b)
;; 				((a (lambda (n)
;; 				      (lambda (s)
;; 					(lambda (z) (s ((n s) z))))))
;; 				 b)))))
;; 		      (lambda (x) (lambda (y) y)))))
;; 		 ((lambda (p) (p (lambda (a) (lambda (b) a)))) p))
;; 		((lambda (p) (p (lambda (a) (lambda (b) b)))) p)))))
;; 	 (((lambda (a) (lambda (b) (lambda (c) ((c a) b))))
;; 	   (lambda (x) x))
;; 	  (lambda (x) x)))))
;;      (lambda (x) (lambda (y) (x (x (x (x (x y)))))))))
;;    (((lambda (a)
;;        (lambda (b)
;; 	 ((b (a (lambda (a)
;; 		  (lambda (b)
;; 		    ((a (lambda (n)
;; 			  (lambda (s) (lambda (z) (s ((n s) z))))))
;; 		     b)))))
;; 	  (lambda (x) (lambda (y) y)))))
;;      (((lambda (a)
;; 	 (lambda (b)
;; 	   ((b (a (lambda (a)
;; 		    (lambda (b)
;; 		      ((a (lambda (n)
;; 			    (lambda (s) (lambda (z) (s ((n s) z))))))
;; 		       b)))))
;; 	    (lambda (x) (lambda (y) y)))))
;;        ((lambda (x) (lambda (y) (x (x (x y)))))
;; 	(lambda (x) (lambda (y) (x (x y))))))
;;       (lambda (x) (lambda (y) (x (x (x y)))))))
;;     (lambda (x) (lambda (y) (x (x (x (x (x y)))))))))
;;   #t)
;;  #f)
;;  ; #t

;; T_01_Mayer
;; ((lambda (x) (x x 10000))
;;  (lambda (x n)
;;    (if (zero? n) #t
;;        (x x (- n 1)))))
;; ; #t


;; (define with (lambda (s f) (apply f s)))

;; (define crazy-ack
;;   (letrec ((ack3
;; 	    (lambda (a b c)
;; 	      (cond
;; 	       ((and (zero? a) (zero? b)) (+ c 1))
;; 	       ((and (zero? a) (zero? c)) (ack-x 0 (- b 1) 1))
;; 	       ((zero? a) (ack-z 0 (- b 1) (ack-y 0 b (- c 1))))
;; 	       ((and (zero? b) (zero? c)) (ack-x (- a 1) 1 0))
;; 	       ((zero? b) (ack-z (- a 1) 1 (ack-y a 0 (- c 1))))
;; 	       ((zero? c) (ack-x (- a 1) b (ack-y a (- b 1) 1)))
;; 	       (else (ack-z (- a 1) b (ack-y a (- b 1) (ack-x a b (- c 1))))))))
;; 	   (ack-x
;; 	    (lambda (a . bcs)
;; 	      (with bcs
;; 		(lambda (b c)
;; 		  (ack3 a b c)))))
;; 	   (ack-y
;; 	    (lambda (a b . cs)
;; 	      (with cs
;; 		(lambda (c)
;; 		  (ack3 a b c)))))
;; 	   (ack-z
;; 	    (lambda abcs
;; 	      (with abcs
;; 		(lambda (a b c)
;; 		  (ack3 a b c))))))
;;     (lambda ()
;;       (and (= 7 (ack3 0 2 2))
;; 	   (= 61 (ack3 0 3 3))
;; 	   (= 316 (ack3 1 1 5))
;; 	   (= 636 (ack3 2 0 1))
;; 	   ))))

;; (crazy-ack)
; #t

;; T_05_M
;; (((((lambda (x) (x (x x)))
;;     (lambda (x)
;;       (lambda (y)
;; 	(x (x y)))))
;;    (lambda (p)
;;      (p (lambda (x)
;; 	  (lambda (y)
;; 	    (lambda (z)
;; 	      ((z y) x)))))))
;;   (lambda (x)
;;     ((x #t) #f)))
;;  (lambda (x)
;;    (lambda (y)
;;      x)))
;; #t

;; (define even?
;;   (letrec ((even-1?
;; 	    (lambda (n)
;; 	      (or (zero? n)
;; 		  (odd-2? (- n 1) 'odd-2))))
;; 	   (odd-2?
;; 	    (lambda (n _)
;; 	      (and (positive? n)
;; 		   (even-3? (- n 1) (+ n n) (+ n n n)))))
;; 	   (even-3?
;; 	    (lambda (n _1 _2)
;; 	      (or (zero? n)
;; 		  (odd-5? (- n 1) (+ n n) (* n n) 'odd-5 'odder-5))))
;; 	   (odd-5?
;; 	    (lambda (n _1 _2 _3 _4)
;; 	      (and (positive? n)
;; 		   (even-1? (- n 1))))))
;;     even-1?))

;; (even? 100)

;; (append '(1 2 3) '() '(1 2 . 3))            ; (1 . (2 . (3 . (1 . (2 . 3)))))
; (1 2 3 1 2 . 3)
; (1 2 3 1 2 . 3)

;; (append '() '(1)) ; (1)
; ()

;; (apply (lambda x x) '() '(1)) ; (() 1)
; ()

;; ((lambda x x) 1)

;; (map list '("a" "b" "c") '('a 'b 'c) '(1 2 3) '(0.5 0.333 0.25))
; (("a" 'a 1 0.5) ("b" 'b 2 0.333) ("c" 'c 3 0.25))
; (("a" (quote a) 1 0.500000) ("b" (quote b) 2 0.333000) ("c" (quote c) 3 0.250000))

;; (define x1 5)           
;; (define x2 5)          
;; (define x3 5)
;; (define x4 5) 
;; (define x5 5) 
;; (define x6 5) 

;; ; Checking applic tp with changed number of arguments
;; (set! x1 (lambda y0 (x2)))           
;; (set! x2 (lambda y1 (x3 y1 2)))          
;; (set! x3 (lambda y2 (x4 y2 3 4 5 6 7 8)))
;; (set! x4 (lambda y3 (x5 y3 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566 ))) 
;; (set! x5 (lambda y4 (x6 y4 5))) 
;; (set! x6 (lambda y5 `(,@y5))) 

;; (x1)
;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)
; ((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)
;; (x1)
;; ;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1) 


;; (define foo 6)
;; (define n 0)

;; (set! foo (lambda (x  . h)
;;                 (if (null? h)
;;                     (begin (set! n (+ n 1))
;;                         n)
;;                 (begin (set! n (+ n 1)) (cons x (apply foo (car h) (cdr h)))) 
;;                 )
;;             )
;;     )

;; (foo "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")  
;; ; ("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" . 26)

;; (define cadr (lambda (pair) (car (cdr pair))))
;; (define (partition pivot num-list)
;;     (if (null? num-list) '(() ())
;;     (let ((split-of-rest (partition pivot (cdr num-list))))
;;     (if (< (car num-list) pivot)
;;     (list (cons (car num-list) (car split-of-rest))
;;     (cadr split-of-rest))
;;     (list (car split-of-rest) (cons (car num-list)
;;     (car (cdr split-of-rest))))))))

;; (partition 5 '(6 4 3 7 8 2 1 9 11))
;; ; ((4 3 2 1) (6 7 8 9 11))
;; ; ((4 3 2 1) (6 7 8 9 11))

;; (partition 2 '(6 4 3 7 8 2 1 9 11))
;; ;((1) (6 4 3 7 8 2 9 11))
;; ;((1) (6 4 3 7 8 2 9 11))

;; (partition 8 '(6 4 3 7 8 2 1 9 11))
;; ;((6 4 3 7 2 1) (8 9 11))
;; ;((6 4 3 7 2 1) (8 9 11))

;; (partition 15 '(6 4 3 7 8 2 1 9 11 66 33 44 55 10 2 4 5.5 3.3 7 232432 24234)) 
; ((6 4 3 7 8 2 1 9 11 10 2 4 5.500000 3.300000 7) (66 33 44 55 232432 24234))
; ((6 4 3 7 8 2 1 9 11 10 2 4 5.5      3.3      7) (66 33 44 55 232432 24234))


;; (define (revall L)
;;     (if (null? L)
;;             L
;;     (let ((E (if (list? (car L))
;;         (revall (car L))
;;         (car L) )))
;;         (append (revall (cdr L))
;;             (list E))
;;                 )
;;                     ))
;; (revall '( (1 2) (3 4)))
; ((4 3) (2 1))
; ((4 3) (2 1))

;; (define (distrib L E)
;; (if (null? L)
;;         '()
;;     (cons (cons E (car L))
;;         (distrib (cdr L) E))
;;         )
;;             )

;; (define (extend L E)
;;     (append L (distrib L E)))

;; (define (subsets L)
;;     (if (null? L)
;;             (list '())
;;             (extend (subsets (cdr L))
;;             (car L))
;;                     ))

;; (subsets '(1 2) )
;; ;(() (2) (1) (1 2))
;; ;(() (2) (1) (1 2))
;; (subsets '(1 2 3))
;(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;; (letrec ((loop (lambda (r)
;;         (if (= r 0)
;;             0
;;             (loop (- r 1))))))
;; (loop 220000))
; 0
; sig fault

;; (apply - `(3 ,@(append '(4 4) '(4))))
;; ; -9
;; ; -1

;; (define foo (lambda (x)
;;             (let ((x (+ x 1)))
;;             (lambda (y)
;;                 (let ((y (+ y 1)))
;;                 (lambda (z) 
;;                     (+ x y z)))))))
                    
;; (define f1 (foo 1))
;; (define f12 (f1 2))
;; (f12 3)
;; ; 8
;; ; 5

;; (map map (list 
;;             (lambda (x) (+ x x)) 
;;             (lambda (x) (- x))
;;             (lambda (x) (* x x)) 
;;             (lambda (x)  (/ x)))
;;     '((1 2) (3 4) (5.0 6.0) (16.0 8.0)))
;((2 4) (-3 -4) (25.0 36.0) (0.0625 0.125))
;sig fault

;; (define foo (lambda (n) 
;;                 (if (= n 0)
;;                     'finish
;;                     (foo (- n 1))
;;                 )
;;                 )
;;                 )

;;         (foo 1000000)
; sig fault

;; (define mat-sca-mul
;; (lambda (x m)
;;     (let* ([nr (matrix-rows m)]
;;         [nc (matrix-columns m)]
;;         [r (make-matrix nr nc)])
;;         (letrec ([loop (lambda (i)
;;         (if (= i nr)
;;             (begin r)
;;             (begin
;;                 (letrec ([loop2 (lambda (j)
;;                 (if (= j nc)
;;                     #t
;;                     (begin
;;                         (matrix-set! r i j (* x (matrix-ref m i j)))
;;                         (loop2 (+ j 1)))))])
;; (loop2 0))
;;                 (loop (+ i 1)))))])
;; (loop 0)))))
; exception not found


;; (define mat-sca-mul
;; (lambda (x m)
;;     (let* ((nr (matrix-rows m))
;;         (nc (matrix-columns m))
;;         (r (make-matrix nr nc)))
;;         (letrec ((loop (lambda (i)
;;         (if (= i nr)
;;             (begin r)
;;             (begin
;;                 (letrec ((loop2 (lambda (j)
;;                 (if (= j nc)
;;                     #t
;;                     (begin
;;                         (matrix-set! r i j (* x (matrix-ref m i j)))
;;                         (loop2 (+ j 1)))))))
;; (loop2 0))
;;                 (loop (+ i 1)))))))
;; (loop 0)))))

;; (+) ; 0
;; (apply * '(1 2))

;; (apply + 1.0 2.0 3.0 '()) ; 6.0
;3.000000

;; (apply + '(1 2 3)) ; 6
; 3

;; (+ 1.0 2.0)

;; (apply + '(1 2))

;; (* 1 2)

;; ((lambda (x)
;;     ((lambda (y)
;;         (set! x y)
;;     ((lambda z
;;         x)1))1)
;;     ((lambda (a)
;;         (set! x a)
;;         a
;;         (set! x 0)
;;         ((lambda (b)
;;         (set! x -1))1))1)
;;         x)1)
;-1
;-1
        ;; Def (Var "+",
        ;; Applic
        ;;  (LambdaSimple (["null?"; "+"; "car"; "apply"; "cdr"],
        ;;    Applic
        ;;     (LambdaSimple (["loop"],
        ;;       Seq
        ;;        [Set (Var "loop",
        ;;          LambdaOpt ([], "x",
        ;;           If (Applic (Var "null?", [Var "x"]),
        ;;            Const (Sexpr (Number (Int 0))),
        ;;            Applic (Var "+",
        ;;             [Applic (Var "car", [Var "x"]);
        ;;              Applic (Var "apply",
        ;;               [Var "loop"; Applic (Var "cdr", [Var "x"])])]))));
        ;;         Var "loop"]),
        ;;     [Const (Sexpr (Symbol "whatever"))])),
        ;;  [Var "null?"; Var "+"; Var "car"; Var "apply"; Var "cdr"]))

    ;;  Def' (Var' (VarFree "+"),
    ;;   Applic'
    ;;    (LambdaSimple' (["null?"; "+"; "car"; "apply"; "cdr"],
    ;;      ApplicTP'
    ;;       (LambdaSimple' (["loop"],
    ;;         Seq'
    ;;          [Set' (Var' (VarParam ("loop", 0)), Box' (VarParam ("loop", 0)));
    ;;           Seq'
    ;;            [BoxSet' (VarParam ("loop", 0),
    ;;              LambdaOpt' ([], "x",
    ;;               If'
    ;;                (Applic' (Var' (VarBound ("null?", 1, 0)),
    ;;                  [Var' (VarParam ("x", 0))]),
    ;;                Const' (Sexpr (Number (Int 0))),
    ;;                ApplicTP' (Var' (VarBound ("+", 1, 1)),
    ;;                 [Applic' (Var' (VarBound ("car", 1, 2)),
    ;;                   [Var' (VarParam ("x", 0))]);
    ;;                  Applic' (Var' (VarBound ("apply", 1, 3)),
    ;;                   [BoxGet' (VarBound ("loop", 0, 0));
    ;;                    Applic' (Var' (VarBound ("cdr", 1, 4)),
    ;;                     [Var' (VarParam ("x", 0))])])]))));
    ;;             BoxGet' (VarParam ("loop", 0))]]),
    ;;       [Const' (Sexpr (Symbol "whatever"))])),
    ;;    [Var' (VarFree "null?"); Var' (VarFree "+"); Var' (VarFree "car");
    ;;     Var' (VarFree "apply"); Var' (VarFree "cdr")])) 

;; (define plus_lambda
;;         ((lambda (null? + car apply cdr)
;;             ((lambda (loop)
;;                 (lambda x
;;                     (if (null? x) 0
;;                     (+ (car x) (apply (loop (cdr x) loop) ))))) 'whatever))
;;                         null? + car apply cdr))

;;  (define plus
;;     (let ((null? null?)(plus +)(car car)(apply apply)(cdr cdr))
;;       (letrec ((loop  (lambda x (if (null? x) 0 (+ (car x) (apply loop (cdr x))))) ))
;;         loop )))


;; (+ 1)
;; (define plus2
;;      (lambda x (if (null? x) 0 (+ (car x) (apply plus2 (cdr x))))))
;; (plus2 1)
; 1

;; (define +
;;   (let ((null? null?)(+ +)(car car)(apply apply)(cdr cdr))
;;     (letrec ((loop (lambda x (if (null? x) 0 (+ (car x) (apply loop (cdr x)))))))
;;       loop)))

;; (apply (lambda x x) 1 '())
; (())
; (1)

;; (apply (lambda x x) '(1))
; ()

;; (apply (lambda (x) x) '(1 2 3 4 5 6 7 8 9))
;; ; (2 3 4 5 6 7 8 9)
;; (+)
;; ; 0

;; (+ 1)

;; ; 0
;; (+ 1 2)
;; ; 2

;; (+ 1 2 3)

;; ; 2

;; (+ 1 2 3 4) ; take 2, 4

;; ; 6
;; (+ 1 2 3 4 5)
;; ; 6

;; (+ 1 2 3 4 5 6)

; 12
;; (apply (lambda (x) x) '(1))

;; ((lambda x x) 1 2 3 4 5 6 7 8 9 10)
; (1)
; ()

;; ((lambda x x) 1 2)
; (1 2)
; (2)

;; ((lambda x x) 1 2 3)
; (2 3)
; (1 2 3)

;; ((lambda x x) 1 2 3 4)
; (2 3 4)

; ()
;; (apply (lambda (x) x) 1 2)
; (2)
;; (apply (lambda (x) x) '(1 2 3))
; (2 3)
;; (apply (lambda (x) x) '(1 2 3 4))
; (2 3 4)
;; (apply (lambda (x) x) '(1 2 3 4 5))
; (2 3 4 5)
;; (apply (lambda (x) x) '(1 2 3 4 5 6))
; (2 3 4 5 6)

;; (define +
;;   (let ((null? null?)(+ +)(car car)(apply apply)(cdr cdr))
;;     (letrec ((loop (lambda x (if (null? x) 0 (+ (car x) (apply loop (cdr x)))))))
;;       loop)))

;; ;; (+)

;; ;; (+ 1)

(+ 1 2)
(+ 1 2 3)
(+ 1 2 3 4)
(+ 1 2 3 4 5)
(+ 1 2 3 4 5 6)
(+ 1 2 3 4 5 6 7) 
(+ 1 2 3 4 5 6 7 8) 
(+ 1 2 3 4 5 6 7 8 9)

;; (define *
;;   (let ((null? null?)(* *)(car car)(apply apply)(cdr cdr))
;;     (letrec ((loop (lambda x (if (null? x) 1 (* (car x) (apply loop (cdr x)))))))
;;       loop)))

(*)
(* 1)
(* 1 2)
(* 1 2 3)
(* 1 2 3 4)
(* 1 2 3 4 5)
(* 1 2 3 4 5 6)
(* 1 2 3 4 5 6 7) 
(* 1 2 3 4 5 6 7 8) 
(* 1 2 3 4 5 6 7 8 9)

;; (-)
(- 1)
(- 1 2)
(- 1 2 3)
(- 1 2 3 4)
(- 1 2 3 4 5)
(- 1 2 3 4 5 6)
(- 1 2 3 4 5 6 7) 
(- 1 2 3 4 5 6 7 8) 
(- 1 2 3 4 5 6 7 8 9)

;; (/) ; 1
(/ 1.0) ; 0
(/ 1.0 2.0)
(/ 1.0 2.0 3.0)
(/ 1.0 2.0 3.0 4.0)
(/ 1.0 2.0 3.0 4.0 5.0)
(/ 1.0 2.0 3.0 4.0 5.0 6.0)
(/ 1.0 2.0 3.0 4.0 5.0 6.0 7.0) 
(/ 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0) 
(/ 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0)

;; (append '(1 2 3) '() '(1 2 . 3))
; (1 2 3 1 2 . 3)
; (1 2 3 1 2 . 3)

;; (define append
;;     (let ((null? null?) (car car) (cdr cdr) (cons cons))
;;       (lambda args
;;         ((letrec ((f (lambda (ls args)
;;                        (if (null? args)
;;                            ls
;;                            ((letrec ((g (lambda (ls)
;;                                           (if (null? ls)
;;                                               (f (car args) (cdr args))
;;                                               (cons (car ls) (g (cdr ls)))))))
;;                               g) ls)))))
;;            f) '() args))))



;; (append '(1) '() '(2)) ; (1 2)
;; ; (1 2)

;; (append '(1) '() '(2) '() '(3)) ; (1 2 3)
;; ; (3)

;; (append '(1) '() '(2) '() '(3) '() '(4)) ; (1 2 3 4)
;; ; (4)

;; (+ 1)
;; (+ 1 2)
;; (+ 1 2 3)
;; (+ 1 2 3 4)

;; "()"
;; (append '()'())
;; ;; "'(1 2)"
;; (append '(1)'(2))
;; ;; "'(3)"
;; (append '()'()'(3))
;; ;; "'(2)"
;; (append '()'(2)'())
;; ;; "'(1 3)"
;; (append '(1)'()'(3))
;; ;; "'(2 3)"
;; (append '()'(2)'(3))
;; ;; "'(1 2)"
;; (append '(1)'(2)'())
;; ;; "'(1 2 3)"
;; (append '(1)'(2)'(3))
;; ;; "'(1 8 3 9)"
;; (append '(1 8)'()'(3 9))
;; ;; "'(1 5 2 6 3)"
;; (append '(1 5)'(2 6)'(3))




;; T_47
; Checking fvar_tbl working correctly 
            
            ;; (define x_0 0)
            ;; (define x_1 1)
            ;; (define x_2 2)
            ;; (define x_3 3)
            ;; (define x_4 4)
            ;; (define x_5 5)
            ;; (define x_6 6)
            ;; (define x_7 7)
            ;; (define x_8 8)
            ;; (define x_9 9)
            ;; (define x_10 10)
            ;; (define x_11 11)
            ;; (define x_12 12)
            ;; (define x_13 13)
            ;; (define x_14 14)
            ;; (define x_15 15)
            ;; (define x_16 16)
            ;; (define x_17 17)
            ;; (define x_18 18)
            ;; (define x_19 19)
            ;; (define x_20 20)
            ;; (define x_21 21)
            ;; (define x_22 22)
            ;; (define x_23 23)
            ;; (define x_24 24)
            ;; (define x_25 25)
            ;; (define x_26 26)
            ;; (define x_27 27)
            ;; (define x_28 28)
            ;; (define x_29 29)
            ;; (define x_30 30)
            ;; (define x_31 31)
            ;; (define x_32 32)
            ;; (define x_33 33)
            ;; (define x_34 34)
            ;; (define x_35 35)
            ;; (define x_36 36)
            ;; (define x_37 37)
            ;; (define x_38 38)
            ;; (define x_39 39)
            ;; (define x_40 40)
            ;; (define x_41 41)
            ;; (define x_42 42)
            ;; (define x_43 43)
            ;; (define x_44 44)
            ;; (define x_45 45)
            ;; (define x_46 46)
            ;; (define x_47 47)
            ;; (define x_48 48)
            ;; (define x_49 49)
            ;; (define x_50 50)
            ;; (define x_51 51)
            ;; (define x_52 52)
            ;; (define x_53 53)
            ;; (define x_54 54)
            ;; (define x_55 55)
            ;; (define x_56 56)
            ;; (define x_57 57)
            ;; (define x_58 58)
            ;; (define x_59 59)
            ;; (define x_60 60)
            ;; (define x_61 61)
            ;; (define x_62 62)
            ;; (define x_63 63)
            ;; (define x_64 64)
            ;; (define x_65 65)
            ;; (define x_66 66)
            ;; (define x_67 67)
            ;; (define x_68 68)
            ;; (define x_69 69)
            ;; (define x_70 70)
            ;; (define x_71 71)
            ;; (define x_72 72)
            ;; (define x_73 73)
            ;; (define x_74 74)
            ;; (define x_75 75)
            ;; (define x_76 76)
            ;; (define x_77 77)
            ;; (define x_78 78)
            ;; (define x_79 79)
            ;; (define x_80 80)
            ;; (define x_81 81)
            ;; (define x_82 82)
            ;; (define x_83 83)
            ;; (define x_84 84)
            ;; (define x_85 85)
            ;; (define x_86 86)
            ;; (define x_87 87)
            ;; (define x_88 88)
            ;; (define x_89 89)
            ;; (define x_90 90)
            ;; (define x_91 91)
            ;; (define x_92 92)
            ;; (define x_93 93)
            ;; (define x_94 94)
            ;; (define x_95 95)
            ;; (define x_96 96)
            ;; (define x_97 97)
            ;; (define x_98 98)
            ;; (define x_99 99)
            ;; (define x_100 100)
            ;; (define x_101 101)
            ;; (define x_102 102)
            ;; (define x_103 103)
            ;; (define x_104 104)
            ;; (define x_105 105)
            ;; (define x_106 106)
            ;; (define x_107 107)
            ;; (define x_108 108)
            ;; (define x_109 109)
            ;; (define x_110 110)
            ;; (define x_111 111)
            ;; (define x_112 112)
            ;; (define x_113 113)
            ;; (define x_114 114)
            ;; (define x_115 115)
            ;; (define x_116 116)
            ;; (define x_117 117)
            ;; (define x_118 118)
            ;; (define x_119 119)
            ;; (define x_120 120)
            ;; (define x_121 121)
            ;; (define x_122 122)
            ;; (define x_123 123)
            ;; (define x_124 124)
            ;; (define x_125 125)
            ;; (define x_126 126)
            ;; (define x_127 127)
            ;; (define x_128 128)
            ;; (define x_129 129)
            ;; (define x_130 130)
            ;; (define x_131 131)
            ;; (define x_132 132)
            ;; (define x_133 133)
            ;; (define x_134 134)
            ;; (define x_135 135)
            ;; (define x_136 136)
            ;; (define x_137 137)
            ;; (define x_138 138)
            ;; (define x_139 139)
            ;; (define x_140 140)
            ;; (define x_141 141)
            ;; (define x_142 142)
            ;; (define x_143 143)
            ;; (define x_144 144)
            ;; (define x_145 145)
            ;; (define x_146 146)
            ;; (define x_147 147)
            ;; (define x_148 148)
            ;; (define x_149 149)
            ;; (define x_150 150)
            ;; (define x_151 151)
            ;; (define x_152 152)
            ;; (define x_153 153)
            ;; (define x_154 154)
            ;; (define x_155 155)
            ;; (define x_156 156)
            ;; (define x_157 157)
            ;; (define x_158 158)
            ;; (define x_159 159)
            ;; (define x_160 160)
            ;; (define x_161 161)
            ;; (define x_162 162)
            ;; (define x_163 163)
            ;; (define x_164 164)
            ;; (define x_165 165)
            ;; (define x_166 166)
            ;; (define x_167 167)
            ;; (define x_168 168)
            ;; (define x_169 169)
            ;; (define x_170 170)
            ;; (define x_171 171)
            ;; (define x_172 172)
            ;; (define x_173 173)
            ;; (define x_174 174)
            ;; (define x_175 175)
            ;; (define x_176 176)
            ;; (define x_177 177)
            ;; (define x_178 178)
            ;; (define x_179 179)
            ;; (define x_180 180)
            ;; (define x_181 181)
            ;; (define x_182 182)
            ;; (define x_183 183)
            ;; (define x_184 184)
            ;; (define x_185 185)
            ;; (define x_186 186)
            ;; (define x_187 187)
            ;; (define x_188 188)
            ;; (define x_189 189)
            ;; (define x_190 190)
            ;; (define x_191 191)
            ;; (define x_192 192)
            ;; (define x_193 193)
            ;; (define x_194 194)
            ;; (define x_195 195)
            ;; (define x_196 196)
            ;; (define x_197 197)
            ;; (define x_198 198)
            ;; (define x_199 199)
            ;; (define x_200 200)
            ;; (define x_201 201)
            ;; (define x_202 202)
            ;; (define x_203 203)
            ;; (define x_204 204)
            ;; (define x_205 205)
            ;; (define x_206 206)
            ;; (define x_207 207)
            ;; (define x_208 208)
            ;; (define x_209 209)
            ;; (define x_210 210)
            ;; (define x_211 211)
            ;; (define x_212 212)
            ;; (define x_213 213)
            ;; (define x_214 214)
            ;; (define x_215 215)
            ;; (define x_216 216)
            ;; (define x_217 217)
            ;; (define x_218 218)
            ;; (define x_219 219)
            ;; (define x_220 220)
            ;; (define x_221 221)
            ;; (define x_222 222)
            ;; (define x_223 223)
            ;; (define x_224 224)
            ;; (define x_225 225)
            ;; (define x_226 226)
            ;; (define x_227 227)
            ;; (define x_228 228)
            ;; (define x_229 229)
            ;; (define x_230 230)
            ;; (define x_231 231)
            ;; (define x_232 232)
            ;; (define x_233 233)
            ;; (define x_234 234)
            ;; (define x_235 235)
            ;; (define x_236 236)
            ;; (define x_237 237)
            ;; (define x_238 238)
            ;; (define x_239 239)
            ;; (define x_240 240)
            ;; (define x_241 241)
            ;; (define x_242 242)
            ;; (define x_243 243)
            ;; (define x_244 244)
            ;; (define x_245 245)
            ;; (define x_246 246)
            ;; (define x_247 247)
            ;; (define x_248 248)
            ;; (define x_249 249)
            ;; (define x_250 250)
            ;; (define x_251 251)
            ;; (define x_252 252)
            ;; (define x_253 253)
            ;; (define x_254 254)
            ;; (define x_255 255)
            ;; (define x_256 256)
            ;; (define x_257 257)
            ;; (define x_258 258)
            ;; (define x_259 259)
            ;; (define x_260 260)
            ;; (define x_261 261)
            ;; (define x_262 262)
            ;; (define x_263 263)
            ;; (define x_264 264)
            ;; (define x_265 265)
            ;; (define x_266 266)
            ;; (define x_267 267)
            ;; (define x_268 268)
            ;; (define x_269 269)
            ;; (define x_270 270)
            ;; (define x_271 271)
            ;; (define x_272 272)
            ;; (define x_273 273)
            ;; (define x_274 274)
            ;; (define x_275 275)
            ;; (define x_276 276)
            ;; (define x_277 277)
            ;; (define x_278 278)
            ;; (define x_279 279)
            ;; (define x_280 280)
            ;; (define x_281 281)
            ;; (define x_282 282)
            ;; (define x_283 283)
            ;; (define x_284 284)
            ;; (define x_285 285)
            ;; (define x_286 286)
            ;; (define x_287 287)
            ;; (define x_288 288)
            ;; (define x_289 289)
            ;; (define x_290 290)
            ;; (define x_291 291)
            ;; (define x_292 292)
            ;; (define x_293 293)
            ;; (define x_294 294)
            ;; (define x_295 295)
            ;; (define x_296 296)
            ;; (define x_297 297)
            ;; (define x_298 298)
            ;; (define x_299 299)
            ;; (define x_300 300)
            ;; (define x_301 301)
            ;; (define x_302 302)
            ;; (define x_303 303)
            ;; (define x_304 304)
            ;; (define x_305 305)
            ;; (define x_306 306)
            ;; (define x_307 307)
            ;; (define x_308 308)
            ;; (define x_309 309)
            ;; (define x_310 310)
            ;; (define x_311 311)
            ;; (define x_312 312)
            ;; (define x_313 313)
            ;; (define x_314 314)
            ;; (define x_315 315)
            ;; (define x_316 316)
            ;; (define x_317 317)
            ;; (define x_318 318)
            ;; (define x_319 319)
            ;; (define x_320 320)
            ;; (define x_321 321)
            ;; (define x_322 322)
            ;; (define x_323 323)
            ;; (define x_324 324)
            ;; (define x_325 325)
            ;; (define x_326 326)
            ;; (define x_327 327)
            ;; (define x_328 328)
            ;; (define x_329 329)
            ;; (define x_330 330)
            ;; (define x_331 331)
            ;; (define x_332 332)
            ;; (define x_333 333)
            ;; (define x_334 334)
            ;; (define x_335 335)
            ;; (define x_336 336)
            ;; (define x_337 337)
            ;; (define x_338 338)
            ;; (define x_339 339)
            ;; (define x_340 340)
            ;; (define x_341 341)
            ;; (define x_342 342)
            ;; (define x_343 343)
            ;; (define x_344 344)
            ;; (define x_345 345)
            ;; (define x_346 346)
            ;; (define x_347 347)
            ;; (define x_348 348)
            ;; (define x_349 349)
            ;; (define x_350 350)
            ;; (define x_351 351)
            ;; (define x_352 352)
            ;; (define x_353 353)
            ;; (define x_354 354)
            ;; (define x_355 355)
            ;; (define x_356 356)
            ;; (define x_357 357)
            ;; (define x_358 358)
            ;; (define x_359 359)
            ;; (define x_360 360)
            ;; (define x_361 361)
            ;; (define x_362 362)
            ;; (define x_363 363)
            ;; (define x_364 364)
            ;; (define x_365 365)
            ;; (define x_366 366)
            ;; (define x_367 367)
            ;; (define x_368 368)
            ;; (define x_369 369)
            ;; (define x_370 370)
            ;; (define x_371 371)
            ;; (define x_372 372)
            ;; (define x_373 373)
            ;; (define x_374 374)
            ;; (define x_375 375)
            ;; (define x_376 376)
            ;; (define x_377 377)
            ;; (define x_378 378)
            ;; (define x_379 379)
            ;; (define x_380 380)
            ;; (define x_381 381)
            ;; (define x_382 382)
            ;; (define x_383 383)
            ;; (define x_384 384)
            ;; (define x_385 385)
            ;; (define x_386 386)
            ;; (define x_387 387)
            ;; (define x_388 388)
            ;; (define x_389 389)
            ;; (define x_390 390)
            ;; (define x_391 391)
            ;; (define x_392 392)
            ;; (define x_393 393)
            ;; (define x_394 394)
            ;; (define x_395 395)
            ;; (define x_396 396)
            ;; (define x_397 397)
            ;; (define x_398 398)
            ;; (define x_399 399)     

            ;; (set! x_0 -0)
            ;; (set! x_1 -1)
            ;; (set! x_2 -2)
            ;; (set! x_3 -3)
            ;; (set! x_4 -4)
            ;; (set! x_5 -5)
            ;; (set! x_6 -6)
            ;; (set! x_7 -7)
            ;; (set! x_8 -8)
            ;; (set! x_9 -9)
            ;; (set! x_10 -10)
            ;; (set! x_11 -11)
            ;; (set! x_12 -12)
            ;; (set! x_13 -13)
            ;; (set! x_14 -14)
            ;; (set! x_15 -15)
            ;; (set! x_16 -16)
            ;; (set! x_17 -17)
            ;; (set! x_18 -18)
            ;; (set! x_19 -19)
            ;; (set! x_20 -20)
            ;; (set! x_21 -21)
            ;; (set! x_22 -22)
            ;; (set! x_23 -23)
            ;; (set! x_24 -24)
            ;; (set! x_25 -25)
            ;; (set! x_26 -26)
            ;; (set! x_27 -27)
            ;; (set! x_28 -28)
            ;; (set! x_29 -29)
            ;; (set! x_30 -30)
            ;; (set! x_31 -31)
            ;; (set! x_32 -32)
            ;; (set! x_33 -33)
            ;; (set! x_34 -34)
            ;; (set! x_35 -35)
            ;; (set! x_36 -36)
            ;; (set! x_37 -37)
            ;; (set! x_38 -38)
            ;; (set! x_39 -39)
            ;; (set! x_40 -40)
            ;; (set! x_41 -41)
            ;; (set! x_42 -42)
            ;; (set! x_43 -43)
            ;; (set! x_44 -44)
            ;; (set! x_45 -45)
            ;; (set! x_46 -46)
            ;; (set! x_47 -47)
            ;; (set! x_48 -48)
            ;; (set! x_49 -49)
            ;; (set! x_50 -50)
            ;; (set! x_51 -51)
            ;; (set! x_52 -52)
            ;; (set! x_53 -53)
            ;; (set! x_54 -54)
            ;; (set! x_55 -55)
            ;; (set! x_56 -56)
            ;; (set! x_57 -57)
            ;; (set! x_58 -58)
            ;; (set! x_59 -59)
            ;; (set! x_60 -60)
            ;; (set! x_61 -61)
            ;; (set! x_62 -62)
            ;; (set! x_63 -63)
            ;; (set! x_64 -64)
            ;; (set! x_65 -65)
            ;; (set! x_66 -66)
            ;; (set! x_67 -67)
            ;; (set! x_68 -68)
            ;; (set! x_69 -69)
            ;; (set! x_70 -70)
            ;; (set! x_71 -71)
            ;; (set! x_72 -72)
            ;; (set! x_73 -73)
            ;; (set! x_74 -74)
            ;; (set! x_75 -75)
            ;; (set! x_76 -76)
            ;; (set! x_77 -77)
            ;; (set! x_78 -78)
            ;; (set! x_79 -79)
            ;; (set! x_80 -80)
            ;; (set! x_81 -81)
            ;; (set! x_82 -82)
            ;; (set! x_83 -83)
            ;; (set! x_84 -84)
            ;; (set! x_85 -85)
            ;; (set! x_86 -86)
            ;; (set! x_87 -87)
            ;; (set! x_88 -88)
            ;; (set! x_89 -89)
            ;; (set! x_90 -90)
            ;; (set! x_91 -91)
            ;; (set! x_92 -92)
            ;; (set! x_93 -93)
            ;; (set! x_94 -94)
            ;; (set! x_95 -95)
            ;; (set! x_96 -96)
            ;; (set! x_97 -97)
            ;; (set! x_98 -98)
            ;; (set! x_99 -99)
            ;; (set! x_100 -100)
            ;; (set! x_101 -101)
            ;; (set! x_102 -102)
            ;; (set! x_103 -103)
            ;; (set! x_104 -104)
            ;; (set! x_105 -105)
            ;; (set! x_106 -106)
            ;; (set! x_107 -107)
            ;; (set! x_108 -108)
            ;; (set! x_109 -109)
            ;; (set! x_110 -110)
            ;; (set! x_111 -111)
            ;; (set! x_112 -112)
            ;; (set! x_113 -113)
            ;; (set! x_114 -114)
            ;; (set! x_115 -115)
            ;; (set! x_116 -116)
            ;; (set! x_117 -117)
            ;; (set! x_118 -118)
            ;; (set! x_119 -119)
            ;; (set! x_120 -120)
            ;; (set! x_121 -121)
            ;; (set! x_122 -122)
            ;; (set! x_123 -123)
            ;; (set! x_124 -124)
            ;; (set! x_125 -125)
            ;; (set! x_126 -126)
            ;; (set! x_127 -127)
            ;; (set! x_128 -128)
            ;; (set! x_129 -129)
            ;; (set! x_130 -130)
            ;; (set! x_131 -131)
            ;; (set! x_132 -132)
            ;; (set! x_133 -133)
            ;; (set! x_134 -134)
            ;; (set! x_135 -135)
            ;; (set! x_136 -136)
            ;; (set! x_137 -137)
            ;; (set! x_138 -138)
            ;; (set! x_139 -139)
            ;; (set! x_140 -140)
            ;; (set! x_141 -141)
            ;; (set! x_142 -142)
            ;; (set! x_143 -143)
            ;; (set! x_144 -144)
            ;; (set! x_145 -145)
            ;; (set! x_146 -146)
            ;; (set! x_147 -147)
            ;; (set! x_148 -148)
            ;; (set! x_149 -149)
            ;; (set! x_150 -150)
            ;; (set! x_151 -151)
            ;; (set! x_152 -152)
            ;; (set! x_153 -153)
            ;; (set! x_154 -154)
            ;; (set! x_155 -155)
            ;; (set! x_156 -156)
            ;; (set! x_157 -157)
            ;; (set! x_158 -158)
            ;; (set! x_159 -159)
            ;; (set! x_160 -160)
            ;; (set! x_161 -161)
            ;; (set! x_162 -162)
            ;; (set! x_163 -163)
            ;; (set! x_164 -164)
            ;; (set! x_165 -165)
            ;; (set! x_166 -166)
            ;; (set! x_167 -167)
            ;; (set! x_168 -168)
            ;; (set! x_169 -169)
            ;; (set! x_170 -170)
            ;; (set! x_171 -171)
            ;; (set! x_172 -172)
            ;; (set! x_173 -173)
            ;; (set! x_174 -174)
            ;; (set! x_175 -175)
            ;; (set! x_176 -176)
            ;; (set! x_177 -177)
            ;; (set! x_178 -178)
            ;; (set! x_179 -179)
            ;; (set! x_180 -180)
            ;; (set! x_181 -181)
            ;; (set! x_182 -182)
            ;; (set! x_183 -183)
            ;; (set! x_184 -184)
            ;; (set! x_185 -185)
            ;; (set! x_186 -186)
            ;; (set! x_187 -187)
            ;; (set! x_188 -188)
            ;; (set! x_189 -189)
            ;; (set! x_190 -190)
            ;; (set! x_191 -191)
            ;; (set! x_192 -192)
            ;; (set! x_193 -193)
            ;; (set! x_194 -194)
            ;; (set! x_195 -195)
            ;; (set! x_196 -196)
            ;; (set! x_197 -197)
            ;; (set! x_198 -198)
            ;; (set! x_199 -199)
            ;; (set! x_200 -200)
            ;; (set! x_201 -201)
            ;; (set! x_202 -202)
            ;; (set! x_203 -203)
            ;; (set! x_204 -204)
            ;; (set! x_205 -205)
            ;; (set! x_206 -206)
            ;; (set! x_207 -207)
            ;; (set! x_208 -208)
            ;; (set! x_209 -209)
            ;; (set! x_210 -210)
            ;; (set! x_211 -211)
            ;; (set! x_212 -212)
            ;; (set! x_213 -213)
            ;; (set! x_214 -214)
            ;; (set! x_215 -215)
            ;; (set! x_216 -216)
            ;; (set! x_217 -217)
            ;; (set! x_218 -218)
            ;; (set! x_219 -219)
            ;; (set! x_220 -220)
            ;; (set! x_221 -221)
            ;; (set! x_222 -222)
            ;; (set! x_223 -223)
            ;; (set! x_224 -224)
            ;; (set! x_225 -225)
            ;; (set! x_226 -226)
            ;; (set! x_227 -227)
            ;; (set! x_228 -228)
            ;; (set! x_229 -229)
            ;; (set! x_230 -230)
            ;; (set! x_231 -231)
            ;; (set! x_232 -232)
            ;; (set! x_233 -233)
            ;; (set! x_234 -234)
            ;; (set! x_235 -235)
            ;; (set! x_236 -236)
            ;; (set! x_237 -237)
            ;; (set! x_238 -238)
            ;; (set! x_239 -239)
            ;; (set! x_240 -240)
            ;; (set! x_241 -241)
            ;; (set! x_242 -242)
            ;; (set! x_243 -243)
            ;; (set! x_244 -244)
            ;; (set! x_245 -245)
            ;; (set! x_246 -246)
            ;; (set! x_247 -247)
            ;; (set! x_248 -248)
            ;; (set! x_249 -249)
            ;; (set! x_250 -250)
            ;; (set! x_251 -251)
            ;; (set! x_252 -252)
            ;; (set! x_253 -253)
            ;; (set! x_254 -254)
            ;; (set! x_255 -255)
            ;; (set! x_256 -256)
            ;; (set! x_257 -257)
            ;; (set! x_258 -258)
            ;; (set! x_259 -259)
            ;; (set! x_260 -260)
            ;; (set! x_261 -261)
            ;; (set! x_262 -262)
            ;; (set! x_263 -263)
            ;; (set! x_264 -264)
            ;; (set! x_265 -265)
            ;; (set! x_266 -266)
            ;; (set! x_267 -267)
            ;; (set! x_268 -268)
            ;; (set! x_269 -269)
            ;; (set! x_270 -270)
            ;; (set! x_271 -271)
            ;; (set! x_272 -272)
            ;; (set! x_273 -273)
            ;; (set! x_274 -274)
            ;; (set! x_275 -275)
            ;; (set! x_276 -276)
            ;; (set! x_277 -277)
            ;; (set! x_278 -278)
            ;; (set! x_279 -279)
            ;; (set! x_280 -280)
            ;; (set! x_281 -281)
            ;; (set! x_282 -282)
            ;; (set! x_283 -283)
            ;; (set! x_284 -284)
            ;; (set! x_285 -285)
            ;; (set! x_286 -286)
            ;; (set! x_287 -287)
            ;; (set! x_288 -288)
            ;; (set! x_289 -289)
            ;; (set! x_290 -290)
            ;; (set! x_291 -291)
            ;; (set! x_292 -292)
            ;; (set! x_293 -293)
            ;; (set! x_294 -294)
            ;; (set! x_295 -295)
            ;; (set! x_296 -296)
            ;; (set! x_297 -297)
            ;; (set! x_298 -298)
            ;; (set! x_299 -299)
            ;; (set! x_300 -300)
            ;; (set! x_301 -301)
            ;; (set! x_302 -302)
            ;; (set! x_303 -303)
            ;; (set! x_304 -304)
            ;; (set! x_305 -305)
            ;; (set! x_306 -306)
            ;; (set! x_307 -307)
            ;; (set! x_308 -308)
            ;; (set! x_309 -309)
            ;; (set! x_310 -310)
            ;; (set! x_311 -311)
            ;; (set! x_312 -312)
            ;; (set! x_313 -313)
            ;; (set! x_314 -314)
            ;; (set! x_315 -315)
            ;; (set! x_316 -316)
            ;; (set! x_317 -317)
            ;; (set! x_318 -318)
            ;; (set! x_319 -319)
            ;; (set! x_320 -320)
            ;; (set! x_321 -321)
            ;; (set! x_322 -322)
            ;; (set! x_323 -323)
            ;; (set! x_324 -324)
            ;; (set! x_325 -325)
            ;; (set! x_326 -326)
            ;; (set! x_327 -327)
            ;; (set! x_328 -328)
            ;; (set! x_329 -329)
            ;; (set! x_330 -330)
            ;; (set! x_331 -331)
            ;; (set! x_332 -332)
            ;; (set! x_333 -333)
            ;; (set! x_334 -334)
            ;; (set! x_335 -335)
            ;; (set! x_336 -336)
            ;; (set! x_337 -337)
            ;; (set! x_338 -338)
            ;; (set! x_339 -339)
            ;; (set! x_340 -340)
            ;; (set! x_341 -341)
            ;; (set! x_342 -342)
            ;; (set! x_343 -343)
            ;; (set! x_344 -344)
            ;; (set! x_345 -345)
            ;; (set! x_346 -346)
            ;; (set! x_347 -347)
            ;; (set! x_348 -348)
            ;; (set! x_349 -349)
            ;; (set! x_350 -350)
            ;; (set! x_351 -351)
            ;; (set! x_352 -352)
            ;; (set! x_353 -353)
            ;; (set! x_354 -354)
            ;; (set! x_355 -355)
            ;; (set! x_356 -356)
            ;; (set! x_357 -357)
            ;; (set! x_358 -358)
            ;; (set! x_359 -359)
            ;; (set! x_360 -360)
            ;; (set! x_361 -361)
            ;; (set! x_362 -362)
            ;; (set! x_363 -363)
            ;; (set! x_364 -364)
            ;; (set! x_365 -365)
            ;; (set! x_366 -366)
            ;; (set! x_367 -367)
            ;; (set! x_368 -368)
            ;; (set! x_369 -369)
            ;; (set! x_370 -370)
            ;; (set! x_371 -371)
            ;; (set! x_372 -372)
            ;; (set! x_373 -373)
            ;; (set! x_374 -374)
            ;; (set! x_375 -375)
            ;; (set! x_376 -376)
            ;; (set! x_377 -377)
            ;; (set! x_378 -378)
            ;; (set! x_379 -379)
            ;; (set! x_380 -380)
            ;; (set! x_381 -381)
            ;; (set! x_382 -382)
            ;; (set! x_383 -383)
            ;; (set! x_384 -384)
            ;; (set! x_385 -385)
            ;; (set! x_386 -386)
            ;; (set! x_387 -387)
            ;; (set! x_388 -388)
            ;; (set! x_389 -389)
            ;; (set! x_390 -390)
            ;; (set! x_391 -391)
            ;; (set! x_392 -392)
            ;; (set! x_393 -393)
            ;; (set! x_394 -394)
            ;; (set! x_395 -395)
            ;; (set! x_396 -396)
            ;; (set! x_397 -397)
            ;; (set! x_398 -398)
            ;; (set! x_399 -399)

            ;; x_0
            ;; x_1
            ;; x_2
            ;; x_3
            ;; x_4
            ;; x_5
            ;; x_6
            ;; x_7
            ;; x_8
            ;; x_9
            ;; x_10
            ;; x_11
            ;; x_12
            ;; x_13
            ;; x_14
            ;; x_15
            ;; x_16
            ;; x_17
            ;; x_18
            ;; x_19
            ;; x_20
            ;; x_21
            ;; x_22
            ;; x_23
            ;; x_24
            ;; x_25
            ;; x_26
            ;; x_27
            ;; x_28
            ;; x_29
            ;; x_30
            ;; x_31
            ;; x_32
            ;; x_33
            ;; x_34
            ;; x_35
            ;; x_36
            ;; x_37
            ;; x_38
            ;; x_39
            ;; x_40
            ;; x_41
            ;; x_42
            ;; x_43
            ;; x_44
            ;; x_45
            ;; x_46
            ;; x_47
            ;; x_48
            ;; x_49
            ;; x_50
            ;; x_51
            ;; x_52
            ;; x_53
            ;; x_54
            ;; x_55
            ;; x_56
            ;; x_57
            ;; x_58
            ;; x_59
            ;; x_60
            ;; x_61
            ;; x_62
            ;; x_63
            ;; x_64
            ;; x_65
            ;; x_66
            ;; x_67
            ;; x_68
            ;; x_69
            ;; x_70
            ;; x_71
            ;; x_72
            ;; x_73
            ;; x_74
            ;; x_75
            ;; x_76
            ;; x_77
            ;; x_78
            ;; x_79
            ;; x_80
            ;; x_81
            ;; x_82
            ;; x_83
            ;; x_84
            ;; x_85
            ;; x_86
            ;; x_87
            ;; x_88
            ;; x_89
            ;; x_90
            ;; x_91
            ;; x_92
            ;; x_93
            ;; x_94
            ;; x_95
            ;; x_96
            ;; x_97
            ;; x_98
            ;; x_99
            ;; x_100
            ;; x_101
            ;; x_102
            ;; x_103
            ;; x_104
            ;; x_105
            ;; x_106
            ;; x_107
            ;; x_108
            ;; x_109
            ;; x_110
            ;; x_111
            ;; x_112
            ;; x_113
            ;; x_114
            ;; x_115
            ;; x_116
            ;; x_117
            ;; x_118
            ;; x_119
            ;; x_120
            ;; x_121
            ;; x_122
            ;; x_123
            ;; x_124
            ;; x_125
            ;; x_126
            ;; x_127
            ;; x_128
            ;; x_129
            ;; x_130
            ;; x_131
            ;; x_132
            ;; x_133
            ;; x_134
            ;; x_135
            ;; x_136
            ;; x_137
            ;; x_138
            ;; x_139
            ;; x_140
            ;; x_141
            ;; x_142
            ;; x_143
            ;; x_144
            ;; x_145
            ;; x_146
            ;; x_147
            ;; x_148
            ;; x_149
            ;; x_150
            ;; x_151
            ;; x_152
            ;; x_153
            ;; x_154
            ;; x_155
            ;; x_156
            ;; x_157
            ;; x_158
            ;; x_159
            ;; x_160
            ;; x_161
            ;; x_162
            ;; x_163
            ;; x_164
            ;; x_165
            ;; x_166
            ;; x_167
            ;; x_168
            ;; x_169
            ;; x_170
            ;; x_171
            ;; x_172
            ;; x_173
            ;; x_174
            ;; x_175
            ;; x_176
            ;; x_177
            ;; x_178
            ;; x_179
            ;; x_180
            ;; x_181
            ;; x_182
            ;; x_183
            ;; x_184
            ;; x_185
            ;; x_186
            ;; x_187
            ;; x_188
            ;; x_189
            ;; x_190
            ;; x_191
            ;; x_192
            ;; x_193
            ;; x_194
            ;; x_195
            ;; x_196
            ;; x_197
            ;; x_198
            ;; x_199
            ;; x_200
            ;; x_201
            ;; x_202
            ;; x_203
            ;; x_204
            ;; x_205
            ;; x_206
            ;; x_207
            ;; x_208
            ;; x_209
            ;; x_210
            ;; x_211
            ;; x_212
            ;; x_213
            ;; x_214
            ;; x_215
            ;; x_216
            ;; x_217
            ;; x_218
            ;; x_219
            ;; x_220
            ;; x_221
            ;; x_222
            ;; x_223
            ;; x_224
            ;; x_225
            ;; x_226
            ;; x_227
            ;; x_228
            ;; x_229
            ;; x_230
            ;; x_231
            ;; x_232
            ;; x_233
            ;; x_234
            ;; x_235
            ;; x_236
            ;; x_237
            ;; x_238
            ;; x_239
            ;; x_240
            ;; x_241
            ;; x_242
            ;; x_243
            ;; x_244
            ;; x_245
            ;; x_246
            ;; x_247
            ;; x_248
            ;; x_249
            ;; x_250
            ;; x_251
            ;; x_252
            ;; x_253
            ;; x_254
            ;; x_255
            ;; x_256
            ;; x_257
            ;; x_258
            ;; x_259
            ;; x_260
            ;; x_261
            ;; x_262
            ;; x_263
            ;; x_264
            ;; x_265
            ;; x_266
            ;; x_267
            ;; x_268
            ;; x_269
            ;; x_270
            ;; x_271
            ;; x_272
            ;; x_273
            ;; x_274
            ;; x_275
            ;; x_276
            ;; x_277
            ;; x_278
            ;; x_279
            ;; x_280
            ;; x_281
            ;; x_282
            ;; x_283
            ;; x_284
            ;; x_285
            ;; x_286
            ;; x_287
            ;; x_288
            ;; x_289
            ;; x_290
            ;; x_291
            ;; x_292
            ;; x_293
            ;; x_294
            ;; x_295
            ;; x_296
            ;; x_297
            ;; x_298
            ;; x_299
            ;; x_300
            ;; x_301
            ;; x_302
            ;; x_303
            ;; x_304
            ;; x_305
            ;; x_306
            ;; x_307
            ;; x_308
            ;; x_309
            ;; x_310
            ;; x_311
            ;; x_312
            ;; x_313
            ;; x_314
            ;; x_315
            ;; x_316
            ;; x_317
            ;; x_318
            ;; x_319
            ;; x_320
            ;; x_321
            ;; x_322
            ;; x_323
            ;; x_324
            ;; x_325
            ;; x_326
            ;; x_327
            ;; x_328
            ;; x_329
            ;; x_330
            ;; x_331
            ;; x_332
            ;; x_333
            ;; x_334
            ;; x_335
            ;; x_336
            ;; x_337
            ;; x_338
            ;; x_339
            ;; x_340
            ;; x_341
            ;; x_342
            ;; x_343
            ;; x_344
            ;; x_345
            ;; x_346
            ;; x_347
            ;; x_348
            ;; x_349
            ;; x_350
            ;; x_351
            ;; x_352
            ;; x_353
            ;; x_354
            ;; x_355
            ;; x_356
            ;; x_357
            ;; x_358
            ;; x_359
            ;; x_360
            ;; x_361
            ;; x_362
            ;; x_363
            ;; x_364
            ;; x_365
            ;; x_366
            ;; x_367
            ;; x_368
            ;; x_369
            ;; x_370
            ;; x_371
            ;; x_372
            ;; x_373
            ;; x_374
            ;; x_375
            ;; x_376
            ;; x_377
            ;; x_378
            ;; x_379
            ;; x_380
            ;; x_381
            ;; x_382
            ;; x_383
            ;; x_384
            ;; x_385
            ;; x_386
            ;; x_387
            ;; x_388
            ;; x_389
            ;; x_390
            ;; x_391
            ;; x_392
            ;; x_393
            ;; x_394
            ;; x_395
            ;; x_396
            ;; x_397
            ;; x_398
            ;; x_399


; 257
;; (define cadr (lambda (pair) (car (cdr pair))))
;; (define (partition pivot num-list)
;;         (if (null? num-list) '(() ())
;;         (let ((split-of-rest (partition pivot (cdr num-list))))
;;         (if (< (car num-list) pivot)
;;         (list (cons (car num-list) (car split-of-rest))
;;         (cadr split-of-rest))
;;         (list (car split-of-rest) (cons (car num-list)
;;         (car (cdr split-of-rest))))))))

;; (partition 5 '(6 4 3 7 8 2 1 9 11))
;; (partition 2 '(6 4 3 7 8 2 1 9 11))
;; (partition 8 '(6 4 3 7 8 2 1 9 11))
;; (partition 15 '(6 4 3 7 8 2 1 9 11 66 33 44 55 10 2 4 5.5 3.3 7 232432 24234)) 


; 427
;; (define foo (lambda (n)
;;         (if (= n 0)
;;             'finish
;;             (foo (- n 1))
;;         )
;;         )
;;         )

;; (foo 1000000)

;; (letrec ((loop (lambda (r)
;;     (if (= r 0)
;;         0
;;         (loop (- r 1))))))
;; (loop 220000))
;; ; works

;; (= 1 1 1 1); #t

;; (= 1 1 1 1 5)
; #f
; #t

;; (= #f #f #f #t)
;; (= 3 3 3 3 3 3.1)
;; (= 'c 'c 'c)
;; (= 'c 'c 'd)
;; (= '(1) '(1) '(1))
;; (= '(1 2) '(1 2) '(1 2))

;; (define equal
;;   (let ((null? null?)(eq =)(car car)(cdr cdr))
;;     (letrec ((loop (lambda (element lst) (if 
;; 					  (null? lst) 
;; 					  #t 
;; 					  (if 
;; 					   (eq element (car lst))
;; 					   (loop (car lst) (cdr lst))
;; 					   #f)
;; 					  ))))
;;       (lambda lst
;; 	(cond ((null? lst) "this should be an error, but you don't support exceptions")
;; 	      (else (loop (car lst) (cdr lst))))))))

;; (equal '() '() '(1))
;; ; #t

;; (equal '(1 2) '(1 2) '(1 2 3))
;; ; #t

;; (= 3 3 3 3 -1)

;; (define x1 5)
;; (define x2 5)          
;; (define x3 5)
;; (define x4 5) 
;; (define x5 5) 
;; (define x6 5) 

;; ; Checking applic tp with changed number of arguments
;; (set! x1 (lambda y0 (x2)))

;; ((lambda a 
;;     ((lambda b
;;         `(,@b)) a)
;;         ))

;; ((lambda a 
;;     ((lambda b
;;         b) a)
;;         ))

; (())
; ()

;; (define +
;;   (let ((null? null?)(+ +)(car car)(apply apply)(cdr cdr))
;;     (letrec ((loop (lambda x (if (null? x) 0 (+ (car x) (apply loop (cdr x)))))))
;;       loop)))

;; (+ 1)


;; (+ 1 2 3)

;; ;; (+ 1 2)
;; (+ 1 2 3)
;; (+ 1 2 3 4 5)

;; (define x1 5)           
;; (define x2 5)          
;; (define x3 5)
;; (define x4 5) 
;; (define x5 5) 
;; (define x6 5) 

;; ; Checking applic tp with changed number of arguments
;; (set! x1 (lambda y0 (x2)))           
;; (set! x2 (lambda y1 (x3 y1 2)))          
;; (set! x3 (lambda y2 (x4 y2 3 4 5 6 7 8)))
;; (set! x4 (lambda y3 (x5 y3 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566 ))) 
;; (set! x5 (lambda y4 (x6 y4 5))) 
;; (set! x6 (lambda y5 `(,@y5)))

;; (x1)
;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)
;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)
;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)


;; (append '() '('()))
;; (set! x4 (lambda y3 (x5 y3 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566 ))) 
;; (set! x5 (lambda y4 (x6 y4 5))) 
;; (set! x6 (lambda y5 `(,@y5)))

;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)
;((((   2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)

;; (x2);
;(())
;()



;((3) 1 2)
;((3) 1 2)


;(() 1 2)
;(1 2)

;; (x3);(2)
;(2)

; (() 1 2)
; (1 2)


;(2)
;sig fault

;; ((lambda a 
;;     ((lambda b 
;;        (b 1)) (lambda c c))
;;         ))

;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)
;; (x1)    
;; (x1)
;; (x1)

;((((() 2) 3 4 5 6 7 8) 4 11 12 13 14 15 3 0 4 32 4 56 865 3 566 43 56674566) 5)





;; (define x6 (lambda y5 `(,@y5)))
;; (x1) ; 

;; (x6);
;()

;; (define x 1)
;; `(,@x)
;1

;; `(,@1)
;1
;sig fault



;; (set! x2 (lambda y1 (x3 y1 2)))          
;; (set! x1 (lambda y0 (x2)))
;; (x1)
