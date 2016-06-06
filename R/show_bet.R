#' Calculate the odds of a show bet (My pick wins 1st, 2nd, or 3rd)
#' @param race_df, a data frame containing each horse's name and odds of winning 1st
#' @param Pick for the show bet, must be one value
#' @return  our calculation of probability
#' @examples
#' show_bet(horse_info, "Nyquist")
#' @export
#' 
show_bet <- function(race_df, pick){
  ## Ensure data frame is in right format; if not, run generate_psodds on it to correct
  if (length(names(race_df)) == 3) race_df <- generate_psodds(race_df)
  
  ## Can only pick one horse
  if (length(pick) != 1)
    stop("Must pick one horse", .call = FALSE)
  
  
  show_odds <- race_df[which(race_df[,1] == pick), 'psoddsFirst'] + race_df[which(race_df[,1] == pick), 'psoddsSecond'] + race_df[which(race_df[,1] == pick), 'psoddsThird']
}

