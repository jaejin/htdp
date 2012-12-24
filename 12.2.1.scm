#lang racket
(define-struct mail (from date message))

(define (sort alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert (first alon) (sort (rest alon)))]))

(define (insert n alon)
  (cond
    [(empty? alon) (cons n empty)]
    (else (cond
            [(>= (mail-date n) (mail-date (first alon))) (cons n alon)]
            [(< (mail-date n) (mail-date (first alon))) (cons (first alon) (insert n (rest alon)))]))))

(define mail-list (cons (make-mail "cccc" 19 "first") 
                       (cons (make-mail "aaaa" 20 "two") empty)))


(define (sort2 alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert2 (first alon) (sort (rest alon)))]))

(define (insert2 n alon)
  (cond
    [(empty? alon) (cons n empty)]
    (else (cond
            [(string<? (mail-from n) (mail-from (first alon))) (cons n alon)]
            [(string>? (mail-from n) (mail-from (first alon)))  (cons (first alon) (insert2 n (rest alon)))]))))

(mail-from (first (sort2 mail-list)))