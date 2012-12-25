#lang racket
(define (g-fives n)
  (cond
    [(= n 0) 3]
    [else (* 5 (g-fives (- n 1)))])) 