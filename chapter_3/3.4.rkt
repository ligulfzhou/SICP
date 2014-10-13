#lang racket
(define (make-account balance secret-password)
  (let ((incorrect-password-times 0))
    (define (withdraw amount)
      (if (> balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient Balance"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    
    (define (call-the-cops)
      (display "call the cops"))
    
    (define (dispatch yourpassword m)
      (if (eq? yourpassword secret-password)
	  (cond ((eq? m 'withdraw) withdraw)
		((eq? m 'deposit) deposit)
		(else
		 (lambda (x) (display "Unknown request -- MAKE-ACCOUNT"))))
          (begin (lambda (x) (display "Incorrect Password")) 
                 (set! incorrect-password-times (+ incorrect-password-times 1))
                 (if (= incorrect-password-times 8)
                     (begin (set! incorrect-password-times 0)
                     (call-the-cops))
                     (display "Incorrect Password")))))
  dispatch))

;test
(define acc (make-account 100 'password))
((acc 'password 'withdraw) 30)
((acc 'password 'deposit) 50)
((acc 'password 'wrong-deposit) 50)
(newline)
((acc 'wrong-password 'withdraw) 30)