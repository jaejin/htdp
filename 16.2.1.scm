#lang racket
;; 16.2.1
(define TS '(read! (part1 part2 part3 ) 
                  ((hang draw)
                  (read! ))))

(define Code '(hang draw))
(define Docs '(read!))

(define (how-many dir)
  (cond 
    [(empty? dir) 0]
    [(symbol? (first dir)) (+ 1 (how-many (rest dir)))]
    [else 
      (+ (how-many (first dir)) (how-many (rest dir)))]))


(how-many TS)
