#lang racket
(define (g-fives-closed n)
  (local ((define (series n sum)
            (cond
              [(= n 0) sum]
              [else (series (- n 1) (* sum 5))])))
    (series n 3)))

(define (g-fives n)
  (cond
    [(= n 0) 3]
    [else (* 5 (g-fives (- n 1)))])) 

(define (seq-g-fives n)
  (build-list (+ n 1) g-fives-closed))