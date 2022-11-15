#IS2000 Object Tutorial
#Shubh Patni
#Fall 2022



#define class Lesson from a list object
aLessonObj <- list(lid = 101, title = 'Introduction to R', length = 90)
class(aLessonObj) <- "Lesson"

print(aLessonObj)

# access via attribute name
t1 <- aLessonObj$title

# access by position
t2 <- aLessonObj[[2]]

print(t1)

print(t2)

Lesson <- function(lID, defTitle, defLength)
{
  obj <- list(lid = lID, title = defTitle, lengthInMins = defLength)
  attr(obj, "class") <- "Lesson"
  return (obj)
}

l1 <- Lesson(101, 'Relational Algebra', 120)

Lesson <- function(lID, defTitle, defLength)
{
  if (!is.numeric(lID) || lID < 1 || !length(defTitle) > 0)
    stop("instantiation of Lesson failed")
  
  obj <- list(lid = lID, title = defTitle, lengthInMins = defLength)
  attr(obj, "class") <- "Lesson"
  
  return (obj)
}

l3 <- Lesson(0, 'SQL Joins', 120)

head(methods(print),3)

print.Lesson <- function (aLesson)
{
  cat('ID:', aLesson$lid, "\n")
  cat('Title:', aLesson$title, "\n")
  cat('Length:', aLesson$lengthInMins, "\n")
}

l1 <- Lesson(103, 'Relational Calculus', 90)

print(l1)

setClass("Course", slots = list(lid="numeric", title="character", lengthInMins="numeric"))

aCourse <- new ("Course", lid = 105, title = 'R Projects', lengthInMins = 20)

print(aCourse)

aCourse <- new ("Course", lid = 105, title = 'R Projects', lengthInMins = 20)

print(aCourse@title)

aCourse <- new ("Course", lid = 105, title = 'R Projects', lengthInMins = 20)

# modify the 'title' slot value
aCourse@title <- 'R Projects in R Studio'

aCourse <- new ("Course", lid = 105, title = 'R Projects', lengthInMins = 20)

# modify the 'title' slot value
slot(aCourse, 'title') <- 'R Projects in R Studio'

print.Course <- function (aCourse)
{
  cat('ID:', aCourse@lid, "\n")
  cat('Title:', aCourse@title, "\n")
  cat('Length:', aCourse@lengthInMins, "\n")
}

aCourse <- new ("Course", lid = 105, title = 'R Projects', lengthInMins = 20)

print(aCourse)

Instructor <- setRefClass("Instructor", 
                          fields = list(iid="numeric", 
                                        name="character", 
                                        rank="character")
)

i <- Instructor(iid = 1, name = 'Jeff Alden', rank = 'FT-Associate')

# read a field's value
n <- i$name

# update a field's value
i$name <- 'Jeffrey Alden'

i1 <- Instructor(iid = 1, name = 'Jeff Alden', rank = 'FT-Associate')
i2 <- i1

i2$name <- 'Xin Wang'

print(i1)

i1 <- Instructor(iid = 1, name = 'Jeff Alden', rank = 'FT-Associate')

i2 <- i1$copy()

# modifying i2 does not modify i1
i2$name <- 'Susan Wollaston'

print(i1)

Instructor <- setRefClass("Instructor", 
                          fields = list(iid="numeric", 
                                        name="character", 
                                        rank="character",
                                        salary="numeric"
                          ),
                          methods = list(
                            getMonthlySalary = function() {
                              return (salary / 12)
                            },
                            
                            applyRaise = function(merit) {
                              salary <<- salary * (1 + merit)
                            }
                          )
)

i <- Instructor(iid = 2, name = 'Dua Dipa', rank = 'T-Assistant', salary = 128000)

m.bef <- i$getMonthlySalary()
i$applyRaise(0.045)

m.aft <- i$getMonthlySalary()

cat("Salary raised from $", m.bef, "to $", m.aft, "per month")

Person <- setRefClass("Person", 
                      fields = list(pid="numeric", 
                                    name="character",
                                    yob = "numeric"),
                      methods = list(
                        getAge = function() {
                          currYear <- as.numeric(format(Sys.time(), "%Y"))
                          return (currYear - yob)
                        }
                      ))

Instructor <- setRefClass("Instructor", 
                          contains = "Person",
                          fields = list(rank="character",
                                        salary="numeric"
                          ),
                          methods = list(
                            getMonthlySalary = function() {
                              return (salary / 12)
                            },
                            
                            applyRaise = function(merit) {
                              salary <<- salary * (1 + merit)
                            }
                          ))

anInstructor <- Instructor(pid = 100, 
                           name = 'Raj Metha', 
                           rank = 'FT-Full',
                           yob = 1968,
                           salary = 182972)

anInstructor$getMonthlySalary()

anInstructor$getAge()

Member <- setRefClass("Member", fields = list(
  mID = "numeric", 
  name = "character",
  yearJoined = "numeric"))

Club <- setRefClass("Club", 
                    fields = list(
                      name = "character",
                      yearFounded = "numeric",
                      maxMemID = "numeric",
                      members = "list"),
                    
                    methods = list(
                      getNumMembers = function() {
                        return (length(members))
                      },
                      
                      addMember = function(m) {
                        if (is.null(members))
                          members <<- list(1024)
                        
                        # add a member ID for the new member
                        m$mID <- maxMemID + 1
                        maxMemID <<- maxMemID + 1
                        
                        # add the member to internal list
                        members[[length(members)+1]] <<- m
                        
                        return (1)
                      },
                      findMemberByName = function(name){
                        
                        for (x in 1:this$getNumMembers()){
                          if (this$members[[x]]$name == argName){
                            return (this$members[[x]])
                          }
                        }
                        return ("NULL")
                      }
                    ))

# create a Club
aClub <- Club(name = 'DATA Club', 
              yearFounded = 2015,
              maxMemID = 0)

# create a few members and add them to the club
s <- aClub$addMember(
  Member(name = 'Jeff Garol', yearJoined = 2022))

s <- aClub$addMember(
  Member(name = 'Ursula Van Leiden', yearJoined = 2022))

s <- aClub$addMember(
  Member(name = 'Garrett Liew', yearJoined = 2022))

# number of club members should be correct
aClub$getNumMembers()
aClub$findMemberByName("Jeff Garol")
aClub$findMemberByName("abcd")
