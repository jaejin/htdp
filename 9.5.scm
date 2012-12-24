#lang racket

(require htdp/guess)

;; Exercise 9.5.2
(define (how-many-symbols l)
  (cond [(empty? l) 0]
        [else (+ (cond [(symbol? (first l)) 1]
                       [else 0]) (how-many-symbols (rest l)))]))


;; Exercise 9.5.3.
(define (dollar-store? l)
  (cond [(empty? l) #t]
        [else (and (< (first l) 1 )
                   (dollar-store? (rest l)))
                ]))

(dollar-store? empty)
(not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))))
(dollar-store? (cons .15 (cons .05 (cons .25 empty))))

;;Exercise 9.5.4.
(define (check-range2? temper)
  (and (> temper 5) (< temper 95)))

(define (check-range1? l)
  (cond [(empty? l) #t]
        [else (and (check-range2? (first l))
                   (check-range1? (rest l)))
                ]))

(define (check-range-with-low-high? temper low high)
  (and (> temper low) (< temper high)))


(define (check-range? l low high)
  (cond [(empty? l) #t]
        [else (and (check-range-with-low-high? (first l) low high)
                   (check-range1? (rest l)))
                ]))

(check-range1? '(10 22))

(check-range? '(10 22) 5 95)

;;Exercise 9.5.5.
(define (convert2 l count)
  (cond [(empty? l) 0]
        [else (+ (* (first l) (expt 10 count))
                 (convert2 (rest l) (+ count 1)))]))

(define (convert l)
  (convert2 l 0))

(define (check-guess-for-list l m)
   (cond [(> (convert l) m) 'TooLarge]
         [(< (convert l) m) 'TooSmall]
         [else 'Perfect]))

;;(guess-with-gui-list 5 check-guess-for-list)


;; 9.5.7
(define (average-price l)
  (cond [(empty? l) (error 'average-price "error")]
        [else (/ (sumlist l) (length l))]))

(define (sumlist l)
  (cond [(empty? l) 0]
        [else (+ (first l)
                 (sumlist (rest l)))]))

(define (length l)
  (cond [(empty? l) 0]
        [else (+ (first l)
                 (sumlist (rest l)))]))

;;(average-price '())
(average-price '(1 2 3))