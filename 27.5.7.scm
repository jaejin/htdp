#lang racket
(define (evaluate avalue bvalue)
  (cond
    [(empty? bvalue) (car avalue)]
    [else
     (+ (* (first avalue) (first bvalue) -1)
        (evaluate (rest avalue) (rest bvalue)))]))

(define (get-solve avalue bvalue)
  (/ (evaluate (rest avalue) bvalue) (first avalue)))

(define (solve avalue)
  (local ((define solved-list (reverse avalue))
          (define first-solve (list (/ (first (rest (first solved-list))) (first (first solved-list)))))
          (define (solved-recur avalue bvalue)
            (cond 
              [(empty? avalue) empty]
              [else
               (cons (get-solve (first avalue) bvalue) (solved-recur (rest avalue) (cons (get-solve (first avalue) bvalue) bvalue)))])))
    (reverse (append first-solve (solved-recur  (rest solved-list) first-solve)))))


(solve (list (list 2 2 5 10)
             (list 3 9 21)
             (list   1 -19)))
    