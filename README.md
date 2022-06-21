# burning_forest_simulation
Program that burns the forest and calculates the relationship between forest compaction and the probability of burning it

The topic of the work is to find the optimal forest density, where as few trees as possible are burned after a thunder strike,
but with the greatest possible land use. It is clear that with a forest density of two trees and as large an empty field as possible,
there will be the least chance of burning a large number of trees.

Output for 100 samples with 2500 reapeats for each:

![image](https://user-images.githubusercontent.com/56487722/174787272-66ad732e-c87c-4a70-80fa-9f79fa2edba0.png)

Examples vizualization of generated forest:
![image](https://user-images.githubusercontent.com/56487722/174788374-e2898521-6034-462e-be16-03a84b49883b.png)

![image](https://user-images.githubusercontent.com/56487722/174787450-194077f7-6b2b-4560-ace7-20b7063517ed.png)

![image](https://user-images.githubusercontent.com/56487722/174787471-f0ece11d-a8c8-49ae-8cb6-dd3373004519.png)

Legend:<br />
case forest[y][x]<br />
            when 0 print "🟫", empty place<br />
            when 1 print "🌳", tree<br />
            when 2 print "🔥", burnt tree<br />
            when 3 print "⚡", thunder hit<br />
            when 4 print "🐼", panda<br />
            when 5 print "🍖", burnt panda<br />
            end<br />
