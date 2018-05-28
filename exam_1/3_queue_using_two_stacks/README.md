# 3. Queue using Two Stacks [Haskell]

Make a module `QueueStacks` that implements **a queue using two stacks**.

A **queue** (also *First In Last Out* or *FIFO*) is a following data structure:
 
![FIFO](queue.svg)
    
A **stack** (also *Last In First Out* or *LIFO*) is a following data structure:

![LIFO](stack.png)

Stacks can be naturally implemented using Haskell lists:

```haskell
type Stack v = [v]
```

Implement stack functions (with the type signatures below)

* **push** that adds a new element to a stack:

```haskell
push :: v -> Stack v -> Stack v
```

* **top** that `top` returns the top of a stack **without** changing the stack.
In case of an empty stack return `Nothing`, otherwise return `Just` the element.

```haskell
top :: Stack v -> Maybe v
```

* **pop** that removes the top element (the least recently added) from a stack:

```haskell
pop :: Stack v -> Stack v
```

```haskell
data Queue v = InStackOutStack (Stack v) (Stack v) deriving (Eq, Show)
enqueue :: v -> Queue v -> Queue v
dispatch :: Queue v -> Queue v
dequeue :: Queue v -> Queue v
```

## Input
A single line is read from the standard input containing real numbers (possibly with the *minus* signs and *decimal points*).
The numbers are separated by spaces.

You may assume that the user-given input is **always valid**.
In particular, at least one number will be always entered.

## Output
The first line displays the list of input numbers (parsed into `[Double]`).

The second line displays `minMean == ` and the computed minimum.

The third line displays `harmonicMean == ` and the computed harmonic mean.

The fourth line displays `geometricMean == ` and the computed geometric mean.

The fifth line displays `arithmeticMean == ` and the computed arithmetic mean.

The sixth line displays `quadraticMean == ` and the computed quadratic mean.

The last line displays `maxMean == ` and the computed maximum.

## Examples

**@Lasse: How should we check the results? It needs to be floating-point comparison with a tolerance of numerical error.**

### Example 1
input:
```
1
```
output:
```
[1.0]
"minMean == 1.0"
"harmonicMean == 1.0"
"geometricMean == 1.0"
"arithmeticMean == 1.0"
"quadraticMean == 1.0"
"maxMean == 1.0"
```

### Example 2
input:
```
1 2 3 4
```
output:
```
[1.0,2.0,3.0,4.0]
"minMean == 1.0"
"harmonicMean == 1.9200000000000004"
"geometricMean == 2.213363839400643"
"arithmeticMean == 2.5"
"quadraticMean == 2.7386127875258306"
"maxMean == 4.0"
```

### Example 3
input:
```
1 2 3 4 5
```
output:
```
[1.0,2.0,3.0,4.0,5.0]
"minMean == 1.0"
"harmonicMean == 2.18978102189781"
"geometricMean == 2.605171084697352"
"arithmeticMean == 3.0"
"quadraticMean == 3.3166247903554"
"maxMean == 5.0"
```

### Example 4
input:
```
1 2 39.3 2 3 -12 3.1415 -3.1415
```
output:
```
[1.0,2.0,39.3,2.0,3.0,-12.0,3.1415,-3.1415]
"minMean == -12.0"
"harmonicMean == 3.5157953592395867"
"geometricMean == 3.920835722212454"
"arithmeticMean == 4.4125"
"quadraticMean == 14.689401130151628"
"maxMean == 39.3"
```

## Note
Keep in mind that there are many useful functions in the `Prelude` of Haskell,
e.g. `map`, `words`, `fromIntegral`, `minimum`, `maximum`, `sum`, `product`, `**`, `read`, `show`, `.`, `$` etc.
They may help you write the solution as fast as possible.
