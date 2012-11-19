#lang racket
(define-struct node (ssn name left right))

(define a (make-node 10 'a false false))
(define b (make-node 24 'b false false))
(define c (make-node 15 'c a b))
(define d (make-node 29 'd c false))
(define i (make-node 99 'i false false))
(define h (make-node 95 'h false i))
(define g (make-node 77 'g false false))
(define f (make-node 89 'f g h))
(define e (make-node 63 'e d f))

(define (contains-bt n bt)
  (cond
    [(equal? false bt) false]
    [else (or (equal?  n (node-ssn bt) )
             (contains-bt n (node-left bt))
             (contains-bt n (node-right bt)))]))

(define (contains-bt-list n bt)
  (cond
    [(equal? false bt) empty]
    [(equal?  n (node-ssn bt)) (list (node-name bt))]
    [else (append (contains-bt-list n (node-left bt))
             (contains-bt-list n (node-right bt)))]))

(define (search-bt n bt)
  (first (contains-bt-list n bt)))

(search-bt 10 e)

