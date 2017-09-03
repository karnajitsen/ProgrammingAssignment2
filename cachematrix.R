## Put comments here that give an overall description of what your
## functions do 

## Write a short comment describing this function

## makeCacheMatrix take a matrix object cache it in the memory. It also set the inverse matrix and store it in cache
## One can get both the matrix and its inverse from the cache if the are set

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

## Write a short comment describing this function
## cacheSolve function take object returned from cacheMatrix as an input and return its inverse if it is in the cache
## elseit calculate the inverse and set it to cache for further retrival
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
