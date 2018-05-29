# 2. Queue using Two Stacks [Scheme]

Implement **a queue using two stacks**.

### Stacks using Lists

A **stack** (also called *Last In First Out* or *LIFO*) is a following data structure:

![LIFO](stack.png)

Stacks can be naturally implemented using Scheme lists.
Implement stack operations with the type signatures below...

* **push** that adds a new element `v` to a stack `st` (represented as a list):

```scheme
(push v st)
```

* **top** that returns the top of a stack **without** changing the stack.
In case of an empty stack return `'()`, otherwise return the element itself.

```scheme
(top st)
```

* **pop** that removes the top element (the most recently added one) from a stack:

```scheme
(pop st)
```

These operations should return **new stacks** with modified contents (depending on the called operation).

### Queues using Stacks

A **queue** (also called *First In Last Out* or *FIFO*) is a following data structure:
 
![FIFO](queue.svg)
    
Unfortunately, queues are not that straightforward to implement in Haskell.
At least not with the basic data structures we have learned so far.
Using a list directly as a queue would not give desired time complexities for queue operations `enqueue` and `dequeue`.

However, it is possible to achieve at least good **amortized** complexities using **two stacks in a smart way**.
I.e., such a way that a sequence of **e** operations of `enqueue` and **d** operations of `dequeue`** would take **O(e + d)** time. 
This can be done if:
* one stack is dedicated for enqueueing incoming elements
* the other stack is dedicated for dequeueing outcoming elements

Implement such a queue using a new data type:
```haskell
data Queue v = InStackOutStack (Stack v) (Stack v) deriving (Eq, Show)
```
and implement queue operations with the type signatures below...

* **enqueue** that adds a new element to the front of a stack:

```haskell
enqueue :: v -> Queue v -> Queue v
```

* **dequeue** that removes an element (the least recently added one) from the back of a stack:

```haskell
dequeue :: Queue v -> Queue v
```

Moreover, you may find useful to have a function that "prepares" a queue for a `dequeue` operation.
```haskell
dispatch :: Queue v -> Queue v
```
This function would transform a queue by conveniently manipulating elements between the incoming stack and the outcoming stack.
Doing so, the following `dequeue` operation afterwards could be done easily and with the desired amortized time complexity.

## Examples
The modules will be loaded with command:
```commandline
ghci QueueStacks.hs
```
### Example 1 (stacks)
With following user-defined stacks:
```haskell
emptyStack = []
stack0 = push 0 emptyStack
stack01 = push 1 stack0
completeStack = push 7 . push 6 . push 5 . push 4 . push 3 . push 2 . push 1 . push 0 $ emptyStack
stack42 = push 7 . push 6 . push 5 . push 42 . pop . pop . pop . pop $ completeStack
inStack  = push 7 . push 6 . push 5 . push 4 $ emptyStack
outStack = push 3 . push 2 . push 1 . push 0 $ emptyStack

listOfStacks = [emptyStack, stack0, stack01, completeStack, stack42, inStack, outStack]
```
we get:
```
*QueueStacks> map top listOfStacks
[Nothing,Just 0,Just 1,Just 7,Just 7,Just 7,Just 3]
```

### Example 2 (queues)
With following user-defined queues:
```haskell
emptyStack = []
inStack  = push 7 . push 6 . push 5 . push 4 $ emptyStack
outStack = push 3 . push 2 . push 1 . push 0 $ emptyStack

q1 = InStackOutStack inStack outStack
q2 = InStackOutStack emptyStack outStack
q3 = InStackOutStack inStack emptyStack

listOfQueues = [q1, q2, q3]
```
we get:
```
*QueueStacks> map (enqueue 42) listOfQueues
[InStackOutStack [42,7,6,5,4] [3,2,1,0],InStackOutStack [42] [3,2,1,0],InStackOutStack [42,7,6,5,4] []]

*QueueStacks> map dequeue listOfQueues
[InStackOutStack [7,6,5,4] [2,1,0],InStackOutStack [] [2,1,0],InStackOutStack [] [5,6,7]]

*QueueStacks> map (dequeue . dequeue) listOfQueues
[InStackOutStack [7,6,5,4] [1,0],InStackOutStack [] [1,0],InStackOutStack [] [6,7]]

*QueueStacks> map (dequeue . dequeue . dequeue) listOfQueues
[InStackOutStack [7,6,5,4] [0],InStackOutStack [] [0],InStackOutStack [] [7]]

*QueueStacks> map (dequeue . dequeue . dequeue . dequeue) listOfQueues
[InStackOutStack [7,6,5,4] [],InStackOutStack [] [],InStackOutStack [] []]

*QueueStacks> map (dequeue . dequeue . dequeue . dequeue . dequeue) listOfQueues
[InStackOutStack [] [5,6,7],InStackOutStack [] [],InStackOutStack [] []]
```
