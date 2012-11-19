#lang racket
(define-struct parent (children name date eyes))

(define Gustav (make-parent empty 'Gustav 1988 'green))

(define Fred&Eva (list Gustav))

(define Adam (make-parent empty 'Adam 1950 'green))
(define Dave (make-parent empty 'Dave 1955 'green))
(define Eva (make-parent Fred&Eva 'Eva 1965 'green))
(define Fred (make-parent Fred&Eva 'Fred 1966 'green))

(define Carl&Bettina (list Adam Dave Eva))

(define Carl (make-parent Carl&Bettina 'Carl 1926 'blue))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))

(define (blue-eyed-descendant? a-parent)
  (or (symbol=? (parent-eyes a-parent) 'blue)
     (blue-eyed-children? (parent-children a-parent))))

(define (blue-eyed-children? aloc)
  (cond
    [(empty? aloc) false]
    [else (or (blue-eyed-descendant? (first aloc))
             (blue-eyed-children? (rest aloc)))]))


;; 15.1.2
(define (how-far-removed1 a-parent n)
  (cond
    [(symbol=? (parent-eyes a-parent) 'blue)  n]
    [else (how-far-removed-children (parent-children a-parent)  (+ n 1))]))

(define (how-far-removed-children aloc n)
  (cond
    [(empty? aloc) false]
    [else  (or (how-far-removed1 (first aloc) n)
             (how-far-removed-children (rest aloc) n ))]))

 (define (how-far-removed a-parent)
   (how-far-removed1 a-parent 0))

 
 
 ;;15.1.3
 (define (proper-descendants a-parent )
   (+  (proper-children (parent-children a-parent))))

(define (proper-children aloc)
  (cond
    [(empty? aloc) 0]
    [else  (+  1 (proper-descendants (first aloc) )
              (proper-children (rest aloc)))]))

(define (count-descendants a-parent)
  (+  1 (count-children (parent-children a-parent))))

(define (count-children aloc)
  (cond
    [(empty? aloc) 0]
    [else  (+  (count-descendants (first aloc) )
              (count-children (rest aloc)))]))

(count-descendants Carl)
(proper-descendants Carl )
(proper-descendants Fred )

;; 15.1.4
 (define (color-descendants a-parent )
   (append (list (parent-eyes a-parent))  (color-children (parent-children a-parent))))

(define (color-children aloc)
  (cond
    [(empty? aloc) empty]
    [else  (append (color-descendants (first aloc) )
              (color-children (rest aloc)))]))

(color-descendants Carl)