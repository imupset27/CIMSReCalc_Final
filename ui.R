library(shiny)
library(auth0)

Sys.setenv(tz="Asia/Muscat")

#setwd("/srv/shiny-server/app")
timeoutSeconds <- 600

inactivity <- sprintf("function idleTimer() {
var t = setTimeout(logout, %s);
window.onmousemove = resetTimer; // catches mouse movements
window.onmousedown = resetTimer; // catches mouse movements
window.onclick = resetTimer;     // catches mouse clicks
window.onscroll = resetTimer;    // catches scrolling
window.onkeypress = resetTimer;  //catches keyboard actions

function logout() {
Shiny.setInputValue('timeOut', '%ss')
}

function resetTimer() {
clearTimeout(t);
t = setTimeout(logout, %s);  // time is in milliseconds (1000 is 1 second)
}
}
idleTimer();", timeoutSeconds*1000, timeoutSeconds, timeoutSeconds*1000)


auth0_ui(shinyUI(fluidPage(
  tags$script(inactivity),
  titlePanel(
    h4("UTAS CIMS Transcript Re-Calculator"),
    windowTitle = "CIMS ReCalc"
    
  ),
  sidebarLayout(
    uiOutput("sp"),
    mainPanel(
      uiOutput("tb")
      
      # use below code if you want the tabset programming in the main panel. If so, then tabset will appear when the app loads for the first time.
      #tabsetPanel(tabPanel("Summary", verbatimTextOutput("sum")),
      #tabPanel("Data", tableOutput("table")))
      
      #cat(paste("#", capture.output(sessionInfo()), "\n", collapse =""))
      
      # R version 3.5.2 (2018-12-20) 
      # Platform: x86_64-w64-mingw32/x64 (64-bit) 
      # Running under: Windows >= 8 x64 (build 9200) 
      #  
      # Matrix products: default 
      #  
      # locale: 
      # [1] LC_COLLATE=English_Philippines.1252  LC_CTYPE=English_Philippines.1252    
      # [3] LC_MONETARY=English_Philippines.1252 LC_NUMERIC=C                         
      # [5] LC_TIME=English_Philippines.1252     
      #  
      # attached base packages: 
      # [1] stats     graphics  grDevices utils     datasets  methods   base      
      #  
      # other attached packages: 
      # [1] dplyr_0.8.0.1     data.table_1.12.0 zoo_1.8-4         readxl_1.3.0      
      # [5] shiny_1.2.0       
      #  
      # loaded via a namespace (and not attached): 
      #  [1] Rcpp_1.0.0       rstudioapi_0.9.0 magrittr_1.5     tidyselect_0.2.5 
      #  [5] xtable_1.8-3     lattice_0.20-38  R6_2.4.0         rlang_0.3.1      
      #  [9] tools_3.5.2      grid_3.5.2       htmltools_0.3.6  yaml_2.2.0       
      # [13] digest_0.6.18    assertthat_0.2.0 tibble_2.0.1     crayon_1.3.4     
      # [17] purrr_0.3.0      later_0.8.0      promises_1.0.1   glue_1.3.0       
      # [21] mime_0.6         pillar_1.3.1     compiler_3.5.2   cellranger_1.1.0 
      # [25] jsonlite_1.6     httpuv_1.5.0     pkgconfig_2.0.2
      
      
      # outputDir <- "C:\\Users\\656\\Dropbox\\RMarkdown Projects\\Recalculation new4\\alldata\\individualfile"
      # outputDir2 <- "C:\\Users\\656\\Dropbox\\RMarkdown Projects\\Recalculation new4\\alldata"
      # 
      # 
      # saveData <- function(data) {
      #   data <- data
      #   # Create a unique file name
      #   fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(data))
      #   # Write the file to the local system
      #   write.csv(
      #     x = data,
      #     file = file.path(outputDir, fileName), 
      #     row.names = FALSE   
      #   )
      # }
      # 
      # loadData <- function() {
      #   # Read all the files into a list
      #   files <- list.files(outputDir, full.names = TRUE)
      #   data <- lapply(files, read.csv, stringsAsFactors = FALSE) 
      #   # Concatenate all data together into one data.frame
      #   data <- do.call(rbind, data)
      #   write.csv(
      #     x = data,
      #     file = file.path(outputDir2, "Alldata.csv"), 
      #     row.names = FALSE   
      #   )
      # }
      
      
      # library(shiny)
      # options(shiny.host="10.153.103.15", shiny.port=628)
      # runApp(appDir="C:/Users/656/Dropbox/RMarkdown Projects/Recalculation/Recalculation FINAL3")
      
      # library(shiny)
      # options(shiny.host="10.153.102.86", shiny.port=628)
      # runApp(appDir="C:/Users/656/Dropbox/RMarkdown Projects/Recalculation/Recalculation FINAL5")
    )
    
  ), logoutButton()
)))