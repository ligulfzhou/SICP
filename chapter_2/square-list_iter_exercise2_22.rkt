#lang racket

(define (square x)
  (* x x))

(define (square-list item)
  (define (iter x y)
    (if (null? x)
        y
        (iter (cdr x) (cons (square y (car x))))))
  (iter item '()))

;;;;;;;;;test;;;;;;;;;
(square-list (list 2 3 4))