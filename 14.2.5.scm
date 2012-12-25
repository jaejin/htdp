#lang racket
(define-struct node (ssn name left right))

(define (create-bst node ssn name)
  (cond
    [(boolean? node) (make-node ssn name false false)]
    [(> (node-ssn node) ssn) (make-node (node-ssn node) (node-name node) 
                                       (cond
                                         [(equal? false (node-left node))
                                                 (create-bst false ssn name)]
                                         [else
                                          (create-bst (node-left node) ssn name)])
                                       (node-right node))]
    [(< (node-ssn node) ssn) (make-node (node-ssn node) (node-name node) 
                                       (node-left node)
                                       (cond
                                         [(equal? false (node-right node))
                                                 (create-bst false ssn name)]
                                         [else
                                          (create-bst (node-right node) ssn name)]))]))

(define (inorder bt)
  (cond
    [(equal? false bt) empty]
    [else (append   (list (list (node-ssn bt)  (node-name bt) ))
                  (inorder (node-left bt))
                  (inorder (node-right bt)))]))

(define (create-bst-from-list l)
  (cond
    [(empty? l) false]
    [else
     (create-bst (create-bst-from-list (rest l)) (first (first l)) (first (rest (first l))))]))

(define sample
  '((99 0)
    (77 l)
    (24 i)
    (10 h)
    (95 g)
    (15 d)
    (89 c)
    (29 b)
    (63 a)))

(inorder (create-bst-from-list sample))