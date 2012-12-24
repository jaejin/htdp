#lang racket
(define (how-many-symbols? l)
  (cond
    [(empty? l) 0]
    [(symbol? (first l)) (+ 1 (how-many-symbols? (rest l))) ]
    [else (+ 0 (how-many-symbols? (rest l))) ]))