#lang racket
(require htdp/dir)

;; 16.3.1
(define hang (make-file 'hang 8 empty))
(define draw (make-file 'draw 2 empty))
(define read2 (make-file 'read! 19 empty))
(define Code (make-dir 'Code empty (list hang draw)))
(define Docs (make-dir 'Docs empty (list read2)))

(define Libs (make-dir 'Libs (list Code Docs) empty))
  
(define part1 (make-file 'part1 99 empty))
(define part2 (make-file 'part2 52 empty))
(define part3 (make-file 'part3 17 empty))

(define Text (make-dir 'Text empty (list part1 part2 part3)))

(define read1 (make-file 'read! 10 empty))
(define TS (make-dir 'TS (list Text Libs) (list read1)))

;;(create-dir"/home/jaejin/Work/htdp")

   
         