## Initialize libraries required

library(rCharts)
library(reshape2)

meansconferences=read.csv("https://raw.github.com/patilv/ESPNBball/master/meansconferences.csv")

# Mean statistics for all WCC and Big 12 teams for seasons 2001-2002 through 2012-2013  
# mean Points.Per.Game, mean Games.Played, mean Minutes,mean Rebounds.Per.Game, mean Assists.Per.Game, mean Steals.Per.Game,mean Blocks.Per.Game,
# mean Turnovers.Per.Game, mean Field.Goal.Percent, mean Free.Throw.Percent, mean Three.Point.FieldGoal.Percent
# For more info on how this dataset was generated, 
# please see blog post at http://analyticsandvisualization.blogspot.com/2013/08/short-tales-of-two-ncaa-basketball.html


meltmeansconferences=melt(meansconferences[-c(1,10:14)], id.vars=c("Conference","Year")) # Remove the first irrelevant index column and few additional ones to keep this clean

# Horizontal Stacked bars chart

d1=dPlot(y="Year", x="value",data=meltmeansconferences[which(meltmeansconferences$Conference=="West Coast"),], groups="variable",type="bar")
d1$yAxis(type="addCategoryAxis", orderRule="Year")
d1$xAxis(type="addMeasureAxis")
d1$legend(
  x = 0,
  y = 0,
  width = 500,
  height = 75,
  horizontalAlign = "right"
)
d1

# Musical Horizontal Stacked bars - Creating a story board of (animating) stacked bars by 
# displaying stacked bars charts under different levels of another variable, in the following case, "Year"    

d2=dPlot(y="Year", x="value",data=meltmeansconferences, groups="variable",type="bar",height=800,
         width=1000,bounds = list(x=200, y=125, width=800, height=350))
d2$yAxis(type="addCategoryAxis")
d2$xAxis(type="addMeasureAxis")
d2$set(storyboard = "Conference") 
d2$legend(
  x = 50,
  y = 50,
  width = 800,
  height = 50,
  horizontalAlign = "right"
)
d2


# stacked Area

d3=dPlot(y="Year", x="value",data=meltmeansconferences, groups="variable",type="area",height=800,
         width=1000,bounds = list(x=200, y=125, width=800, height=350))
d3$yAxis(type="addCategoryAxis")
d3$xAxis(type="addMeasureAxis")
d3$set(storyboard = "Conference") 
d3$legend(
  x = 50,
  y = 50,
  width = 800,
  height = 50,
  horizontalAlign = "right"
)
d3


# 100% stacked area
d4=dPlot(y="Year", x="value",data=meltmeansconferences, groups="variable",type="area",height=800,
         width=1000,bounds = list(x=200, y=125, width=800, height=350))
d4$yAxis(type="addCategoryAxis")
d4$xAxis(type="addPctAxis") # Instead of addMeasureAxis used in the regular stacked area 
d4$set(storyboard = "Conference") 
d4$legend(
  x = 50,
  y = 50,
  width = 800,
  height = 50,
  horizontalAlign = "right"
)
d4
d4$publish("100% stacked area with storyboard",host="gist")

