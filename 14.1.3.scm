#lang racket
(define-struct child (father mather name date eyes))

(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))

(define Adam (make-child Carl Battina 'Adam 1950 'yello))
(define Dave (make-child Carl Battina 'Dave 1955 'black))
(define Eva (make-child Carl Battina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))

(define Gustav (make-child Fed Eva 'Gustav 1988 'brown))

(define (count-persons a-ftree)
  (cond
    [(empty? a-ftree) 0]
    [(child-father 