#lang racket
(define (subtract l1 l2)
  (local ((define (subtract-helper f subtract-value avalue)
            (cond 
              [(empty? avalue) empty]
              [else
               (cons (f (car avalue) (car subtract-value)) (subtract-helper f (cdr subtract-value) (cdr avalue)))])))
          
    (cond
      [(= (car l2) 0)
       l2]
      [(and (> (car l1) 0) (> (car l2) 0))
       (cond 
         [(>= (- (car l2) (car l1)) 0) (subtract l1 (cons (- (car l2) (car l1)) (subtract-helper - (cdr l1) (cdr l2))))]
         [else
          l2])]
      [(and (< (car l1) 0) (> (car l2) 0))
       (cond 
         [(>= (+ (car l2) (car l1)) 0) (subtract l1 (cons (+ (car l2) (car l1)) (subtract-helper - (cdr l1) (cdr l2))))]
         [else
          l2])]
      [else
       (cond 
         [(>= (+ (car l2) (car l1)) 0) (subtract l1 (cons (+ (car l2) (car l1)) (subtract-helper + (cdr l1) (cdr l2))))]
         [else
          l2])])))

(subtract (list 3 9 21) (list -3 -8 -19))