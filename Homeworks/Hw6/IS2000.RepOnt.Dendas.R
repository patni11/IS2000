# IS2000 Represent Ontologies in R
# Anna Dendas
# Fall 2022

# Represents the Experiment reference class
Experiment <- setRefClass("Instructor", 
                          fields = list(eid="integer", 
                                        title="character",
                                        trials="list"),
                          methods = list(
                            addTrial = function(t) {
                              for(i in t){
                                if(t$eid == eid) {
                                  append(trials, i)
                                }
                              }
                              return(trials)
                            }  
                          ))

# Represents the Subject reference class
Subject <- setRefClass("Subject", 
                       fields = list(sid="integer", 
                                     handedness="character", 
                                     age="integer",
                                     height="numeric"
                                     
                       ))

# Represents the Trial reference class
Trial <- setRefClass("Trial", 
                          fields = list(eid="integer", 
                                        sid="integer",
                                        date="character"
                          ))


# Represents the HumanExperiment reference class
HumanExperiment <- setRefClass("HumanExperiment", 
                     fields = list(reqirb="logical"
                     ))
# Instances of Experiment
experimentA <- Experiment(eid=as.integer(1), title="Experiment A", trials=list())
experimentB <- Experiment(eid=as.integer(2), title="Experiment B", trials=list())
experimentC <- Experiment(eid=as.integer(3), title="Experiment C", trials=list())
experiments <- list(experimentA, experimentB, experimentC)

# Instances of Subject
subjectA <- Subject(sid=as.integer(1), handedness="L", age=as.integer(17),
                    height=180)
subjectB <- Subject(sid=as.integer(2), handedness="R", age=as.integer(16),
                    height=158)
subjectC <- Subject(sid=as.integer(3), handedness="R", age=as.integer(18),
                    height=165)
subjectD <- Subject(sid=as.integer(4), handedness="A", age=as.integer(17),
                    height=171)
subjects <- list(subjectA, subjectB, subjectC, subjectD)

#Instances of Trial
trialA <- Trial(eid=as.integer(1), sid=as.integer(1), date="01/01/2021")
trialB <- Trial(eid=as.integer(1), sid=as.integer(2), date="02/02/2021")
trialC <- Trial(eid=as.integer(1), sid=as.integer(3), date="03/03/2021")
trialD <- Trial(eid=as.integer(1), sid=as.integer(4), date="04/04/2021")
trialE <- Trial(eid=as.integer(2), sid=as.integer(1), date="05/05/2021")
trialF <- Trial(eid=as.integer(2), sid=as.integer(2), date="06/06/2021")
trialG <- Trial(eid=as.integer(2), sid=as.integer(3), date="07/07/2021")
trialH <- Trial(eid=as.integer(2), sid=as.integer(4), date="08/08/2021")
trialI <- Trial(eid=as.integer(3), sid=as.integer(1), date="09/09/2021")
trialJ <- Trial(eid=as.integer(3), sid=as.integer(2), date="10/10/2021")
trials <- list(trialA, trialB, trialC, trialD, trialE, trialF, trialG, trialH, 
           trialG)

listOfTrials <- experiments$addTrial(trials)
print(listOfTrials)