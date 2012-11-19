#lang racket
(define-struct fly-fighter ( name  va  max range))
(define (within-range a-fly range)
  (if (> (fly-fighter-range a-fly) range) #t #f))

(define (reduce-range a-fly)
  (make-fly-fighter
   (fly-fighter-name a-fly)
   (fly-fighter-va a-fly)
   (fly-fighter-max a-fly)
   (* (fly-fighter-range a-fly) 0.8)))


(make-fly-fighter 'tonado 20 30 40)

(within-range (make-fly-fighter 'f22 20 30 40) 30)
(within-range (make-fly-fighter 'f22 20 30 40) 50)
(fly-fighter-range (reduce-range (make-fly-fighter 'tonado 20 30 40)))