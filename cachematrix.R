##This code returns a matrix thta is inverse "x"

#This part of the code, creates a matrix object that sets the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  #set matrix
  set <- function(y) {
    x <<- y
    
    #This is the second part of the code which computes the inverse matrix
    cachedInverse <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) cachedInverse <<- inverse
  getInverse <- function() cachedInverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  
  invFunc <- x$getInverse()
  if(!is.null(invFunc)) {
    message("getting cached data")
    return(invFunc)
  }
  data <- x$get()
  invFunc <- solve(data, ...)
  x$setInverse(invFunc)
  invFunc
}
