#lang racket
(define (make-accumulator sum)
  (lambda (x)
    (begin (set! sum (+ sum x))
           sum)))

(define A (make-accumulator 3))
(A 4)
(A 4)
(A 4)