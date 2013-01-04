# htdp 연습문제 풀이


## racket을 사용할때 필요한 라이브러리

    #lang racket
    (require htdp/draw) ;; 그림 그릴때 사용하는 라이브러리 
    (require lang/posn) ;; 구조체 라이브러리
    (draw-solid-line start end color) ;; 라인그리기 `


# merge-sort 
    * 26.1.2 참조
    
    
# 수학관련 함수
  * remainder : 나머지
  * degrees->radians : 도를 라디안으로
  * sin, cos, tan : 라디안을 기본적으로 입력 받음
  * pi : 파이 

* 그래픽 관련
  * (start width height) : canvas을 만들어줌
