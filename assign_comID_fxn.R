get_comid_from_nwis <- function(site_no) {
  
  site_no <- as.character(site_no)
  
  message("Trying USGS site: ", site_no)
  
  result <- tryCatch(
    {
      nhdplusTools::discover_nhdplus_id(
        nldi_feature = list(
          featureSource = "nwissite",
          featureID = paste0("USGS-", site_no)
        )
      )
    },
    
    error = function(e) {
      
      message(
        "  FAILED: ",
        site_no,
        " | ",
        conditionMessage(e)
      )
      
      return(NA_character_)
    }
  )
  
  if (length(result) == 0 || all(is.na(result))) {
    message("  No COMID returned: ", site_no)
    return(NA_character_)
  }
  
  if (is.data.frame(result)) {
    
    comid_col <- find_column(
      result,
      c(
        "comid",
        "COMID",
        "nhdplus_comid",
        "identifier"
      )
    )
    
    if (is.na(comid_col)) {
      message("  Response contained no COMID column: ", site_no)
      return(NA_character_)
    }
    
    result <- as.character(
      result[[comid_col]][1]
    )
    
  } else {
    
    result <- as.character(result[[1]])
  }
  
  message(
    "  Success: ",
    site_no,
    " -> COMID ",
    result
  )
  
  result
}