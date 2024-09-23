if (!require(shiny)) { install.packages("shiny") }
if (!require(readxl)) { install.packages("readxl") }
if (!require(dplyr)) { install.packages("dplyr") }
if (!require(openxlsx)) { install.packages("openxlsx") }

library(dplyr)
library(readxl)
library(shiny)
library(openxlsx)

function(input, output) {
  output$contents <- renderTable({
    use_demo_online_file <- TRUE # CHANGE TO FALSE IF YOU WANT TO REQUIRE FILE PICKING
    if (use_demo_online_file){
      df = read.xlsx("https://github.com/drpawelo/data/raw/refs/heads/main/random/students-example.xlsx",sheet=1)
    }else{
      req(input$file) 
      file_path <- input$file$datapath
      df <- read_excel(file_path)  # Read the Excel file
    }

    
    students_to_pair <- df[2]
    new_pairs <- generate_random_pair(students_to_pair)
    
    # names(students_to_pair)<- ("PAIRINGS 23Sept24") # TODO use real date now
    pairs_to_insert <- unlist(list(new_pairs))
    insert_at_index <- 3
    df <- cbind(df[1:(insert_at_index-1)], new_col = new_pairs, df[insert_at_index:ncol(df)])
    return(df)  # Return the data frame
  })
  
  generate_random_pair <- function(all_students) {
    
    return( c( c('a','b'), c('d','e')) )
    # return(result)
  }
}