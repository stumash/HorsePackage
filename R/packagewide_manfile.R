#' HorsePackage: Crunch the Numbers Before Heading Down to the Track.
#' 
#' HorsePackage takes a data.frame with horse-race betting information in a certain
#' structure and crunches the numbers for you! The structure required by HorsePackage is as follows:
#' First, a column containing the names of the horses in the race.  The second column must contain
#' each horse's odds of winning the race formatted as a string "x:y". For
#' example, "25:1", being "twenty-five to one". Then, use:
#'    <your.data.frame> <- generate_psodds(<your.data.frame>)
#' and let the fun begin! Check out all the functions and see what bets suit you best.
#' Feel free to add more bets using the psodds provided for 1st, 2nd and 3rd place
#' @section HorsePackage functions:
#' box
#' exacta
#' trifecta
#' @docType package
#' @name HorsePackage
NULL