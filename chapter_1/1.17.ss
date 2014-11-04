(define (multiple a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (cond ((= b 0) 0)
	((even? b) (multiple (double a) (halve b)))
	(else
	 (+ a (multiple a (- b 1))))))
