#import raw datasets
import_raw_data <- function(q1, q2, q3, q4)
q1 <- read_csv(here("raw_data", "QuebradaCuenca1-Bisley.csv"), na = "NA")
q2 <- read_csv(here("raw_data", "QuebradaCuenca2-Bisley.csv"), na = "NA")
q3 <- read_csv(here("raw_data", "QuebradaCuenca3-Bisley.csv"), na = "NA")
mpr <- read_csv(here("raw_data", "RioMameyesPuenteRoto.csv"), na = "NA")