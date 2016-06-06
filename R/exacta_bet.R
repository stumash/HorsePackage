#' Calculate the odds of an exacta bet, in which a better picks Horse A to come in first and Horse B
#' to come in second. He only wins the bet if the horses finish in that exact order
#' @param race_df, a data frame that has been passed through generate_psodds, so it has columns
#' for each horse's odds of winning 1st, 2nd, and 3rd
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
  ## Ensure data frame is in right format; if not, run generate_psodds on it to correct
  if (length(names(race_df)) == 3) race_df <- generate_psodds(race_df)
  
  if (length(picks) != 2)
    stop("Must pick two horses", call. = FALSE)
  if (picks[1] == picks[2])
    stop("Cannot pick same horse", call. = FALSE)
  option1 <- race_df[which(race_df[,1] == picks[1]), 'psoddsFirst'] * race_df[which(race_df[,1] == picks[2]), 'psoddsSecond']
}