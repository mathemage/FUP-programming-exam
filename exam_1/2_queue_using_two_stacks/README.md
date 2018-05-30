# 2. Queue using Two Stacks [Scheme]

Implement **a queue using two stacks**.

### Stacks using Lists

A **stack** (also called *Last In First Out* or *LIFO*) is a following data structure:

![LIFO](stack.png)

Stacks can be naturally implemented using Scheme lists as below...

* **push** that adds a new element `v` to a stack `st` (represented as a list):

```scheme
(define (push v st)
 (cons v st))
```

* **pop** that removes the top element (the most recently added one) from a stack:

```scheme
(define (pop st)
 (cdr st))
```

These operations return **new stacks** with modified contents.

### Queues using Stacks

A **queue** (also called *First In Last Out* or *FIFO*) is a following data structure:
 
![FIFO](queue.svg)
    
Unfortunately, queues are not that straightforward to implement in Scheme.
At least not with the basic data structures we have learned so far.
Using a list directly as a queue would not give desired time complexities for queue operations `enqueue` and `dequeue`.

However, it is possible to achieve at least good **amortized** complexities using **two stacks in a smart way**,
i.e., such a way that a sequence of **e** operations of `enqueue` and **d** operations of `dequeue`** would take **O(e + d)** time. 
This can be done if:
* one stack is dedicated for enqueueing incoming elements
* the other stack is dedicated for dequeueing outcoming elements

Implement such a queue **using the implementation of stacks from above**.

In particular, use following Scheme function
```Scheme
(define (inStackOutStack ist ost)
 (list ist ost))
```
to construct a new queue with:
* `ist` is the stack dedicated for enqueueing incoming elements 
* and `ost` is the stack dedicated for dequeueing outcoming elements.

Furthermore, implement queue operations:

* **enqueue** that adds a new element **v** to the front of a queue **q**:

```scheme
(enqueue v q)
```

* **dequeue** that removes an element (the least recently added one) from the back of a queue **q**:

```scheme
(dequeue q)
```

Moreover, you may find useful to have a function that "prepares" a queue for the `dequeue` operation.
```scheme
(dispatch q)
```
This function would transform a queue by conveniently manipulating elements between the incoming stack and the outcoming stack.
Doing so, the following `dequeue` operation afterwards could be done easily and with the desired amortized time complexity.

## Examples
### Example 1: stacks
With following user-defined stacks:
```scheme
(define emptyStack '())
(define stack0
 (push 0 emptyStack))
(define stack01
 (push 1 stack0))
(define completeStack
 (push 7 (push 6 (push 5 (push 4 (push 3 (push 2 stack01)))))))
(define stack42
 (push 7 (push 6 (push 5 (push 42 (pop (pop (pop (pop completeStack)))))))))
(define inStack
 (push 7 (push 6 (push 5 (push 4 emptyStack)))))
(define outStack
 (push 3 (push 2 (push 1 (push 0 emptyStack)))))
(define listOfStacks
 (list emptyStack stack0 stack01 completeStack stack42 inStack outStack))
```
the forced implementation above gives following stacks:
```
> (map displayln listOfStacks)
()
(0)
(1 0)
(7 6 5 4 3 2 1 0)
(7 6 5 42 3 2 1 0)
(7 6 5 4)
(3 2 1 0)
```

### Example 2: queues
With following user-defined queues:
```scheme
(define q1
 (inStackOutStack inStack outStack))
(define q2
 (inStackOutStack emptyStack outStack))
(define q3
 (inStackOutStack inStack emptyStack))
(define listOfQueues
 (list q1 q2 q3))
```
we get:
```
> (map displayln listOfQueues)

((7 6 5 4) (3 2 1 0))
(() (3 2 1 0))
((7 6 5 4) ())
```

```
> (map (lambda (q) (displayln (enqueue 42 q))) listOfQueues)

((42 7 6 5 4) (3 2 1 0))
((42) (3 2 1 0))
((42 7 6 5 4) ())
```

```
> (map (lambda (q) (displayln (dispatch q))) listOfQueues)

(() (4 5 6 7 3 2 1 0))
(() (3 2 1 0))
(() (4 5 6 7))
```

```
> (map (lambda (q) (displayln (dequeue q))) listOfQueues)

((7 6 5 4) (2 1 0))
(() (2 1 0))
(() (5 6 7))
```

```
> (map (lambda (q) (displayln (dequeue (dequeue q)))) listOfQueues)

((7 6 5 4) (1 0))
(() (1 0))
(() (6 7))
```

```
> (map (lambda (q) (displayln (dequeue (dequeue (dequeue q))))) listOfQueues)

((7 6 5 4) (0))
(() (0))
(() (7))
```

```
> (map (lambda (q) (displayln (dequeue (dequeue (dequeue (dequeue q)))))) listOfQueues)

((7 6 5 4) ())
(() ())
(() ())
```

```
> (map (lambda (q) (displayln (dequeue (dequeue (dequeue (dequeue (dequeue q))))))) listOfQueues)

(() (5 6 7))
(() ())
(() ())
```
