#lang racket
;;cons function: return function
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (display 'caonidaye))))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))

;;;;;;;;;test;;;;;;;;;;;;;;;

(cdr (cons 1 2))
(car (cons 4 5))
((cons 2 3) 3)      ;output caonidaye




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;way2;;;;;;;;;;;;;;;;;;;;;;
(define (recons x y)
  (lambda (m) (m x y)))

(define (recar z)
  (z (lambda (p q) p)))

(define (recdr z)
  (z (lambda (p q) q)))


;;;;;;;;test;;;;;;;;;
(recar (recons 8 9))
(recdr (recons 8 9))
