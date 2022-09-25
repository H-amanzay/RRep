
#FDT
#1. Upload the dataset iris from the web

ir= read.csv(url('https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv'))

#2. FDT Sepal Length

absfr= table(ir$sepal.length)
relfr= round(prop.table(absfr), 2)
cumfr= cumsum(relfr)

#Let's put them together
fdtRS= cbind(absfr, relfr, cumfr)
