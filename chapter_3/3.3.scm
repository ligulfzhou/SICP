(define (make-account balance secret-password)
    (define (withdraw amount)
      (if (> balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient Balance"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    
    (define (dispatch yourpassword m)
      (if (eq? yourpassword secret-password)
	  (cond ((eq? m 'withdraw) withdraw)
		((eq? m 'deposit) deposit)
		(else
		 (error "Unknown request -- MAKE-ACCOUNT"
			m)))
	  (lambda (dd) (error "Incorrect Password")))
    dispatch)
