(define (f2 n)
  (cond ((< n 3) n)
	(else
	 (define (iter x1 x2 x3 count)
	   (if (> count n)
	       x3
	       (iter x2 x3 (+ (* 3 x1) (* 2 x2) x3) (+ count 1))))
	 (iter 1 2 4 3))))

