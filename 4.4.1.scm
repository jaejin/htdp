#lang racket
(define (interest amount)
  (cond
    ((<= amount 1000) (* amount 0.40))
    ((<= amount 5000) (* amount 0.45))
    ((> amount 5000) (* amount 0.5))))

(interest 5000)
(interest 6000)
(interest 1000)
