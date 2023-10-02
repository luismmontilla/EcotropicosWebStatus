ifelse(!file.exists("code_status.csv"),
       write.table(x= data.frame(date=as.character(),
                                 status=as.numeric()),
                   "code_status.csv",
                   sep = ",",
                   quote = FALSE),
       FALSE)

headers <- curlGetHeaders("http://erevistas.saber.ula.ve/index.php/ecotropicos/index")

http_status <- attributes(headers)$status

headers[1]

code_status <- data.frame(date = Sys.time(),
                          status = http_status)

write.table(code_status,
            sep = ",",
            "code_status.csv",
            row.names = FALSE,
            col.names = FALSE,
            append = TRUE
            )
