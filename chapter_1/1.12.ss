(define (pascal-triangle r c)
  (if (or (= c 1) (= r c))
      1
      (+ (pascal-triangle r (- c 1))
	 (pascal-triangle (- r 1) (- c 1)))))

;test
(pascal-triangle 1 1)
(pascal-triangle 5 5)
(pascal-triangle 10 1)