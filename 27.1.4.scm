#lang racket
(require htdp/draw)
(require lang/posn)

(define ZERO (make-posn 200 400))

(define (xy->canvas posn)
  (make-posn 
   (+ (posn-x ZERO) (posn-x posn))
   (- (posn-y ZERO) (posn-y posn))))

(define (canvas->xy posn)
  (make-posn 
   (- (posn-x ZERO) (posn-x posn))
   (+ (posn-y ZERO) (posn-y posn))))

(define A (xy->canvas (make-posn 0 0)))
(define B (xy->canvas (make-posn 0 200)))


(define (transform a-posn b-posn angle)
  (make-posn 
   (- (* (- (posn-x  b-posn) (posn-x a-posn)) (cos (degrees->radians angle))) 
      (* (- (posn-y  b-posn) (posn-y a-posn)) (sin (degrees->radians angle))))
   (+ (* (- (posn-x b-posn) (posn-x a-posn)) (sin (degrees->radians angle))) 
      (* (- (posn-y b-posn) (posn-y a-posn)) (cos (degrees->radians angle))))))

(define (canvas-transform a-posn b-posn angle)
   (transform (canvas->xy a-posn) (canvas->xy b-posn) angle))

(transform (make-posn 0 0) (make-posn 0 200) 45)
           
(xy->canvas (transform (make-posn 0 0) (make-posn 200 200) 45))

(start 400 800)
(draw-solid-line A B 'black)
(draw-solid-line (make-posn 200 350) (xy->canvas (canvas-transform ZERO B 225)) 'red)
(draw-solid-line (make-posn 200 250) (xy->canvas (canvas-transform ZERO B -225)) 'red)
;;(draw-solid-line ZERO (xy->canvas (canvas-transform ZERO B 225)) 'red)

