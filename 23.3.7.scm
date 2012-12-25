#lang racket
(define (series n a-term)
  (cond 
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
             (series (- n 1) a-term))]))


(define (ln x)
  (local ((define (e-taylor i)
           (cond 
             [(= i 0) 0]
             [(* 2 (expt (/ (- x 1) (+ x 1)) (odd i))
               (/ 1 (odd i)))]))
          (define (odd i)
            (cond
              [(= i 1) 1]
              [else (- (* 2 i) 1)])))
   (exact->inexact (series 42 e-taylor))))

 (exact->inexact (* 2 
     (+ (* (/ 1 1)
           (expt (/ (- 5 1) (+ 5 1) ) 1))
        (* (/ 1 3) 
           (expt (/ (- 5 1) (+ 5 1) ) 3))
        (* (/ 1 5) 
           (expt (/ (- 5 1) (+ 5 1) ) 5)))))
 
 (ln 5)
(log 5)