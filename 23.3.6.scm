#lang racket
(define (series n a-term)
  (cond 
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
             (series (- n 1) a-term))]))


(define (e-power x)
  (local ((define (e-taylor i)
            (/ (expt x i) (! i)))
          (define (! n)
            (cond
              [(= n 0) 1]
              [else (* n (! (sub1 n)))])))
    (exact->inexact (series 47 e-taylor))))

(e-power 10)
(exp 10)