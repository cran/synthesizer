# load_package
library(synthesizer)
# check the package version
packageVersion("synthesizer")

# load_iris
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

# pMSE
pmse(synth=synth_iris, real=iris)

# pMSE
pmse(synth=synth_iris, real=iris, model="rf")

# decorrelate
# decorrelate rank matching to 0.5
s1 <- synthesize(iris, rankcor=0.5)
# decorrelate only Species
s2 <- synthesize(iris, rankcor=c("Species"=0.5))

# plot2
par(mfrow=c(1,2))
plot(Sepal.Length~Sepal.Width, data=s1, pch=16, col=s1$Species
  , main="Synthetic Iris - all variables decorrelated", sub="All variables decorrelated")
plot(Sepal.Length~Sepal.Width, data=s2, pch=16, col=s2$Species
  , main="Synthetic Iris - Species decorrelated", sub="Only species decorrelated")

# UKDD
data(UKDriverDeaths)
synth_udd <- synthesize(UKDriverDeaths)

# plot2
plot(UKDriverDeaths,las=1,lwd=2,main="Drivers killed or seriously injured in the UK"
    , sub="Data from R package 'datasets'")
scol <- adjustcolor('blue',alpha.f=0.5)
lines(synth_udd, col=scol,lwd=2)
legend("topleft",col=c("black",scol),lwd=2,legend=c("Original","Synthetic"),bty='n')

