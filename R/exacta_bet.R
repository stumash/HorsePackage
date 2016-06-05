#' @param race_df, a data frame containing each horse's name and odds of winning 1st
#' @param picks character vector containing the better's picks for 1st, 2nd, 
#' picks in that order
#' @return our calculation of probability
#' @examples
#' exacta(Kentucky_derby, c('Nyquist','Exaggerator'))
#' exacta(race, my_picks)
#' @export
#' 
#' 
exacta <- function(race_df, picks){
  option1 <- race_df[which(race_df[,1] == pick[1]), psoddsFirst] * race_df[which(race_df[,1] == pick[2]), psoddsSecond]
}