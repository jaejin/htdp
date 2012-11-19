#lang racket
;;10.1.6
(define (substitute s c l)
  (cond [(empty? l) empty]
        [else (cons (cond [(symbol=? (first l) c) s]
                          [else (first l)])
                    (substitute s c (rest l)))]))