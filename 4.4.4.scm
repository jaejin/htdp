#lang racket
(define (how-many a b c)
  (cond
    ((> (* b b) (4 a c)) 2)
    ((= (* b b) (4 a c)) 1)
    ((< (* b b) (4 a c)) 0)))
;; 올바른 이차 방정식이 아니라면 
(define (how-many2 a b c)
  (cond
    ((= a 0) '())
    ((> (* b b) (4 a c)) 2)
    ((= (* b b) (4 a c)) 1)
    ((< (* b b) (4 a c)) 0)))
