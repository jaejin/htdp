#lang racket
(define (series n a-term)
  (cond 
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
             (series (- n 1) a-term))]))

(define (greg)
  (local ((define (phi-taylor i)
            (* 4 (cond
                   [(= (remainder i 2) 1)
                    (- (/ 1 (odd i)))]
                   [else
                    (/ 1 (odd i))])))
          (define (odd i)
            (- (* 2 (add1 i)) 1)))
   (exact->inexact (series 500 phi-taylor))))

(greg)
          