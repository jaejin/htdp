#lang racket
<<<<<<< HEAD
(define-struct child (father mother name date eyes))

(define Carl (make-child empty empty 'Carl 1926 'green))
(define Battina (make-child empty empty 'Bettina 1926 'green))
=======
(define-struct child (father mather name date eyes))

(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))
>>>>>>> 4c9782730394778ce217e11fcf6dd1c53c948048

(define Adam (make-child Carl Battina 'Adam 1950 'yello))
(define Dave (make-child Carl Battina 'Dave 1955 'black))
(define Eva (make-child Carl Battina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))

<<<<<<< HEAD
(define Gustav (make-child Fred Eva 'Gustav 1988 'blue))
=======
(define Gustav (make-child Fed Eva 'Gustav 1988 'brown))
>>>>>>> 4c9782730394778ce217e11fcf6dd1c53c948048

(define (count-persons a-ftree)
  (cond
    [(empty? a-ftree) 0]
<<<<<<< HEAD
    [else (+ 1 
             (count-persons (child-father a-ftree))
             (count-persons (child-mother a-ftree)))]))

(count-persons Gustav)

;;14.1.4
(define (sum-age a-ftree current)
  (cond
    [(empty? a-ftree) 0]
    [else (+ (- current (child-date a-ftree))
             (sum-age (child-father a-ftree) current)
             (sum-age (child-mother a-ftree) current))]))

(define (average-age a-ftree current)
  (/ (sum-age a-ftree current)
     (count-persons a-ftree)))

(average-age Adam 2011)

;;14.1.5
(define (sum-eyes a-ftree)
  (cond
    [(empty? a-ftree) empty]
    [else (append  (list (child-eyes a-ftree))
             (sum-eyes (child-father a-ftree))
             (sum-eyes (child-mother a-ftree)))]))

(sum-eyes Adam)

;;14.1.6
(define (blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (symbol=? (child-eyes a-ftree) 'blue)
              (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree)))]))

(define (proper-blue-eyed-ancestor? a-ftree)
  (or (blue-eyed-ancestor? (child-father a-ftree))
      (blue-eyed-ancestor? (child-mother a-ftree))))

(proper-blue-eyed-ancestor? Eva)
=======
    [(child-father 
>>>>>>> 4c9782730394778ce217e11fcf6dd1c53c948048
