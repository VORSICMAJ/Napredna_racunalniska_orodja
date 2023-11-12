(* ::Package:: *)

montecarloPi[numPoints_] := 
 Module[{pointsInsideCircle, pointsInsideSquare, x, y, r, insideCircle},
  x = RandomReal[{-1, 1}, numPoints];
  y = RandomReal[{-1, 1}, numPoints];
  r = Sqrt[x^2 + y^2];
  insideCircle = r <= 1;
  pointsInsideCircle = Select[Transpose[{x, y}], #[[1]]^2 + #[[2]]^2 <= 1 &];
  pointsInsideSquare = Transpose[{x, y}];
  {
   4 N[Length[pointsInsideCircle]/Length[pointsInsideSquare]],
   ListPlot[{
     pointsInsideSquare,
     pointsInsideCircle
     },
    PlotStyle -> {
      {Blue, PointSize[0.02]},
      {Yellow, PointSize[0.03]}
      },
    AspectRatio -> 1,
    Epilog -> {
      Blue, Circle[{0, 0}, 1],
      Dashed, Line[{{-1, 0}, {1, 0}}], Line[{{0, -1}, {0, 1}}],
      Text["(-1,0)", {-1, -0.2}], Text["(1,0)", {1, -0.2}],
      Text["(0,-1)", {-0.2, -1}], Text["(0,1)", {-0.2, 1}],
      PointSize[0.02],
      Point[{1.8, 1.1}], 
      Point[{1.8, 1.0}], 
      Text["Circle", {1.9, 1.1}],
      Text["Square", {1.9, 1.0}]
      },
    Frame -> True,
    PlotLabel -> "Generirane to\[CHacek]ke pri aproksimaciji \[SHacek]tevila \[Pi] "
    ]
   }
  ]


