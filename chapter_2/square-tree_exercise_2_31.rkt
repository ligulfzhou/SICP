#lang racket

(define (square x) (* x x))

(define (tree-map function tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map function sub-tree)
             (function sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))