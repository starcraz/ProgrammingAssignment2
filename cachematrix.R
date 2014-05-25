## The function creates a special "matrix" object that can
## cache its inverse of a matrix rather than compute it repeatedly

## Function is to calculate the matrix and store it in cache

makeCacheMatrix <- function(x = matrix()) {
        set <- function(y) {
                x <<- y
        }
        get <- function() x
        setcache <- function(matrix) m <<- matrix
        getcache <- function() m
        list(set = set, get = get,
             setcache = setcache, getcache = getcache)
}

## Testing out the function
a <- makeCacheMatrix()
a$set(matrix(1:4,2,2))
a$get() # should get a 2by2 matrix

## Taking the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$get()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setcache(m)
        m
}

## Testing out the function 
cacheSolve(a)

