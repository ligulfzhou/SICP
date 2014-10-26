(define (cube-root x)
  (define (cube x)
    (* x x x))
  (define (square x)
    (* x x))
  (define (good-enough? guess)
    (< (abs (- (cube guess) x)) 0.001))
  (define (improve guess)
    (/ (+ (/ x (square guess))
	  (* 2 guess))
       3))
  (define (cube-root-iter guess)
    (if (good-enough? guess)
	guess
	(cube-root-iter (improve guess) x)))
  (cube-root-iter 1.0))

# --- test ---
(cube-root 8)

