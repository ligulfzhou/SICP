(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low
	    (enumerate-interval (+ low 1) high))))

(define (filter predicate? sequence)
  (cond ((null? sequence) nil)
	((predicate? sequence)
	 (cons (car sequence)
	       (filter predicate? (cdr sequence))))
	(else
	 (filter predicate? (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (cons (car sequence)
	    (accumulate op initial (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
	  (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

;test
(unique-pairs 10)

