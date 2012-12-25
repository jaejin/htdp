#lang racket
(define (series n a-term)
  (cond 
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
             (series (- n 1) a-term))]))

(define (my-sin x)
  (local ((define (sin-taylor i)
            (cond 
              [(= (remainder i 2) 1)
               (- (/ (expt x (odd i)) (! (odd i))))]
              [else 
               (/ (expt x (odd i)) (! (odd i)))]))
          (define (odd i)
            (cond 
              [(= i 0) 1]
              [else (- (* 2 (add1 i)) 1)]))
          (define (! n)
            (cond 
              [(= n 0) 1]
              [else (* n (! (sub1 n)))])))
     (exact->inexact (series 41 sin-taylor))))

(sin 10)
(my-sin 10)