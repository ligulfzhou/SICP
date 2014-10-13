#lang racket
;;implement in the iterative way
(define (last-pair x)
  (define (last-pair-iter x n)
    (if (null? x)
        n
        (last-pair-iter (cdr x) (car x))))
  (last-pair-iter x (car x)))
;;;;;;;;test
(last-pair (list 23 72 149 34))
