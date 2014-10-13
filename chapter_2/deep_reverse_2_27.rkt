#lang racket

(define (reverse x)
  (define (reverse-iter x y)
    (if (null? x)
        y
        (reverse-iter (cdr x) (cons (car x) y))))
  (reverse-iter x '()))

;;;;;test;;;;;;
(reverse (list (list 2 3 4) (list 5 6 7)))

;;deep-reverse
