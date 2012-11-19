#lang racket
(define (series-local a-term)
  (local ((define (series n) 
            (cond
              [(= n 0) (a-term n)]
              [else (+ (a-term n)
                      (series (- n 1)))])))
  series))

(define (make-even i)
  (* 2 i))

(define (make-odd i)
  (+ (* 2 i) 1))

(define (series2 n a-term)
  (cond 
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
            (series2 (- n 1) a-term))]))

(define (series-even1 n)
  (series2 n make-even))

(define (series-odd1 n)
  (series2 n make-odd))

(= (series-even1 5) ((series-local make-even) 5))

(= (series-odd1 5) ((series-local make-odd) 5))