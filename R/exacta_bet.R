#' Calculates the probability of an exacta bet being successful
#' @param race_df, a data frame containing each horse's name and odds of winning 1st
#' @param picks character vector containing the picks, by horse name, to come in 1st and 2nd
#' in that order.
#' @return The probability of the exacta bet being successful.
#' @examples
#' exacta(Kentucky_derby, c('Nyquist','Exaggerator'))
#' exacta(race, my_picks)
#' @export
#' 
#' 
exacta <- function(race_df, picks){
  ## Ensure data frame is in right format; if not, run generate_psodds on it to correct
  if (length(names(race_df)) == 3) race_df <- generate_psodds(race_df)
  
  if (length(picks) != 2)
    stop("Must pick two horses", call. = FALSE)
  if (picks[1] == picks[2])
    stop("Cannot pick same horse", call. = FALSE)
  option1 <- race_df[which(race_df[,1] == picks[1]), 'psoddsFirst'] * race_df[which(race_df[,1] == picks[2]), 'psoddsSecond']
}