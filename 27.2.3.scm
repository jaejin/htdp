#lang racket
(require lang/posn)

(define (file->list-of-lines afile)
  (local ((define (first-remove-line afile rest-value helper)
            (cond
              [(empty? afile) empty]
              [else (cond
                      [(and (symbol? (first afile)) (symbol=? (first afile) NEWLINE)) rest-value]
                      [else (helper (rest afile))])]))
          (define (first-line afile)
            (first-remove-line afile empty (lambda 
                                               (rest-afile) 
                                             (cons (first afile) (first-line rest-afile)))))
          (define (remove-first-line afile)
            (first-remove-line afile  (if (empty? afile) afile (rest afile)) (lambda 
                                                      (rest-afile) 
                                                    (remove-first-line rest-afile)))))
    (cond
      [(empty? afile) empty]
      [else
       (cons (first-line afile)
             (file->list-of-lines (remove-first-line afile)))])))

(define NEWLINE 'NL)

(define-struct rr (table costs) #:transparent)

(define (file->list-of-checks afile)
  (local ((define (make-table tables)
            (cond
              [(empty? tables) empty]
              [else
               (cons (make-rr (caar tables) (rest (first tables))) (make-table (rest tables)))])))
    (make-table (file->list-of-lines afile))))

(file->list-of-lines (list 1 2.30 4.00 12.50 13.50 'NL
               2 4.00 18.00 'NL
               4 2.30 12.50))

(and
 (equal?  (rr-table (car (file->list-of-checks (list 1 2.30 4.00 12.50 13.50))))
         (rr-table (make-rr 1 (list 2.30 4.00 12.50 13.50))))
 (equal? (rr-costs (make-rr 1 (list 2.30 4.00 12.50 13.50)))
        (rr-costs (car (file->list-of-checks (list 1 2.30 4.00 12.50 13.50))))))

(rr-costs (car (file->list-of-checks 
         (list 1 2.30 4.00 12.50 13.50 'NL
               2 4.00 18.00 'NL
               4 2.30 12.50))))
      
(rr-costs (car (list (make-rr 1 (list 2.30 4.00 12.50 13.50))
              (make-rr 2 (list 4.00 18.00))
              (make-rr 4 (list 2.30 12.50)))))

(require rackunit)
(require rackunit/text-ui)

(define foo-tests
  (test-suite
   "Test for foo"

   (check-equal? (file->list-of-checks
                   (list 1 2.30 4.00 12.50 13.50 'NL
                         2 4.00 18.00 'NL
                         4 2.30 12.50))
                 (list (make-rr 1 (list 2.30 4.00 12.50 13.50))
                       (make-rr 2 (list 4.00 18.00))
                       (make-rr 4 (list 2.30 12.50))))
   ))

(exit (run-tests foo-tests))    