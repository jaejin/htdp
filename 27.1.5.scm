#lang racket

(require htdp/draw)
(require lang/posn)


(define (bezier p1 p2 p3)
  (local ((define (bezier-line-helper point-l)
            (cond [(<= (length point-l) 1) true]
                  [else
                   (and
                    (cond [(too-small2? (car point-l) (cadr point-l)) (draw-solid-line (car point-l) (cadr point-l) 'blue)]
                          [else (bezier-line-helper (cdr point-l))]))]))
          (define (bezier-helper p1 p2 p3 point-l)
                   (cond
                     [(too-small? p1 p2 p3) (bezier-line-helper point-l)]
                     [else
                      (local ((define r (mid-point p1 p2))
                              (define q (mid-point p2 p3))
                              (define r-q (mid-point r q))
                              (define point-l2 (cons r-q point-l)))
                        (and
                         (bezier-helper p1 r r-q point-l2)
                         (bezier-helper p3 q r-q point-l2)))])))
    (draw-triangle p1 p2 p3)
    (bezier-helper p1 p2 p3 '())))

(define (too-small? a b c)
  (and 
   (< (abs (- (posn-x a) (posn-x b))) 1/5)
   (< (abs (- (posn-x c) (posn-x a))) 1/5)
   (< (abs (- (posn-x b) (posn-x c))) 1/5)))

(define (too-small2? a b)
  (< (abs (- (posn-x a) (posn-x b))) 1/2))

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
    
(define p1 (make-posn 50 50))
(define p2 (make-posn 150 150))
(define p3 (make-posn 250 100))

(start 300 300)
(bezier p1 p2 p3)
  