#' Moving Average
#'#'The purpose of this function is to calculate the moving average based on 9-week intervals. 
#' @param focal_date The date where you are determining the averages. 
#' @param dates The dates of the study. 
#' @param conc The nutrients (K, Mg, Ca, NH4-N, NO3-N).
#' @param win_size_wks Schaefer et al. 2000 plotted the data in 9 week moving time. This is the window size in weeks that we are pulling the data from. 
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