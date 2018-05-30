# 3. Queue using Two Stacks [Haskell]

Make a module `QueueStacks` that implements **a queue using two stacks**.

### Stacks using Lists

A **stack** (also called *Last In First Out* or *LIFO*) is a following data structure:

![LIFO](stack.png)

Stacks can be naturally implemented using Haskell lists:

```haskell
type Stack v = [v]
```

and with following implementations of  stack operations:

* **push** that adds a new element to a stack:

```haskell
push :: v -> Stack v -> Stack v
push value stack = value:stack
```

* **pop** that removes the top element (the most recently added one) from a stack:

```haskell
pop :: Stack v -> Stack v
pop []           = []
pop (_:newStack) = newStack
```

These operations return **new stacks** with modified contents.

### Queues using Stacks

A **queue** (also called *First In Last Out* or *FIFO*) is a following data structure:
 
![FIFO](queue.svg)
    
Unfortunately, queues are not that straightforward to implement in Haskell.
At least not with the basic data structures we have learned so far.
Using a list directly as a queue would not give desired time complexities for queue operations `enqueue` and `dequeue`.

However, it is possible to achieve at least good **amortized** complexities using **two stacks in a smart way**,
i.e., such a way that a sequence of **e** operations of `enqueue` and **d** operations of `dequeue`** would take **O(e + d)** time. 
This can be done if:
* one stack is dedicated for enqueueing incoming elements
* the other stack is dedicated for dequeueing outcoming elements

Implement such a queue **using the implementation of stacks from above**.

In particular, define a new data type:
```haskell
data Queue v = InStackOutStack (Stack v) (Stack v) deriving (Eq, Show)
```

Furthermore, implement queue operations with the type signatures below...
* **enqueue** that adds a new element **v** to the front of a queue **q**:

```haskell
enqueue :: v -> Queue v -> Queue v
```

* **dequeue** that removes an element (the least recently added one) from the back of a queue **q**:

```haskell
dequeue :: Queue v -> Queue v
```

Moreover, you may find useful to have a function that "prepares" a queue for the `dequeue` operation.
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
the forced implementation above gives following stacks:
```
*QueueStacks> map show listOfStacks 
["[]","[0]","[1,0]","[7,6,5,4,3,2,1,0]","[7,6,5,42,3,2,1,0]","[7,6,5,4]","[3,2,1,0]"]
```

### Example 2 (queues)
With following user-defined queues:
```haskell
q1 = InStackOutStack inStack outStack
q2 = InStackOutStack emptyStack outStack
q3 = InStackOutStack inStack emptyStack

listOfQueues = [q1, q2, q3]
```
we get:
```
*QueueStacks> map show listOfQueues 
["InStackOutStack [7,6,5,4] [3,2,1,0]","InStackOutStack [] [3,2,1,0]","InStackOutStack [7,6,5,4] []"]
```

```
*QueueStacks> map (enqueue 42) listOfQueues
[InStackOutStack [42,7,6,5,4] [3,2,1,0],InStackOutStack [42] [3,2,1,0],InStackOutStack [42,7,6,5,4] []]
```

```
*QueueStacks> map dequeue listOfQueues
[InStackOutStack [7,6,5,4] [2,1,0],InStackOutStack [] [2,1,0],InStackOutStack [] [5,6,7]]
```

```
*QueueStacks> map (dequeue . dequeue) listOfQueues
[InStackOutStack [7,6,5,4] [1,0],InStackOutStack [] [1,0],InStackOutStack [] [6,7]]
```

```
*QueueStacks> map (dequeue . dequeue . dequeue) listOfQueues
[InStackOutStack [7,6,5,4] [0],InStackOutStack [] [0],InStackOutStack [] [7]]
```

```
*QueueStacks> map (dequeue . dequeue . dequeue . dequeue) listOfQueues
[InStackOutStack [7,6,5,4] [],InStackOutStack [] [],InStackOutStack [] []]
```

```
*QueueStacks> map (dequeue . dequeue . dequeue . dequeue . dequeue) listOfQueues
[InStackOutStack [] [5,6,7],InStackOutStack [] [],InStackOutStack [] []]
```
