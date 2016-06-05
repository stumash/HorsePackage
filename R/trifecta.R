#' Calculate the odds that a bookie will likely give for a certain trifecta pick.
#' Also calculate the probability of a trifecta pick happening, using the same
#' method that we do in the win function. We make these calculations using the 
#' Harville method (Journal of the Amer. Stat. Assn. 1973), which states that 
#' trifecta probability can be calculated by the formula:
#'          
#'                          (p1 * p2 * p3)/((1 - p1)*(1 - p1 - p2))
#'                  
#' where p1, p2, and p3 are the odds that horse 1, horse 2, and horse 3 have to
#' win first place. Making this calculation using the bookies' p1, p2, and p3 will
#' give us odds that we would likely see from a bookie. We will perform the same
#' calculation substituting the sum of all bookies' odds for 1 (which is always
#' greater than 1). This is analagous to the calculations we perform to find
#' the true probability of an individual horse winning in the win function.
#' 
#' @param race_df, a data frame containing each horse's name and odds of winning 1st
#' @param picks character vector containing the better's picks for 1st, 2nd, 
#' and 3rd place, in that order
#' @return a vector containing odds and our calculation of probability
#' @examples
#' trifecta(Kentucky_derby, c('Nyquist','Exaggerator','Big Brown'))
#' trifecta(race, my_picks)
#' @export
trifecta <- function(race_df, picks) {
  df <- race_df
  df$plus1 <- df[,2] + 1
  df$sodds <- (1/df$plus1) / (sum(1/df$plus1))
  horse1 <- df[which(df[,1] == picks[1]), 5]
  horse2 <- df[which(df[,1] == picks[2]), 5]
  horse3 <- df[which(df[,1] == picks[3]), 5]
  
  trifectaFinal <- (horse1 * horse2 * horse3) / ((1 - horse1)*(1 - horse1 - horse2))
}