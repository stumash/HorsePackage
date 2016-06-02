#' Calculate the 
#'
#' @param pick is the name of the horse the user wants to bet on
#' @param amount is the amount the user wants to bet.
#' @return A vector of the payoff for that bet and the odds the user wins the bet
#' @examples
#' ellipse_perimeter(1, 1)
#' ellipse_perimeter(1)
#' @export
win <- function(race_df, pick, amount = 1){
  
  # we are attempting to calculate the probabilty that a horse will win the race.
  # we did so by dividing the inverse of a horses payout multiplier by the sum of 
  # inverses of horse payouts.
  # Ex:
  # Nyquist had a multiplier of 2 for the Kentucky Derby. The total odds added up to
  # 1.19 (roughly, only up to 13 horses), the prob he would win is .5 / 1.19.
  race_df$probToWin <- (1/race_df$Horse_Odds) / (sum(1/race_df$Horse_Odds))
  
  bet <- race_df[which(race_df$Horse_Names == pick),]
  
  #For a simple win bet, the payout is simply the odd mulitplier.
  finalVec <- c(bet$Horse_Odds, bet$probToWin)
   
}