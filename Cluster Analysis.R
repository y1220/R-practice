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

# clustering with mtcars
pacman::p_load(dplyr, ggplot2)
head(mtcars)
df= mtcars[,c('mpg','wt','hp', 'am')]
head(df)

# kmeans 
# building kmeans clustering models with 3 centers
km1= kmeans(df, centers=3)
km1
cbind(df,km1$cluster)
table(km1$cluster) # help to know the number of observation in each cluster
df[km1$cluster==1,]
df %>% filter(km1$cluster==2)
df %>% arrange(km1$cluster)

# based on clusters lets find the mean of variables in our dataset
df %>% group_by(clusterNo= km1$cluster) %>% summarise_all(mean, na.rm=T)

# plotting the clusters using package factoextra
library(factoextra)
fviz_cluster(km1, data=df)

# factoextra method
set.seed(123)
fviz_nbclust(df, kmeans, method= 'wss') # with-in-of-squares
fviz_nbclust(df, kmeans, method= 'wss') + geom_vline(xintercept= 3, linetype= 2) +
  labs(subtitle= 'Elbow method')
# xintercept: Parameters that control the position of the line
# from above function(elbow method) we get to know, the best no. of cluster is 2,3, or 4

# Verify with NbClust method:
library(NbClust)
set.seed(1234)
nc <- NbClust(df, distance = 'euclidean', min.nc=2, max.nc=6, method= 'kmeans') 
nc

# Do scale since the value at marks and project differs
# 5 students into 2 groups
marks1= c(65, 60, 70, 75, 67)
marks2= c(95, 80, 52, 55, 57)
project= c(120, 100, 90, 80, 110)
(exam3= data.frame(marks1, marks2, project))
# project marks will be more dominating
exam3scaled= scale(exam3)
exam3scaled # -3 to 3 : Z score scaling

cluster2C= kmeans(exam3scaled, centers=2)
cluster2C
cluster2C$cluster
cbind(exam3, group=cluster2C$cluster)
