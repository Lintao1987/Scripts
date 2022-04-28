#!/public/cau/software/R-3.6.0/bin/R


#library
#BiocManager::install("leaflet")
library(leaflet)

# load data
tomato <- read.table("tomato_world_map_distribution.txt",sep = "\t", header = TRUE)
head(tomato, 10)

# Create a color palette with handmade bins.
mypalette <- colorFactor(palette=c("#0000CC", "#FF6600",  "#006633"), domain=tomato$class, na.color="transparent")


# Prepare the text for the tooltip:
mytext <- paste(
  "Depth: ", tomato$depth, "<br/>", 
  "tomato_ID: ", tomato$tomato_ID, "<br/>", 
  "class: ", tomato$class, sep="") %>%
  lapply(htmltools::HTML)


# Final Map
m <- leaflet(tomato) %>% 
  addTiles()  %>% 
  setView(lat=-27, lng=50, zoom=1) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~long, ~lat, 
                   fillColor = ~mypalette(class), fillOpacity = 0.7, color="white", radius=3, stroke=FALSE,
                   label = mytext,
                   labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~class, opacity=0.9, title = "class", position = "bottomleft")

m 

# save the widget in a html file if needed.
library(htmlwidgets)
saveWidget(m, file=paste0( getwd(), "/HtmlWidget/bubblemapQuakes.html"))
dev.off()
