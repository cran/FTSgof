## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(FTSgof)

## ----setup2-------------------------------------------------------------------
# Load example data
data(Spanish_elec)  # Daily Spanish electricity price profiles

# Perform exploratory data analysis
fport_eda(Spanish_elec, H = 20, alpha = 0.05, wwn_bound = FALSE, M = NULL)


## ----setup3-------------------------------------------------------------------

# Perform white noise hypothesis testing
fport_wn(Spanish_elec, test = "autocovariance", H = 10)
fport_wn(Spanish_elec, test = "spherical", H = 10, pplot = TRUE)

# Generate fGARCH(1) data for testing
yd_garch <- dgp.fgarch(J = 50, N = 200, type = "garch")$garch_mat
fport_wn(yd_garch, test = "ch", H = 10, stat_Method = "norm")


## ----setup4-------------------------------------------------------------------

# Perform goodness-of-fit tests
fport_gof(Spanish_elec, test = "far", H = 10)

# Example with SP500 data
data(sp500)
fport_gof(OCIDR(sp500), test = "arch", M = 1, H = 5)
fport_gof(OCIDR(sp500), test = "garch", M = 1, H = 5)


