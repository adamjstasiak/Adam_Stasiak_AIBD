library(magrittr)
install.packages("ggplot2")
library("ggplot2")

install.packages("GGally")
library("GGally") 

library(cluster)

# Zadanie 1
lst <- 1:10

print(lst)
lst%<>% log2()%>%sin()%>%sum()%>%sqrt()

print(lst)

data(iris)

print(head(iris,6))

spc <- iris%>% 
    aggregate(.~Species,.,mean)

print(spc)

# Zadanie 2

plots <- ggplot(iris,aes(x=Sepal.Width))+
    geom_histogram(aes(fill=Species,color=Species),bins=20) + 
    geom_vline(data=spc,aes(xintercept=Sepal.Width,color=Species),linetype="dashed")+
    labs(x='x_axis',y='y_axis',title='title')
ggsave("/home/rplot.jpg",plot = plots)

plots <- ggpairs(data = iris,aes(color = Species))
ggsave("/home/rplot2.jpg",plot = plots)

# Zadanie 3

x <- iris[,1:4]
y <- iris[,5]

sum_sqr <- c() 
for(i in 1:10){
    kmeans_result <- kmeans(x, i)
    sum_sqr <- append(sum_sqr, kmeans_result$tot.withinss)
}

plots <- ggplot(data.frame(iteration = 1:length(sum_sqr), value = sum_sqr), aes(x = iteration, y = sum_sqr)) + geom_line()
ggsave("/home/rplot3.jpg",plot = plots)

kmeans_result <- kmeans(x, 3)
plots <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = kmeans_result$cluster)) + geom_point()
ggsave("/home/rplot4.jpg",plot = plots)

plots <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) + geom_point()
ggsave("/home/rplot5.jpg",plot = plots)