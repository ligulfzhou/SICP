#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

;---so diao--> didn`t fully get it......
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(map even? (list 3 4 5 6 7))

(define (append2 seq1 seq2)
  (accumulate cons seq2 seq1))

(append2 (list 4 5 6) (list (list 4 5) 7 (list 5 6)))

(define (lenghth sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(lenghth (list (list 1 2) 3 4 (list 5 6) 7 8))