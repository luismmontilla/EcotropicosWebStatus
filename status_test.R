library(RCurl)

web_status <- url.exists("http://erevistas.saber.ula.ve/index.php/ecotropicos/index",
                  .header = TRUE)



if(!file.exists("code_status.csv")) {
  write.table(paste0(names(web_status), collapse = ","),
              "code_status.csv",
              sep = ",",
              quote = FALSE,
              row.names = FALSE,
              col.names = FALSE)
} else {
  FALSE
}

write.table(matrix(web_status,ncol = 9),
            sep = ",",
            "code_status.csv",
            row.names = FALSE,
            col.names = FALSE,
            append = TRUE
            )
