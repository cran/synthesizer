# load_package
library(synthesizer)
# check the package version
packageVersion("synthesizer")

# load_chickweight
data(iris)
head(iris)

# synthesize_iris
set.seed(1)
synth_iris <- synthesize(iris)

# plot
oldpar <- par(mfrow=c(1,2))
plot(Sepal.Length ~ Petal.Length, data=iris, col=iris$Species, pch=16,las=1,xlim=c(0,7),ylim=c(4,8),main="Original")
legend("topleft",legend=levels(iris$Species),col=1:3,pch=16,bty="n")
plot(Sepal.Length ~ Petal.Length, data=synth_iris, col=iris$Species,pch=16,las=1,xlim=c(0,7),ylim=c(4,8),main="Synthesized")
legend("topleft",legend=levels(iris$Species),col=1:3,pch=16,bty="n")
par(oldpar)

# synthesize_more
more_synth <- synthesize(iris, n=250)
dim(more_synth)

# <unlabeled code block>
pmse(synth=synth_iris, real=iris)

