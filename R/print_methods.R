print.maple.bma <- function(d) {
    cat("Model averaged projections of mortality and life expectancy between", 
        min(d$fitted.values$year), "and", paste0(max(d$fitted.values$year), "."), "\n")
    cat("Weights of models averaged:\n")
    print(d$model.weights)
    invisible(d)
}

print.inla.model <- function(m) {
    cat("Model", m$name, ": ")
    cat(m$desc, "\n")
    cat("Formula:\n")
    print(m$fml)
    if (!is.null(m$likelihood.weight.rate))
        cat("Weight rate:", m$likelihood.weight.rate, "\n")
    invisible(m)
}

print.lc.model <- function(m) {
    cat("Model", m$name, ": ")
    cat(m$desc, "\n")
    invisible(m)
}