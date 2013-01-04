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

(define A (xy->canvas 0 0))
(define B (xy->canvas 0 200))


(define (transform a-posn b-posn angle)
  (make-posn 
   (- (* (- (posn-x (canvas-xy b-posn)) (posn-y (canvas-xy a-posn))) (cos (degrees->radians angle))) 
      (* (- (posn-x (canvas-xy b-posn)) (posn-y (canvas-xy a-posn))) (sin (degrees->radians angle))))
   (+ (* (- (posn-x b-posn) (posn-y a-posn)) (sin (degrees->radians angle))) 
      (* (- (posn-x b-posn) (posn-y a-posn)) (cos (degrees->radians angle))))))

(define (transform-x angle posn)
  (make-posn 
   (* (cos (degrees->radians angle)) (posn-x posn))
   (posn-y posn)))

(start 400 400)
(draw-solid-line A B 'black)
(draw-solid-line A (transform ZERO B 45) 'red)

