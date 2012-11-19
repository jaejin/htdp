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

(define (inorder bt)
  (cond
    [(equal? false bt) empty]
    [else (append   (list (node-name bt))
                  (inorder (node-left bt))
                  (inorder (node-right bt)))]))

(inorder e)