# htdp 연습문 제 풀 이


+ ;; #lang racket을 사용할때 필요한 라이브러리
+ (require htdp/draw) ;; 그림 그릴때 사용하는 라이브러리
+ (require lang/posn) ;; 구조체 라이브러리

+ ;; insert-sort 
    
    (define (make-singles lst)
      (cond
        [(empty? lst) empty]
        [else (append (list (list (first lst))) (make-singles (rest lst)))]))

    (define (merge-all-neighbors lst)
      (local ((define (sort alon)
                (cond
                  [(empty? alon) empty]
                  [(cons? alon) (insert (first alon) (sort (rest alon)))]))
              (define (insert n alon)
                (cond 
                  [(empty? alon) (cons n empty)]
                  [else (cond
                          [(< n (first alon)) (cons n alon)]
                          [(>= n (first alon)) (cons (first alon) (insert n (rest alon)))])])))     
      (cond
        [(empty? lst) empty]
        [(empty? (cdr lst)) (list (car lst))]
        [else 
         (append (list (sort (append (car lst) (cadr lst)))) (merge-all-neighbors (cddr lst)))])))

    (make-singles (list 2 5 9 3 6))
    ;; => '((2) (5) (9) (3) (6))

    (merge-all-neighbors (merge-all-neighbors (make-singles (list 2 5 9 3 6))))
    ;; => '((2 3 5 9) (6))
    
    
    (define (merge-sort alon)
      (local ((define (merge-sort-helper alon)
                (cond
                  [(empty? (cdr alon)) alon]
                  [else
                   (merge-sort-helper (merge-all-neighbors alon))])))
        (car (merge-sort-helper (make-singles alon)))))
    
