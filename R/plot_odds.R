#' Plot horse's odds of winning first, second, and third, or showing
#' @param race_df, a data frame that has been passed through generate_psodds, so it has columns
#' for each horse's odds of winning 1st, 2nd, and 3rd, or showing
#' @param picks, a character containing the horses whose odds of winning first, second, and third you want to see
#' @return a ggplot for each horse
#' @examples
#' exacta(Kentucky_derby, c('Nyquist','Exaggerator'))
#' exacta(race, my_picks)
#' @export
plot_odds <- function(race_df, picks) {
  ## Ensure data frame is in right format; if not, run generate_psodds on it to correct
  if (length(names(race_df)) == 3) race_df <- generate_psodds(race_df)
  
  ## data frame we will use to plot
  names <- rep(picks, each = 4)
  probs <- rep(0, length(names))
  places <- rep(c('1st', '2nd', '3rd', 'Show'), length(picks))
  plot_frame <- data.frame(names, probs, places)
  
  for (i in 1:length(picks)) {
    name_index <- which(race_df$Horse_Names == picks[i])
    plot_frame$probs[4*(i - 1) + 1] <- race_df[name_index, 'psoddsFirst']
    plot_frame$probs[4*(i - 1) + 2] <- race_df[name_index, 'psoddsSecond']
    plot_frame$probs[4*(i - 1) + 3] <- race_df[name_index, 'psoddsThird']
    plot_frame$probs[4*(i - 1) + 4] <- show_bet(race_df, picks[i])
  }
  
  ggplot(plot_frame, aes(x = factor(places), y = probs), fill = probs) + geom_bar(stat = "identity", col = factor(places)) + 
     facet_grid(names ~ .)

}