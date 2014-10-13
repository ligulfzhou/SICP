#lang racket

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(square-tree (list (list 4 5 6) (list 3 4 5)))
