#' @details This function requires having a character vector with one or more valid Report Suites specified.
#'
#' @description Gets valid metrics for current user, valid with optionally specified existing metrics, elements and date granularity
#'
#' @title Get Available Metrics within a Report Suite
#' 
#' @param reportsuite.ids Single report suite id, or character vector of report suite ids
#' @param metrics List of existing metrics you want to use in combination with an additional metric
#' @param elements List of existing elements you want to use in combination with an additional metric
#' @param date.granularity Granularity that you want to combine with an additional metric
#'
#' @importFrom jsonlite toJSON unbox
#' @importFrom plyr rbind.fill
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' metrics.valid <- GetMetrics("your_report_suite",
#'                             metrics=c('visitors','pageviews'),
#'                             elements=c('page','geoCountry'),
#'                             date.granularity='day')
#'                             
#' metrics <- GetMetrics(report_suites$rsid)
#' }

GetMetrics <- function(reportsuite.ids, metrics=c(), elements=c(), date.granularity='') {
  
  valid.metrics <- data.frame()

  for(reportsuite.id in reportsuite.ids) {

    request.body <- c()
    request.body$reportSuiteID <- unbox(reportsuite.id)

    if(length(metrics)>0) { 
      request.body$existingMetrics <- metrics
    }
    if(length(elements)>0) { 
      request.body$existingElements <- elements
    }
    if(nchar(date.granularity)>0) { 
      request.body$dateGranularity <- unbox(date.granularity) 
    }

    working.metrics <- ApiRequest(body=toJSON(request.body),func.name="Report.GetMetrics")
    working.metrics$rsid <- reportsuite.id
    if(length(valid.metrics)){
      valid.metrics <- rbind.fill(valid.metrics,working.metrics)
    } else {
      valid.metrics <- working.metrics
    }
    
  }

  return(valid.metrics)

}