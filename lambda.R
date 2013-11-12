library("lambda.r")

f(x) %as% x

f(1)

f_(x) %as% { 2 * x }

f_(3)

f__(x,y) %as% { 
                z <- x*y 
                z
                }

f__(3,2)


## FIBONACCI
fib(0) %as% 1
fib(1) %as% 1
fib(n) %as% { fib(n-1) + fib(n-2) }
seal(fib)

fib_(n) %as% fib__(1,1,n)
fib__(accu1, accu2, 0 ) %as% accu1
fib__(accu1,accu2,n) %as% { fib__(accu2,(accu1+accu2),(n-1))}
seal(fib_)

## LUCAS
lucas(0) %as% 2
lucas(1) %as% 1
lucas(n) %as% { lucas (n-1) + lucas(n-2) }
seal(lucas)

lucas_(n) %as% lucas__(2,1,n)
lucas__(accu1,accu2,0) %as% accu1
lucas__(accu1,accu2,n) %as% { lucas__(accu2,(accu1+accu2),(n-1)) }
seal(lucas_)

interval <- function(n){
  seq(0,n)
}



sapply(interval(100),lucas_)
#sapply(interval(100),lucas) #slow as fuck


