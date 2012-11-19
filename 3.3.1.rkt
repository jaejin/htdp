#lang racket
;;3.3.1
(define 1INCH 2.54)
(define 1FOOT (* 12 1INCH))
(define 1YARD (* 3 1FOOT))
(define 1ROD (* 10/2 1YARD))
(define 1FURLONG (* 40 1ROD))
(define 1MILE (* 8 1FURLONG))

(define (inches->cm inches)
  (* inches 1INCH))

(define (feet->inches feet)
  (* feet 12))

(define (yards->feet yards)
  (* yards 3))

(define (rods->yards rods)
  (* 10/2 rods))

(define (furlongs->rods furlongs)
  (* furlongs 40))

(define (miles->furlongs miles)
  (* miles 8))

(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

(define (yards->cm yards)
  (feet->cm (yards->feet yards)))

(define (rods->inches rods)
  (feet->inches (yards->feet (rods->yards rods))))

(define (miles->feet miles)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs miles)))))
