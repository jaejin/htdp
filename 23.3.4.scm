#lang racket
(define (geometric-series start s)
  (local ((define (series n sum)
            (cond
              [(= n 0) sum]
              [else (series (- n 1) (* sum s))])))
    (define (g-closed n)
      (series n start))
    g-closed))
