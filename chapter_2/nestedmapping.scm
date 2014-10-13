(define nil '())

(define (accumulate op initial seqs)
  (if (null? seqs)
      initial 
      (op (car seqs)
	  (accumulate op initial (cdr seqs)))))

(define (enumerate-interval i j)
  (if (= i j)
      nil
      (cons i
	    (enumerate-interval (+ i 1) j))))

(define (filter predicate seqs)
  (cond ((null? seqs) nil)
	((predicate (car seqs))
	 (cons (car seqs)
	       (filter predicate (cdr seqs))))
	(else 
	 (filter predicate (cdr seqs)))))

(defien (flatmap proc seqs)
  (accumulate append nil (map proc seqs)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cdr pair))))

(define (make-sum-pair pair)
  (list (car pair) (cdr pair) (+ (car pair) (cdr pair))))

(define (make-sum-pairs pairs)
  (map make-sum-pair 
       (filter prime-pair?
	       (flatmap
		(lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate 1 (- i 1))))
		  (enumerate 1 n)))))
