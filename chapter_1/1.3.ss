(define square
	(lambda (x) (* x x)))

(define (sum-square-2-max x y z)
	(cond ((and (> x z) (> y z)) (+ (square x) (square y)))
	      ((and (> x y) (> z y)) (+ (square x) (square z)))
	      (else (+ (square y) (square z)))))
