#lang racket

(define (square x)
  (* x x))

(define (square-list item)
  (if (null? item)
      '()                ;;;;;in the book, it`s the nil;;;;;
      (cons (square (car item))
            (square-list (cdr item)))))


(define (square-list2 item)
  (map square item))

;;;;test

(square-list (list 1 2 3))
(square-list2 (list 1 2 3))