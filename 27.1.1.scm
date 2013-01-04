#lang racket
(require htdp/draw)
(require lang/posn)

(define (sierpinski a b c)
  (cond
    [(too-small? a b c) true]
    [else
     (local ((define a-b (mid-point a b))
             (define b-c (mid-point b c))
             (define c-a (mid-point c a)))
       (and
        (draw-triangle a b c)
        (sierpinski a a-b c-a)
        (sierpinski b a-b b-c)
        (sierpinski c c-a b-c)))]))

(define (too-small? a b c)
  (and 
   (< (abs (- (posn-x a) (posn-x b))) 10)
   (< (abs (- (posn-x c) (posn-x a))) 10)
   (< (abs (- (posn-x b) (posn-x c))) 10)))

(define (mid-point a-posn b-posn)
  (make-posn
   (mid (posn-x a-posn) (posn-x b-posn))
   (mid (posn-y a-posn) (posn-y b-posn))))

(define (mid x y)
  (/ (+ x y) 2))

(define (draw-triangle a b c)
  (and
   (draw-solid-line a b 'black)
   (draw-solid-line b c 'black)
   (draw-solid-line c a 'black)))
    
(define A (make-posn 200 0))
(define B (make-posn 27 300))
(define C (make-posn 373 300))

(start 400 400)
(sierpinski A B C)

  