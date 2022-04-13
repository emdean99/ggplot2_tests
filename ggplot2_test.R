# Ths script is created to help refresh my memory on how to use ggplot2 and
# to better improve my knowledge for when I am creating a data representation
# for other information

###############################################################################
-------------------------------------------------------------------------------
  
# First import libraries
  
library(tidyverse)
library(ggplot2)

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
# This could be perticularily helpful with the errors I am having with the budget
# Information
# I believe because of how I have my dataframe setup (need to remove the missing
# characters) having no column names for it to read as an X or label for the data
# It is throwing errors, this is similar to what I was seeing with the co2 vs CO2


data()

view(CO2)


# Graph

ggplot(CO2)

# orrrr using the pipe operator (because of tidyverse)
# alpha makes it transparent
# smooth creates the linear model that follows it with the standard error
# set the linear model with method and the se to not show with F
# Changes the type to show with the facet wrap (splits it up)
# Could try to facet wrap with precipitation and if its snow or rain 
# labs is what is used to create the labels such as title and axis
# This just put at the end (good to know!)

CO2 %>%
  ggplot(aes(conc, uptake, color = Treatment)) +
  geom_point(size = 5, alpha = 0.5) + 
  geom_smooth(method = lm, se = F) + 
  facet_wrap(~Type) + 
  labs(title = 'Concentration of co2') + 
  theme_bw()

# Try with a different type and organization
# Here we try layering multiple things on the same graph
# We also add in the layering aes mapping that only applies to a specific 
# Section of the graph
# the aes can be in either the main ggplot and apply to the whole thing, or
# or in the specific mappings. They also can apply to other data column
# Coord_flip is useful in this case as it gives us a good perspective on the 
# graph. 
# The coord_flip I think would be useful for the histogram for budget
# Set the same theme as example before
# Labels as well

CO2 %>%
  ggplot(aes(Treatment, uptake)) +
  geom_boxplot() + 
  geom_point(alpha = 0.5,
             aes(size = conc,
                 color = Plant)) + 
  facet_wrap(~Type) +
  coord_flip() +
  theme_bw() +
  labs(title ="Chilled vs Non-chilled")


# Use mpg data


# Testing methods of viewing the data
view(mpg)
print(mpg)  

# Graph it with a pipe operator
# First we are compaying displacement to miles per gallon in the city
# We are adding point and smooth geoms for the line and the points on the graph
# facet wrapping by year. The nrow allows us to change the positioning of the 
# graphs to look better


mpg %>%
  ggplot(aes(displ, cty)) + 
  geom_point(aes(color = drv,
                 size = trans), 
               alpha = 0.5) +
  geom_smooth(method = lm) +
  facet_wrap(~year, nrow=1)


# I am gonna separate this one because it shows how to manage outliers
# This might only be accessible because we are using the pipe operator
# The filter function has the information pipped into it and then it pipes it 
# back into the graph
# Fro there we then add labels and other information to make it easier to 
# visualize. I also used a different theme just to test


mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ, cty)) + 
  geom_point(aes(color = drv,
                 size = trans), 
             alpha = 0.5) +
  geom_smooth(method = lm) +
  facet_wrap(~year, nrow=1) +
  labs(x= 'Engine size',
       y= 'MPG in the city', 
       title = 'Fuel efficiency') +
  theme_minimal()

