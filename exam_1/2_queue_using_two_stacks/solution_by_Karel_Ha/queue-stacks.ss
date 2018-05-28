#lang scheme

; total time:

(define (push v st)
 (cons v st)
)

; test
(define emptyStack '())
(define stack0
 (push 0 emptyStack)
)
(define stack01
 (push 1 stack0)
)
(define completeStack
 (push 7
  (push 6
   (push 5
    (push 4
     (push 3
      (push 2
       stack01)))))))

emptyStack
stack0
stack01
completeStack
