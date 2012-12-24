#lang racket
(require lang/posn)
(require htdp/draw)

;;(start 300 300)

(define (draw-next-part part)
  (cond
    [(and
      (symbol=? 'noose part)
      (draw-solid-line (make-posn 0 20) (make-posn 100 20))
      (draw-solid-line (make-posn 100 20) (make-posn 100 40))
      (draw-circle (make-posn 115 70) 35 )
      (draw-solid-line (make-posn 115 50) (make-posn 125 60))
      (draw-solid-line (make-posn 125 50) (make-posn 115 60))
      (draw-solid-line (make-posn 129 65) (make-posn 139 75))
      (draw-solid-line (make-posn 139 65) (make-posn 129 75)))]
    [(and
      (symbol=? 'head part)
      (draw-circle (make-posn 90 70) 9 ))]
    [(and
      (symbol=? 'body part)
      (draw-solid-line (make-posn 90 79) (make-posn 90 150)))]
    [(and
      (symbol=? 'left-arm part)
      (draw-solid-line (make-posn 90 93) (make-posn 160 82)))]
    [(and
      (symbol=? 'right-arm part)
      (draw-solid-line (make-posn 20 82) (make-posn 90 93)))]
    [(and
      (symbol=? 'left-leg part)
      (draw-solid-line (make-posn 20 190) (make-posn 90 150)))]
    [else
     (draw-solid-line (make-posn 20 190) (make-posn 90 150))]))

;;noose
;;(draw-solid-line (make-posn 0 20) (make-posn 100 20))
;;(draw-solid-line (make-posn 100 20) (make-posn 100 40))
;;(draw-circle (make-posn 115 70) 35 )
;;(draw-solid-line (make-posn 115 50) (make-posn 125 60))
;;(draw-solid-line (make-posn 125 50) (make-posn 115 60))
;;(draw-solid-line (make-posn 129 65) (make-posn 139 75))
;;(draw-solid-line (make-posn 139 65) (make-posn 129 75))

;; head
;;(draw-circle (make-posn 90 70) 9 )
;; body
;;(draw-solid-line (make-posn 90 79) (make-posn 90 150))

;; left-arm
;;(draw-solid-line (make-posn 90 93) (make-posn 160 82))
;; right-arm
;;(draw-solid-line (make-posn 20 82) (make-posn 90 93))

;; left-leg
;;(draw-solid-line (make-posn 20 190) (make-posn 90 150))
;; right-leg
;;(draw-solid-line (make-posn 90 150) (make-posn 160 190))

(define-struct word (first second third))

(define (check-word word find search)
  (cond
    [(symbol=? word search)
     word]
    [(not (symbol=? '_ find)) find]
    [else '_]))

(define (reveal word find search)
  (make-word (check-word (word-first word)
                        (word-first find)
                        search)
             (check-word (word-second word)
                        (word-second find)
                        search)
             (check-word (word-third word)
                        (word-third find)
                        search)))
               

;;(hangman make-word reveal draw-next-part)