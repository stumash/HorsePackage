#' 
#' @param race_df, a data frame containing each horse's name and odds of winning 1st
#' @param Pick for the show bet
#' @return  our calculation of probability
#' @examples
#' show_bet(horse_info, "Nyquist")
#' @export
#' 
show_bet <- function(race_df, pick){
  show_odds <- race_df[which(race_df[,1] == pick), psoddsFirst] + race_df[which(race_df[,1] == pick), psoddsSecond] + race_df[which(race_df[,1] == pick), psoddsThird]
}

