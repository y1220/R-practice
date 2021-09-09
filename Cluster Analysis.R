# hierarchical clustering
df= mtcars[,c('mpg','wt','hp','am')]
dfD= dist(df) # distance matrix of the dataset
dfD

# example for distance matrix
# using the data created exam3
exam3 <- data.frame(marks1= c(65,60,70,75,67),
                    marks2= c(95,80,52,55,57),
                    project= c(120, 100, 90, 80, 110)) 
exam3
# project marks will be more dominating
exam3scaled= scale(exam3)
exam3scaled # up scaling

# dist is the function to create distance
res.dist <- dist(exam3, method= 'euclidean')
res.dist

# euclidean distance: d(p,q) = sqrt[(q1-p1)^2 + (q2-p2)^2]

# hierarchical cluster (find similar clusters)
hc= hclust(dfD)
plot(hc)

# Cut tree into 4 groups
sub_grp <- cutree(hc, k=4)

# number of members in each cluster
table(sub_grp)

# creating models using different methods : average, complete and single
hc.average= hclust(dfD, method= 'average')
hc.average
plot(hc.average, hang=-1, cex=.8, main='Average Linkage Clustering: Cluster Nos')

# put the colour (border is selecting the set of colour, 2:6 is also ok)
rect.hclust(hc.average, k= 4, border= 3:7)

# h height cut
plot(hc.average, hang= -1, cex= .8, main= 'Average Linkage Clustering')
rect.hclust(hc.average, h=100)
abline(h=100)
