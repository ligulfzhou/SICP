(define nil '())

(define (element-of-set? x set)
  (cond ((null? sets) #f)
	((equal? x (car sets)) #t)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
	 nil)
	((element-of-set? (car set1) set2)
	 (cons (cdr set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((not (element-of-set? (car set1) set2))
	 (cons (car set1)
	       (union-set (cdr set1) set2)))
	(else (union-set (cdr set1) set2))))

;;; --> somebody write this
(define (filter predicate? sequence)
  (cond ((null? sequence)
	 nil)
	((predicate? (car sequence))
	 (cons (car sequence)
	       (filter predicate? (cdr sequence))))
	(else (filter predicate? (cdr sequence)))))

(define (union-set set1 set2)
  (let ((inter (intersection-set set1 set2)))
    (append set2
	    (filter (lambda (x) 
		      (not (element-of-set? x inter))))
	    set1)))
