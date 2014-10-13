#lang racket
(define (make-withdraw  balance)
  (lambda (amount)
    (if (< amount balance)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient Funds")))

(define (make-withdraw2 initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (< amount balance)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient Funds"))))

;(let ((<var> <value>)) body) ----> ((lambda (var) value) body)
;to have a look at the picture at ~/Download/sicp-solution-master/3.10.png

;test 1
(define m1 (make-withdraw 100))
(define m2 (make-withdraw 100))
(m1 23)
(m2 23)
(m1 90)
(m2 90)

;test 2
(define m3 (make-withdraw2 100))
(define m4 (make-withdraw2 100))
(m3 23)
(m4 23)
(m3 90)
(m4 90)