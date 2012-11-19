;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
#lang racket
;; 2.2.1
(require htdp/convert)
(define (Fahrenheit->Celsius input)
  (/ (- input 32) 1.8))

(Fahrenheit->Celsius 38)
(convert-gui Fahrenheit->Celsius)

(convert-repl Fahrenheit->Celsius)