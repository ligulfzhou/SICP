#lang racket

(define (reverse x)
  (define (reverse-iter x y)
    (if (null? x)
        y
        (reverse-iter (cdr x) (cons (car x) y))))
  (reverse-iter x '()))

;;;;;test;;;;;;
(reverse (list 1 4 9 16))
