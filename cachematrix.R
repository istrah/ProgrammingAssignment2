##This function takes a matrix, and sets a list containing several functions intended to cache te matrix  

makeCacheMatrix <- function(x = matrix()) {
        ## creates a variable for caching a matrix x
        cachedMatrix<-NULL
        
        ## creates function to store x and empties cache variable
        set<- function(y){
                x<<-y
                cachedMatrix<<-NULL
        }
        
        ## crates function to return x
        get<-function()x
        
        ##creates a function for caching solve(x)
        setsolve<-function(solv) cachedMatrix <<- solv
        
        ## creates a function to return solve(x)
        getsolve<-function()cachedMatrix
        
        ##creates a list of above function
        list(set=set,get=get,
             setsolve=setsolve,
             getsolve=getsolve)
}



## This function takes a cached values from above function (if they are set), inverses it and returns inversed matrix

cacheSolve <- function(x, ...) {
      ##checks if cache is set and if it is stores it
        cachedMatrix <- x$getsolve()
        if(!is.null(cachedMatrix)) {
                message("getting cached data")
                return(cachedMatrix)
        }
        
        ## stores return from funciton get()
        data <- x$get()
        
        ## uses a function solve() to inverse cahced matrix x
        solv <- solve(data, ...)
        
        ##stores cahce for set solve
        x$setsolve(solv)
        
        ##returns solve
        solv
}
