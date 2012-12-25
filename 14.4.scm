#lang racket
(define-struct add (left right))
(define-struct mul (left right))

(define a (make-add 10 10))
(define b (make-mul 10 10))
(define c (make-mul 10 'y))
(define d (make-mul 10 (make-mul 10 10)))
(define e (make-mul 10 (make-add 10 'y)))
(define f (make-mul -10 10))
(define g (make-add (make-mul 3 3) (make-mul 4 4)))

(define (sub-numeric? scheme-data)
   (cond
     [(or (add? scheme-data)
         (mul? scheme-data)) (numeric? scheme-data)]
     [(number? scheme-data)
      true]
     [(symbol? scheme-data)
      false]))

(define (numeric? scheme-data)
  (cond
    [(add? scheme-data) (and (sub-numeric? (add-left scheme-data)) (sub-numeric? (add-right scheme-data)))]
    [(mul? scheme-data) (and (sub-numeric? (mul-left scheme-data)) (sub-numeric? (mul-right scheme-data)))]
    [else false]))

(numeric? a)
 (numeric? b)
 (numeric? c)
 (numeric? d)
 (numeric? e)
 (numeric? g)
 
 ;;14.4.3
 (define (evaluate scheme-data)
   (cond
     [(or (add? scheme-data)
         (mul? scheme-data)) (evaluate-expression scheme-data)]
     [(number? scheme-data)
      scheme-data]
     [(symbol? scheme-data)
      (error 'evaluate "error")]))
 
 (define (evaluate-expression scheme-data)
  (cond
    [(add? scheme-data) 
     (+  (evaluate (add-left scheme-data)) (evaluate (add-right scheme-data)))]
    [(mul? scheme-data) 
     (* (evaluate  (mul-left scheme-data)) (evaluate (mul-right scheme-data)))]
    [else (error 'evaluate-expression "error not scheme")]))

 (evaluate-expression a)
 (evaluate-expression d)
 (evaluate-expression g)
 
 ;; 14.4.4
 (define (check v n scheme-data)
   (cond
     [(or (add? scheme-data)
         (mul? scheme-data)) (subst v n scheme-data)]
     [(number? scheme-data)  scheme-data]
     [(equal? v scheme-data)  n]
     [else scheme-data]))
    
 (define (subst v n scheme-data)
   (cond
     [(numeric? scheme-data) scheme-data] 
     [(add? scheme-data) 
       (make-add (check v n (add-left scheme-data)) (check v n (add-right scheme-data)))]
    [(mul? scheme-data) 
       (make-mul (check v n (mul-left scheme-data)) (check v n (mul-right scheme-data)))]
    [else (error 'subst "error")]))
 
 (evaluate-expression (subst 'y -1 e))
 