#lang racket
(require lang/posn)
(require htdp/draw)
;; 6.6.1
(define-struct circle (centerofcircle r color))
(define (fun-for-circle posn r color)
  (make-circle (make-posn (posn-x posn) (posn-y posn))
               r
               color))

;; 6.6.2
(define (draw-a-circle circle)
  (draw-circle (circle-centerofcircle circle) (circle-r circle) (circle-color circle))
  )

;; 6.6.3
(define (in-circle? circle posn)
  (>= (circle-r circle) (sqrt (+ 
                               (* (- (posn-x (circle-centerofcircle circle)) (posn-x posn))
                                  (- (posn-x (circle-centerofcircle circle)) (posn-x posn)))
                               (* (- (posn-y (circle-centerofcircle circle)) (posn-y posn))
                                  (- (posn-y (circle-centerofcircle circle)) (posn-y posn)))))))

;; 6.6.4
(define (translate-circle circle delta)
  (fun-for-circle (make-posn (+ (posn-x (circle-centerofcircle circle)) delta) (posn-y (circle-centerofcircle circle)))
                  (circle-r circle)
                  (circle-color circle)))

;; 6.6.5
(define (clear-a-circle circle)
  (clear-circle (circle-centerofcircle circle) (circle-r circle) (circle-color circle)))

;; 6.6.6
(define (draw-and-clear-circle circle)
  (draw-a-circle circle)
  (sleep-for-a-while 1)
  (clear-a-circle circle))

;; 6.6.6.2
;; 원을 그렸다가 지운 후에 이를 delta 픽셀만큼 이동함 
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

;; 6.6.7

(define-struct rectangle (posn width height color))
(define (fun-for-rectangle posn width height color)
  (make-rectangle (make-posn (posn-x posn) (posn-y posn))
                 width
                 height
                 color))

;; 6.6.8
(define (draw-a-rectangle rectangle)
  (draw-solid-rect (rectangle-posn rectangle) (rectangle-width rectangle) (rectangle-height rectangle) (rectangle-color rectangle))
  )

;; 6.6.9
(define (in-rectangle? rectangle posn)
  (and
   (and 
    (>= (rectangle-width rectangle) (- (posn-x posn) (posn-x (rectangle-posn rectangle))))
    (<= 0 (- (posn-x posn) (posn-x (rectangle-posn rectangle)))))
   (and
    (>= (rectangle-height rectangle) (- (posn-y posn) (posn-y (rectangle-posn rectangle))))
    (<= 0 (rectangle-height rectangle) (- (posn-y posn) (posn-y (rectangle-posn rectangle)))))))

;; 6.6.10
(define (translate-rectangle rectangle delta)
  (make-rectangle (make-posn (+ (posn-x (rectangle-posn rectangle)) delta) (posn-y (rectangle-posn rectangle)))
                 (rectangle-width rectangle)
                 (rectangle-height rectangle)
                 (rectangle-color rectangle)))


;; 6.6.11
(define (clear-a-rectangle rectangle)
  (clear-solid-rect (rectangle-posn rectangle) (rectangle-width rectangle) (rectangle-height rectangle) (rectangle-color rectangle))
  )

;; 6.6.12
(define (draw-and-clear-rectangle rectangle)
  (draw-a-rectangle rectangle)
  (sleep-for-a-while 1)
  (clear-a-rectangle rectangle))

(define (move-rectangle delta a-rectangle)
  (cond
    [(draw-and-clear-rectangle a-rectangle)
     (translate-rectangle a-rectangle delta)]
    [else a-rectangle]))

(define one (fun-for-circle (make-posn 20 20) 10 'red))
(define rectangle-one (fun-for-rectangle (make-posn 40 40) 20 10 'red))
(in-circle? one (make-posn 8 6))
(in-rectangle? rectangle-one (make-posn 8 6))



(start 300 300)


(draw-a-circle 
 (move-circle 10
              (move-circle 10
                           (move-circle 10 
                                        one))))

(draw-a-rectangle 
 (move-rectangle 10
              (move-rectangle 10
                           (move-rectangle 10 
                                        rectangle-one))))

(clear-a-rectangle rectangle-one)
;;(draw-and-clear-circle one)
;;(clear-a-circle one)
;;(draw-a-circle (translate-circle one 20))


