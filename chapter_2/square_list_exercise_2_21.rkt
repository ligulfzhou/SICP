#lang racket

;;A
(define (square x) (* x x))
(define (square-list1 items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list1 (cdr items)))))

;;B
(define (square-list2 items)
  (map (lambda (x) (* x x)) items))