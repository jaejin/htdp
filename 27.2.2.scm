#lang racket
(define (file->list-of-lines afile)
  (local ((define (first-remove-line afile rest-value helper)
            (cond
              [(empty? afile) empty]
              [else (cond
                      [(symbol=? (first afile) NEWLINE) rest-value]
                      [else (helper (rest afile))])]))
          (define (first-line afile)
            (first-remove-line afile empty (lambda 
                                               (rest-afile) 
                                             (cons (first afile) (first-line rest-afile)))))
          (define (remove-first-line afile)
            (first-remove-line afile (rest afile) (lambda 
                                                      (rest-afile) 
                                                    (remove-first-line rest-afile)))))
    (cond
      [(empty? afile) empty]
      [else
       (cons (first-line afile)
             (file->list-of-lines (remove-first-line afile)))])))

(define NEWLINE 'NL)

(file->list-of-lines (list 'a 'b 'c 'NL 'd 'e 'NL 'f 'g 'h 'NL))
