#lang scheme

; total time: 106 min

; integers n..0
(define (ints n)
  (cond ((< n 0) '())
        (else (cons n
                    (ints (- n 1))))))

; f(n) = count of correctly matched pairs of 'n' parentheses
(define (f n)
  (cond ((<= n 1) 1)
        (else
         (apply + (map (lambda (n1)
                         (*
                          (f n1)             ; f(n1)
                          (f (- (- n 1) n1)) ; f(n2)
                          )    ; such that n1 + n2 = n - 1
                         )
                       (ints (- n 1)))
                ))))

; test
(define n 17)  ; maximum computable number
(define intSeq
  (reverse (ints n)))
(define catalanSeq
  '(1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440 9694845 35357670 129644790 477638700 1767263190 6564120420))
intSeq
(map f intSeq)
catalanSeq