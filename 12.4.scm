#lang racket
(define a-list (cons (cons 'e (cons 'r empty))
     (cons (cons 'r (cons 'e empty))
          empty)))

(define (insert-everywhere/in-all-words a-word a-list)
  (cond
    [(empty? a-list) empty]
    [else (append (insert-everywhere (list a-word) (first a-list))
               (insert-everywhere/in-all-words a-word (rest a-list)))]))

(define (insert-everywhere a-word a-list)
  (cond
    [(empty? a-list) (list a-word)]
    [else (cons (append a-word a-list)
               (insert-everywhere (cons (first a-list)  a-word ) (rest a-list)))]))

(insert-everywhere (list 'd)  '(e r))

(insert-everywhere/in-all-words 'd a-list)

(define (arrangements a-word)
  (cond
    [(empty? a-word) (cons empty empty)]
    [else (insert-everywhere/in-all-words (first a-word)
                                         (arrangements (rest a-word)))]))

(arrangements '(a b c d))