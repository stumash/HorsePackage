#' Creates the initial data frame that the user will add to later.
#'
#'
#' @return data frame with horse names, odds for the race, and the race name
#' @examples
#' create_df()
#' 
#' 
create_df <- function() {
  
  col_names = c("Horse_Names", "Horse_Odds", "Race_Name", "Race_ID")
  m <- matrix(ncol = 4)
  horse_info <- data.frame(m)
  colnames(horse_info) <- col_names
  
  return (horse_info)
}