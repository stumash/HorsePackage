#' Calculates the probability of a box bet being successful
#' @param race_df, a data frame containing each horse's name and odds of winning 1st
#' @param picks character vector containing the better's picks for 1st, 2nd, and possibly third
#' picks in no particular order
#' @return our calculation of probability
#' @examples
#' box(Kentucky_derby, c('Nyquist','Exaggerator'))
#' box(race, my_picks)
#' @export
box <- function(race_df, picks){
  if (length(picks) == 2){
    odds <- exacta(race_df, picks) + exacta(race_df, c(picks[2],picks[1]))
  }
  else if (length(picks) == 3){
    option1 <- c(picks[1], picks[2], picks[3])
    option2 <- c(picks[1], picks[3], picks[2])
    option3 <- c(picks[2], picks[1], picks[3])
    option4 <- c(picks[2], picks[3], picks[1])
    option5 <- c(picks[3], picks[2], picks[1])
    option6 <- c(picks[3], picks[1], picks[2])
    odds <- trifecta(race_df, option1) + trifecta(race_df, option2) + trifecta(race_df, option3) + trifecta(race_df, option4) + trifecta(race_df, option5) + trifecta(race_df, option6) 
  } 
  else {
    stop("Invalid amount of picks.", call. = FALSE)
  }
}