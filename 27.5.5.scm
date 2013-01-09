#lang racket
(define (triangulate afile)
  (local ((define (first-triangulate l1 l2)
            (map (lambda (x)
                   (subtract l1 x))
                 l2)))
    (cond
      [(= (length (car afile)) 2) afile]
      [else
       (cond
         [(= (car (car afile)) 0)
          (cons (car (cdr afile))
                (triangulate (first-triangulate (car (cdr afile)) (remove (car (cdr afile)) afile))))]
         [else
          (cons (car afile) 
                (triangulate (first-triangulate (car afile) (rest afile))))])])))

(define (subtract l1 l2)
  (local ((define (subtract-helper f subtract-value avalue)
            (cond 
              [(empty? avalue) empty]
              [else
               (cons (f (car avalue) (car subtract-value)) (subtract-helper f (cdr subtract-value) (cdr avalue)))])))
          
    (cond
      [(= (car l2) 0)
       (cdr l2)]
      [(and (> (car l1) 0) (> (car l2) 0))
       (cond 
         [(>= (- (car l2) (car l1)) 0) (subtract l1 (cons (- (car l2) (car l1)) (subtract-helper - (cdr l1) (cdr l2))))]
         [else
          (cdr l2)])]
      [(and (< (car l1) 0) (> (car l2) 0))
       (cond 
         [(>= (+ (car l2) (car l1)) 0) (subtract l1 (cons (+ (car l2) (car l1)) (subtract-helper - (cdr l1) (cdr l2))))]
         [else
          (cdr l2)])]
      [else
       (cond 
         [(>= (+ (car l2) (car l1)) 0) (subtract l1 (cons (+ (car l2) (car l1)) (subtract-helper + (cdr l1) (cdr l2))))]
         [else
          (cdr l2)])])))
                           
(triangulate (list (list 2 3  3 8)
                    (list 2 3 -2 3)
                    (list 4 -2 2  4)))                       