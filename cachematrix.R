## Put comments here that give an overall description of what your
  ## functions do
  
  ## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  x_inv <- NULL

  set <- function(y) {
    x <<- y
    x_inv <<- NULL
  }
  
  get <- function() x

  setsolve <- function(solve) x_inv <<- solve

  getsolve <- function() x_inv

  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}

cacheSolve <- function(x, ...) {
  x_inv <- x$getsolve()
  
  if(!is.null(x_inv)) {
    message("getting cached data")
    return(x_inv)
  }
  
  data <- x$get()

  x_inv <- solve(data, ...)
  x$setsolve(x_inv)
  x_inv	
}
