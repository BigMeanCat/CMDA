

shinyUI(pageWithSidebar(
  headerPanel('iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris1)),
    selectInput('ycol', 'Y Variable', names(iris1),
                selected=names(iris1)[[2]]),
    numericInput('clusters', 'Cluster count', 5,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
  )
))
