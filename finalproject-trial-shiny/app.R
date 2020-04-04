
# This was somewhat confusing because I wasn't sure how to define the UI. 
# Since the User Interface did not require anything special, I just decided to limit it to mainPanel() 
# which worked in the end. I thought we would have to use imageOutput to get the Image that we want, 
# but on the pset assignment it suggested us to use plotOutput. 
# Actually defining the server logic was also interesting, and most of it was done thanks to the link
# on shiny.rstudio.com that was linked on the pset assignment. To be honest, I do not think I was 
# adequately prepared for this ; it was a bit more difficult than I had imagined. 




# load up the shiny library

library(shiny)

# Define UI for application to only pull up an image

ui <- mainPanel(
    
    # use plotOutput to place image on page
    
    plotOutput("Image")
    
)

# Define server logic to pull image from shiny directory

server <- function(input, output, session){
    
    # send an image to app but still keep the image 
    
    output$Image <- renderImage({
        
        # unlike website reference, no need to do file.path because already in main directory 
        
        shinyplot <- normalizePath(paste('ideology_PR', '.png', sep = ''))
        
        # Return list containing file name and alt text
        list(src = shinyplot,
             width = 1000,
             height = 1000,
             alt = paste("image_save"))
    }, deleteFile = FALSE)
}


# Run the application 

shinyApp(ui, server)
