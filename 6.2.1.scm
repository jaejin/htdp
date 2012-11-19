#lang racket
(require htdp/draw)
(require lang/posn)
(start 300 300)
(draw-solid-line (make-posn 1 1) (make-posn 5 5) 'red)
(draw-solid-rect (make-posn 20 10) 50 200 'blue)
(draw-circle (make-posn 200 10) 50 'red)
(draw-solid-disk (make-posn 200 10) 50 'green)
(stop)