(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low
	    (enumerate-interval (+ low 1) high))))

(define (filter predicate? sequence)
  (cond ((null? sequence) nil)
	((predicate? (car sequence))
	 (cons (car sequence)
	       (filter predicate? (cdr sequence))))
	(else
	 (filter predicate? (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      nil
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))

(define (queens board-size)
  (define (queen-cols k)
    
