# This R environment comes with all of CRAN preinstalled, as well as many other helpful packages
# The environment is defined by the kaggle/rstats docker image: https://github.com/kaggle/docker-rstats
# For example, here's several helpful packages to load in 

library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library("ggpubr")

# Input data files are available in the "../input/" directory.
# For example, running this (by clicking run or pressing Shift+Enter) will list the files in the input directory

#system("ls ../input")

# Any results you write to the current directory are saved as output.

my.data <- read.csv('../input/train.csv')
my.data
variable <- colnames(my.data)
variable

# Try to see Correlation using pair (SalePrice, SalePrice)
cor1 <- cor(my.data$SalePrice, my.data$LotArea)

cor.test(my.data$SalePrice, my.data$LotArea, method = "pearson", alternative = "two.sided")

ggscatter(my.data, x = "LotArea", y = "SalePrice", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Lot Area", ylab = "Housing Price in US Dollar")

# From graph, it seems that these two variables are not related. So maybe won't use this in prediction
# Need to do this to all variables