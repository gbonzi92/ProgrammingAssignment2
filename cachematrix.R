## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##What the functions do is first set the values of the matrix and then get them, then the same for the inverse

##the <<-stores the objects in another environment

makeCacheMatrix <- function(x = matrix()) {
  inver<-NULL          ##creates an empty object in the current environment
  set<-function(z){
    x<<-z                ##connect functions x and z
    inver<<-NULL 
  }
  get<-function() {x}    ##get the values of the functions
  setinver<-function(inverse){inver<<-inverse}
  getinver<-function(){inver}
  list(set=set,get=get,setinver=setinver,getinver=getinver)
}

## Write a short comment describing this function
##This function computes the inverse of the matrix x

cacheSolve<-function(x, ...){
  inver<-x$getinver()
  if(!is.null(inver)){
    message("obtaining data which was cached")
    return(inver)
  }
  matri<-x$get()
  inver<-solve(matri,...)
  x$setinver(inver)
  inver
}

##after source cachematrix.R, define the matrix which will be inverted:
newmatrix<-makeCacheMatrix(matrix(c(1,3,4,2),nrow=2,ncol=))
newmatrix$get()
newmatrix$getinver()
cacheSolve(newmatrix)