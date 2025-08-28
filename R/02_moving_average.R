#' Calculate the moving average
#'
#' @param focal_date 
#' @param dates 
#' @param conc 
#' @param win_size_wks 
#'
#' @returns result #the mean of the values inside the window of dates
#' @export
#'
#' @examples
moving_average <- function(focal_date, dates, conc, win_size_wks) {
  # Which dates are in the window?
  is_in_window <- (dates > focal_date - (win_size_wks / 2) * 7) &
    (dates < focal_date + (win_size_wks / 2) * 7)
  # Find the associated concentrations
  window_conc <- conc[is_in_window]
  # Calculate the mean
  result <- mean(window_conc)
  
  return(result)
}