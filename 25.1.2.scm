#lang racket
(require htdp/draw)
(require lang/posn)


(define-struct ball (x y delta-x delta-y))
;; 공(ball)은 구조체다.

;; draw-and-clear : a-ball ->true
(define (draw-and-clear a-ball)
  (and
   (draw-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red)
   (sleep-for-a-while DELAY)
   (clear-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red)))

;; move-ball : ball -> ball
(define (move-ball a-ball)
  (make-ball (+ (ball-x a-ball) (ball-delta-x a-ball))
             (+ (ball-y a-ball) (ball-delta-y a-ball))
             (ball-delta-x a-ball)
             (ball-delta-y a-ball)))

;;화면크기
(define WIDTH 100)
(define HEIGHT 100)
(define DELAY .5)

;; out-of-bounds? a-ball -> boolean
;; a-ball이 화면바깥에 있는지 검사한다.
;; 도메인식, 기하학
(define (out-of-bounds? a-ball)
  (not
   (and
    (<= 0 (ball-x a-ball) WIDTH)
    (<= 0 (ball-y a-ball) HEIGHT))))


(define (move-until-out a-ball)
  (cond
    [(out-of-bounds? a-ball) true]
    [else (and (draw-and-clear a-ball)
               (move-until-out (move-ball a-ball)))]))


(define (make-ball-list)
  (local ((define (make-a-ball a)
            (make-ball (random 99) (random 99) (- (random 50)) (random 50))))
    (build-list 10 make-a-ball)))

(define (make-balls ball-list)
  (map move-until-out ball-list))

(start WIDTH HEIGHT)
(make-balls (make-ball-list))
(stop)