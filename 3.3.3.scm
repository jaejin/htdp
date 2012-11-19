#lang racket
(define (area-cylinder r h)
  (+ (* r r 3.14 2)
     (* r 2 3.14 h)))