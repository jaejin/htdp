#lang racket
(require htdp/draw)
(require lang/posn)
(define WIDTH 50)
(define HEIGHT 300)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

(start WIDTH HEIGHT)
;;(draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)
;;(draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
;;(draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)

(define (clear-bulb color)
  (cond ((eq? color 'red)
         (and (draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'white)
              (draw-circle (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)))
        ((eq? color 'yellow)
         (and (draw-solid-disk (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'white)
              (draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)))
        (else
         (and (draw-solid-disk (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'white)
              (draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)))))

(define (draw-bulb color)
  (cond ((eq? color 'red)
         (draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red))
        ((eq? color 'yellow)
         (draw-solid-disk (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow))
        (else
         (draw-solid-disk (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green))))

(define (switch color-1 color-2)
  (and (clear-bulb color-1) (draw-bulb color-2)))

(define (next current-color)
  (cond
    ((and (symbol=? current-color 'red) (switch 'red 'green)) 'green)
    ((and (symbol=? current-color 'yellow) (switch 'yellow 'red)) 'red)
    ((and (symbol=? current-color 'green) (switch 'green 'yellow)) 'yellow)))

(draw-bulb 'red)
(next (next (next 'red)))
