#' Calculate projection error.
#' @param deaths Deaths matrix; see ?maple for more details.
#' @param population Population matrix; see ?maple for more details.
#' @param ax The number of years lived on average by those who die in their current age group. See ?maple_plt for more details. 
#' @param fitted.rates Model estimates of death rates.
#' @return Vector of projection errors, calculated as the difference between observed and estimated life expectancy at birth.
#' @export
maple_projection_error <- function(deaths, population, ax = NULL, fitted.rates) {
    
    if (!all(dim(deaths) == dim(population) & 
             dim(deaths) == dim(fitted.rates))) 
        stop("Observed deaths, population and fitted rates matrices must have equal dimensions.")
    
    if (!all(colnames(deaths) == colnames(population) & 
             colnames(deaths) == colnames(fitted.rates))) 
        stop("Years of deaths, population and fitted rates don't match.")
    
    observed.plt <- maple_plt(death.rates = deaths / population, ax = ax)
    fitted.plt <- maple_plt(death.rates = fitted.rates, ax = ax)
    
    observed.e0 <- plt_ex(observed.plt, x = 0)
    fitted.e0 <- plt_ex(fitted.plt, x = 0)
    
    mean(observed.e0 - fitted.e0, na.rm = TRUE)
}
