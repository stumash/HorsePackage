#' Plot horse's odds of winning first, second, and third
#'@param race_df, a data frame that has been passed through generate_psodds, so it has columns
#' for each horse's odds of winning 1st, 2nd, and 3rd
#' @param picks, a character containing the horses whose odds of winning first, second, and third you want to see
#' @return a ggplot for each horse
#' @examples
#' exacta(Kentucky_derby, c('Nyquist','Exaggerator'))
#' exacta(race, my_picks)
#' @export
#' 
#' 


plot_odds <- function(race_df, picks) {
  ## Ensure data frame is in right format; if not, run generate_psodds on it to correct
  if (length(names(race_df)) == 3) race_df <- generate_psodds(race_df)
  
  ## data frame we will use to plot
  names <- rep(picks, each = 3)
  probs <- rep(0, length(names))
  places <- rep(c('1st', '2nd', '3rd'), length(picks))
  plot_frame <- data.frame(names, probs, places)
  
  for (i in 1:length(picks)) {
    name_index <- which(race_df$Horse_Names == picks[i])
    plot_frame$probs[i] <- race_df[name_index, 'psoddsFirst']
    plot_frame$probs[i+1] <- race_df[name_index, 'psoddsSecond']
    plot_frame$probs[i+2] <- race_df[name_index, 'psoddsThird']
  }
  
  ##ggplot(plot_frame, aes(x = factor(places), y = probs), rang) + geom_bar(stat = "identity") + facet_grid(names ~ .)
  ggplot(plot_frame, aes(x = factor(places), y = probs)) + geom_bar(stat = "identity") + coord_cartesian(ylim = c(0,1)) + facet_grid(names ~ .)
  
}