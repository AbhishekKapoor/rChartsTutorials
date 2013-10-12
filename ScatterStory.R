library(rCharts)

meansconferences=read.csv("https://raw.github.com/patilv/ESPNBball/master/meansconferences.csv")

# Mean statistics for all WCC and Big 12 teams for seasons 2001-2002 through 2012-2013  
# mean Points.Per.Game, mean Games.Played, mean Minutes,mean Rebounds.Per.Game, mean Assists.Per.Game, mean Steals.Per.Game,mean Blocks.Per.Game,
# mean Turnovers.Per.Game, mean Field.Goal.Percent, mean Free.Throw.Percent, mean Three.Point.FieldGoal.Percent
# For more info on how this dataset was generated, 
# please see blog post at http://analyticsandvisualization.blogspot.com/2013/08/short-tales-of-two-ncaa-basketball.html

# Scatter plot with story board

d1=dPlot(y="Assists.Per.Game", x="Turnovers.Per.Game",data=meansconferences, groups="Year",type="bubble")
d1$yAxis(type="addMeasureAxis")
d1$xAxis(type="addMeasureAxis")
d1$set(storyboard="Conference") # added a storyboard - chart changes by conference
d1$legend(
  x = 0,
  y = 0,
  width = 500,
  height = 75,
  horizontalAlign = "right"
)
d1