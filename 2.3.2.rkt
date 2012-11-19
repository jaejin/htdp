#lang racket
(define (sum-coins penny nickel dime quarter)
  (+ (* 1 penny) (* 5 nickel) (* 10 dime) (* 25 quarter)))

(sum-coins 1 5 10 25)