#lang racket
(define (a-fives-closed n)
  (local ((define (series n sum)
            (cond
              [(= n 0) sum]
              [else (series (- n 1) (+ sum 5))])))
    (series n 8)))

