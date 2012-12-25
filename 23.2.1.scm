#lang racket
(define (series n)
          (cond
            [(= n 0) 8]
            [else (+ 5
                    (series (- n 1)))]))

(define (a-fives n)
  (series n))