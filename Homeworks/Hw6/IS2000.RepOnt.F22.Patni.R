#IS2000 Represent Ontologies in R
#Shubh Patni
#Fall 2022


Experiment <- setRefClass("Experiment", fields = list(
  eID = "numeric", 
  title = "character"))


Subject <- setRefClass("Subject", fields = list(
  sID = "numeric", 
  age = "numeric",
  height = "numeric",
  handedness="list"))

Trial <- setRefClass("Trial", fields = list(
  eID = "numeric", 
  sID = "numeric", 
  date = "character"))

HumanExperiment <- setRefClass("HumanExperiment", contains = "Experiment", fields = list(
  reqIRB="logical"))




experiments <- list(HumanExperiment$new(reqIRB = TRUE, eID = 1, title="Exp1"), HumanExperiment$new(reqIRB = FALSE,eID = 2, title="Exp2"))
exp3 <- Experiment$new(eID = 3, title="Exp3")
exp4 <- Experiment$new(eID = 4, title="Exp4")




subjects <- list(Subject$new(sID= 1,age=21,height=5.11,handedness=list("l")),
                 Subject$new(sID= 2,age=22,height=6.2,handedness=list("r")),
                 Subject$new(sID= 3,age=23,height=5.4,handedness=list("a")),
                 Subject$new(sID= 4,age=24,height=5.7,handedness=list("l")))



trials <- list(Trial$new(eID = 1, sID=1,date="11/2/2022"),
               Trial$new(eID = 1, sID=1,date="10/1/2023"),
               Trial$new(eID = 1, sID=2,date="12/10/2022"),
               Trial$new(eID = 2, sID=2,date="31/10/2022"),
               Trial$new(eID = 2, sID=2,date="25/8/2023"),
               Trial$new(eID = 2, sID=3,date="15/9/2023"),
               Trial$new(eID = 3, sID=3,date="27/3/2023"),
               Trial$new(eID = 3, sID=4,date="12/2/2023"),
               Trial$new(eID = 4, sID=4,date="24/2/2024"),
               Trial$new(eID = 4, sID=4,date="4/4/2024"))



attributes(Experiment)$trials <- list("trial")



Experiment$methods(addTrial = function(t) {
  self$trials <- append(self$trials,t)
})




exp3$addTrial(trials[[7]])



