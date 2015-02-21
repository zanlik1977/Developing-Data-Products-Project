library(shiny)
library(scatterplot3d)

# vltwosubs.txt contains properties of galaxies in the 
# vicinity of our own Milky Way galaxy.
data <- read.table("./data/vltwosubs.txt", header=FALSE) 

colnames(data) <- c("id","distance", "peakVmax", "Vmax", 
                    "rVmax", "Mtidal", "rtidal", "x", "y", 
                    "z", "vx", "vy", "vz", "M300", "M600")

# correcting for the latest results on the mass of Milky Way
data$rtidal[data$Mtidal >= 1e11] <- 300 
Mpc <- 1000 # Kpc

# Define server logic required to draw a 3D plot
shinyServer(function(input, output) {
  
  output$DPlot <- renderPlot({
    
    # reading in coordinates, masses and radii of galaxies 
    mr <- input$mass_ratio
    x <- data$x[1e11/data$Mtidal <= mr]/Mpc
    y <- data$y[1e11/data$Mtidal <= mr]/Mpc
    z <- data$z[1e11/data$Mtidal <= mr]/Mpc
    m <- data$Mtidal[1e11/data$Mtidal <= mr]
    r <- data$rtidal[1e11/data$Mtidal <= mr]/Mpc

    # zooming in
    zoom_in <- (4000/Mpc)/input$zoom  
    # choose lower limit for zooming in
    rcut <- 10/Mpc        
    # choose galaxies to show according to the zoom
    rpl <- r[r/zoom_in > rcut]
    xpl <- x[r/zoom_in > rcut]
    ypl <- y[r/zoom_in > rcut]
    zpl <- z[r/zoom_in > rcut] 
    
    # represent every galaxy with 1000 uniformly distributed 
    # points on the sphere of radius rpl
    theta <- runif(1000, 0, 180)
    fi <- runif(1000, 0, 360)
    xsp <- 0; ysp <- 0; zsp <- 0;
    xsp <- as.vector(xpl + rpl %o% sin(theta) *cos(fi))
    ysp <- as.vector(ypl + rpl %o% sin(theta) * sin(fi))
    zsp <- as.vector(zpl + rpl %o% cos(theta))
    
    # draw the 3D plot
    
    scatterplot3d(c(x,xsp),c(y,ysp),c(z,zsp), pch=19, 
                  cex.symbols=0.1, xlim=c(-zoom_in,zoom_in), 
                  ylim=c(-zoom_in,zoom_in), zlim=c(-zoom_in,zoom_in), 
                  angle=input$rotate, xlab="X [Mpc]", ylab="Y [Mpc]", 
                  zlab="Z [Mpc]")
    
    
    
  })
})