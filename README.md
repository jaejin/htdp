# htdp 연습문제 풀이


## racket을 사용할때 필요한 라이브러리

    #lang racket
    (require htdp/draw) ;; 그림 그릴때 사용하는 라이브러리 
    (require lang/posn) ;; 구조체 라이브러리
    (draw-solid-line start end color) ;; 라인그리기 `


## merge-sort 
  * 26.1.2 참조

## struct
  * 정의방법
  
      `(define-struct name value)`
      
   * 예제
       
      `(define-struts rr (table cost)) 
      (define-struts rr (table cost) #transparent)`
     
  * 주의점
  * equal? 을 사용할때 #transparent 옵션이 안 들어가 있는 경우엔 같은
  * 값으로 비교가 되질 않는다.
      
    
## 수학관련 함수
  * remainder : 나머지    
  * degrees->radians : 도를 라디안으로
  * sin, cos, tan : 라디안을 기본적으로 입력 받음
  * pi : 파이 
  * 그래픽 관 련
  * (start width height) : canvas을 만들어줌
