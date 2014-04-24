## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## Return a matrix that is the inverse of 'x'
        m<-NULL
        set<- function(y){
                x<<-y
                m<<-NULL
        }
        get<-function()x
        setSolve<-function(Solve) m <<- Solve
        getSolve<-function()m
        list(set=set,get=get,
             setSolve=setSolve,
             getSolve=getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
        m <- x$getSolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
