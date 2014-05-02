
##This function takes a matrix, and sets a list containing several functions intended to cache te matrix  

makeCacheMatrix <- function(x = matrix()) {
## Return a matrix that is the inverse of 'x'
        m<-NULL
        set<- function(y){
                x<<-y
                m<<-NULL
        }
        get<-function()x
        setsolve<-function(solve) m <<- solve
        getsolve<-function()m
        list(set=set,get=get,
             setsolve=setsolve,
             getsolve=getsolve)
}



## This function takes a cached values from above function (if they are set), inverses it and returns inversed matrix

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
