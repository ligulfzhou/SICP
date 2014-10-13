(define nil '())

(define (count-pairs x)
  (let ((visited nil))
    (define (count x)
      (cond ((not (pair? x)) 0)
	    ((memq x visited) 0)
	    (else
	     (set! visited (cons x visited))
	     (+ (count (car x))
		(count (cdr x))
		1))))
    (count x)))

(count-pairs (list 3 4 5 (list 4 5 6) (list 4 5 6)))
