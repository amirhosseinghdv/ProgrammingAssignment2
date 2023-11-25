## Put comments here that give an overall description of what your
## functions do

## Function to create a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

  inverse <- NULL
  
  setMatrix <- function(newValue) {
    x <<- newValue
    inverse <<- NULL  
  }
  
  getMatrix <- function() {
    x
  }
  
  setInverse <- function(newInverse) {
    inverse <<- newInverse
  }
  
  getInverse <- function() {
    inverse
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}




## Function to compute the inverse of the special "matrix" object and cache it

cacheSolve <- function(cacheMatrix) {
  inverse <- cacheMatrix$getInverse()
  
  if (is.null(inverse)) {
    matrixToSolve <- cacheMatrix$getMatrix()
    inverse <- solve(matrixToSolve)
    cacheMatrix$setInverse(inverse)
  }
  
  inverse
}
