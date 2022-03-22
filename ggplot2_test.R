# Ths script is created to help refresh my memory on how to use ggplot2 and
# to better improve my knowledge for when I am creating a data representation
# for other information

###############################################################################
-------------------------------------------------------------------------------
  
# First import libraries
  
library(tidyverse)

# view test data

data()

# view BOD dataset

BOD

# View BOD with description

?BOD

# Start ggplot2

ggplot(data = BOD,
       mapping = aes(x = Time, 
                     y = demand)) + 
  geom_point(size = 5) +
  geom_line(color = "red", size = 2)



# Use with less arguments

ggplot(BOD, aes(Time, demand)) + 
  geom_point(size = 5) + 
  geom_line(color = 'red')


# Different graph with different Dataset

data()

view(co2)

co22 <- as.data.frame(co2)

# Graph

ggplot(co2)

#orrrr using the pipe operator (because of tidyverse)
co22 %>%
  ggplot(aes(conc, update, color = Treatment)) + geom_point()
