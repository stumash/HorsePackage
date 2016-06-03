#' Fill the data frame inputted data, and assign the race and ID
#'
#' @param vec1 is a vector of names
#' @param vec2 is a numeric vector of odds
#' @param race is the name of the race
#' @return the dataframe with the names of the horses and their odds within it
#' @examples
#' ellipse_perimeter(1, 1)
#' ellipse_perimeter(1)
#' @export
#' 
fill_data <- function(horse_names, odds, race_name){
  #the two vectors must have the same amount of values
  if (length(horse_names) != length(horse_odds)) stop("Vectors must be the same length", call. = FALSE)
  
}