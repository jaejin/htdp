#lang racket
(define (make-singles lst)
  (cond
    [(empty? lst) empty]
    [else (append (list (list (first lst))) (make-singles (rest lst)))]))

(define (merge-all-neighbors lst)
  (local ((define (sort alon)
            (cond
              [(empty? alon) empty]
              [(cons? alon) (insert (first alon) (sort (rest alon)))]))
          (define (insert n alon)
            (cond 
              [(empty? alon) (cons n empty)]
              [else (cond
                      [(< n (first alon)) (cons n alon)]
                      [(>= n (first alon)) (cons (first alon) (insert n (rest alon)))])])))     
  (cond
    [(empty? lst) empty]
    [(empty? (cdr lst)) (list (car lst))]
    [else 
     (append (list (sort (append (car lst) (cadr lst)))) (merge-all-neighbors (cddr lst)))])))

(make-singles (list 2 5 9 3 6))
;; => '((2) (5) (9) (3) (6))

(merge-all-neighbors (merge-all-neighbors (make-singles (list 2 5 9 3 6))))
;; => '((2 3 5 9) (6))


(define (merge-sort alon)
  (local ((define (merge-sort-helper alon)
            (cond
              [(empty? (cdr alon)) alon]
              [else
               (merge-sort-helper (merge-all-neighbors alon))])))
    (car (merge-sort-helper (make-singles alon)))))

(merge-sort '(2 5 9 3 1 2 4 5 6))
;; => '(1 2 2 3 4 5 5 6 9)

;; test
(equal? (merge-all-neighbors '((2) (5) (9) (3)))
        '((2 5) (3 9)))

(equal? (merge-all-neighbors '((2 5) (3 9)))
        '((2 3 5 9)))

(equal? (make-singles (list 2 5 9 3)) 
         (list (list 2) (list 5) (list 9) (list 3)))