#lang racket
(define x (list (list 1 2) (list 3 4)))

;;;;;;;;;;;;;;;;;;;;;;without let operation;;;;;;;;;;;;;;;;;;;;;;;
(define (fringe iterms)
  (define (iter iterms acc)
    (if (null? iterms)
        acc
        (if (list? (car iterms))
            (iter (cdr iterms) (append acc (fringe (car iterms))))
            (iter (cdr iterms) (append acc (list (car iterms)))))))
  (iter iterms '()))


(define (fringe iterms)
  (define (iter iterms acc)
    (if (null? iterms)
        acc
        (let ((head (car iterms))
              (tail (cdr iterms)))
          (if (list? head)
              (iter tail (append acc (fringe head)))
              (iter tail (append acc (list head)))))))
  (iter iterms '()))

;;;;;;;;;;;;;;;;;;;;;test;;;;;;;;
(fringe x)