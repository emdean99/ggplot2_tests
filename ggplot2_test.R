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
# Thi could be perticularily helpful with the errors I am having with the budget
# Information
# I believe because of how I have my dataframe setup (need to remove the missing
# characters) having no column names for it to read as an X or label for the data
# It is throwing errors, this is similar to what I was seeing with the co2 vs CO2


data()

view(CO2)


# Graph

ggplot(CO2)

#orrrr using the pipe operator (because of tidyverse)
# alpha makes it transparent
# smooth creates the linear model that follows it with the standard error
# set the linear model with method and the se to not show with F
# Changes the type to show with the facet wrap (splits it up)


CO2 %>%
  ggplot(aes(conc, uptake, color = Treatment)) +
  geom_point(size = 5, alpha = 0.5) + 
  geom_smooth(method = lm, se = F) + 
  facet_wrap(~Type)


# Finished video at 13:36 for the day