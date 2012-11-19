#lang racket
(define simpweb '(TeachScheme!  aaaaaa))
(define compweb '(TeachScheme! aaaaaaaaaa
                              (LectureNotes For Teacher)
                              (Guidance for (DrRacket : a Scheme programming env Teacher))
                              (Exercies Sets (DrRacket : a Scheme programming env Teacher  (DrRacket : a Scheme programming env Teacher  (DrRacket : a Scheme programming env Teacher  (DrRacket : a Scheme programming env Teacher)))))
                              aaaaaaaaaaaaaaaaaaaaa))

(define (size a-wp)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (+ 1 (size (rest a-wp)))]
    [else (+ (size (first a-wp)) (size (rest a-wp)))]))

;; 14.3.2
(define (occurs2 symbol a-wp)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (cond
                              [(symbol=? (first a-wp) symbol) (+ 1 (occurs2 symbol (rest a-wp)))]
                              [else (+ (occurs2 symbol (rest a-wp)))])]
    [else (+ (occurs2 symbol (first a-wp)) (occurs2 symbol (rest a-wp)))]))

(occurs2 'Teacher compweb)

;; 14.3.3
(define (replace new old a-wp)
  (cond
    [(empty? a-wp) empty]
    [(symbol? (first a-wp)) (cond
                              [(symbol=? (first a-wp) old) (cons new (replace new old (rest a-wp)))]
                              [else (cons (first a-wp) (replace new old (rest a-wp)))])]
    [else (cons  (replace new old (first a-wp)) (replace new old (rest a-wp)))]))

(replace 'teacher 'Teacher compweb)

(replace '2222 'aaaaaa simpweb)

;;14.3.3
(define (depth2  a-wp)
   (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (+ (depth2 (rest a-wp)))]
    [else (+ 1 (depth2 (first a-wp)) (depth2 (rest a-wp)))]))

(define (depth3  a-wp)
  (cond
    [(empty? a-wp) empty]
    [(symbol? (first a-wp)) (append (depth3 (rest a-wp)))]
    [else (cons (depth2 (first a-wp)) (depth3 (rest a-wp)))]))


 
(define (find-max l v)
  (cond
    [(empty? l) v]
    [(> (first l) v) (find-max (rest l) (first l))]
    [else (find-max (rest l) v)]))

(define (depth a-wp)
  (+ 1 (find-max (depth3 a-wp) 0)))

(depth compweb)