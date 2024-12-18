library(data.tree)
library(DiagrammeR)
library(networkD3)


startNode <- Node$new("X1=3.5")
left <- startNode$AddChild("X1=1.5")
leftLeft <- left$AddChild("(1,2,4)")
leftRight <- left$AddChild("(2,6,5)")
right <- startNode$AddChild("X2=6")
rightLeft <- right$AddChild("(3,4,6)")
rightRight <- right$AddChild("X1=4.5")
rightRightLeft <- rightRight$AddChild("(4,8,10)")
rightRightRight <- rightRight$AddChild("(5,10,14)")

myTree <- ToDataFrameNetwork(startNode, "ExampleTree")
plot(startNode)