#lang racket
(require htdp/draw)
(require lang/posn)

(define CENTER (make-posn 200 200))
(define RADIUS 200)

(define (circle-pt factor)
  (make-posn (+ (posn-x CENTER) (* RADIUS (sin (degrees->radians (* 360 factor)))))
             (+ (posn-y CENTER) (* RADIUS (cos (degrees->radians (* 360 factor)))))))

(define A (circle-pt 120/360))
(define B (circle-pt 240/360))
(define C (circle-pt 360/360))

(define (draw-triangle a b c)
  (and
   (draw-solid-line a b 'black)
   (draw-solid-line b c 'black)
   (draw-solid-line c a 'black)))
    
(start 450 450)
(draw-circle CENTER RADIUS 'red)
(draw-triangle A B C)