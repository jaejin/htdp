#lang scheme
(require lang/posn)
(define (distance-to-0 a-posn)
  (sqrt
   (+ (sqr (posn-x a-posn))
      (sqr (posn-y a-posn)))))

(distance-to-0 (make-posn 3 4))
(distance-to-0 (make-posn (* 2 3) (* 2 4)) )
(distance-to-0 (make-posn 12 (- 6 1)) )
