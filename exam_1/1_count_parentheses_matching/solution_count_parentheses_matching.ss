#lang scheme

#|
(define (count n)
  ;(define count-matchings 
  (cond ((<= n 0) 1)
        ;(else (count-matchings (- n 1)))
        )
  )

;(count -1)
;(count 0)
|#

; integers n..0
(define (ints n)
  (cond ((< n 0) '())
        (else (cons n
                    (ints (- n 1))))))
; test
;(ints -2)(ints -1)(ints 0)(ints 1)(ints 2)(ints 10)

; f(n) = count of correctly matched pairs of 'n' parentheses
(define (f n)
  (cond ((<= n 1) 1)
        (else
         (let ((n1s
                (ints (- n 1)))
               #|(n2s
         (reverse (ints (- n 1))))
        (nis
         (map cons n1s n2s)|#
               )
           apply + (map (lambda (n1)
                          (*
                           (f n1)          ; f(n1)
                           (f (- (- n 1)   ; f(n2)
                                 n1))))    ; such that n1 + n2 = n - 1
                        n1s)
           ))))
#|(apply + '())
(apply + (ints -1))
(apply + (ints 0))
(apply + (ints 1))
(apply + (ints 2))
(ints 3)(apply + (ints 3))
(f -1)
(f 0)
(f 1)
(f 2)|#
(f 3)

; total time: 60 min