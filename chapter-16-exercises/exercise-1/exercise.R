# Exercise 1: ggplot2 basics

# Install and load the `ggplot2` package
# You will also want to load `dplyr`
library('ggplot2')
library('dplyr')

# For this exercise you'll be working with the `diamonds` data set included in 
# the ggplot2 library
# Use `?diamonds` to get more information about this data set (including the 
# column descriptions. Also check the _column names_ and the _number of rows_ 
# in the data set
?diamonds
colnames(diamonds)
nrow(diamonds)

# This data set has A LOT of rows. To make things a bit more readable, 
# use dplyr's `sample_n()` function to get a random 1000 rows from the data set
# Store this sample in a variable `diamonds_sample`
diamonds_sample <- sample_n(diamonds,1000)

# Start by making a new `ggplot` with the `diamonds_sample` as the data (no 
# geometry yet)
# What do you see? (What did you expect?)
ggplot(data = diamonds_sample)
#Nothing appeared (which is expected since no geoms were defined)

# Draw a scatter plot (with point geometry) with for the `diamonds_sample` set, 
# with the `carat` mapped to the x-position and `price` mapped to the y-position.
ggplot(data = diamonds_sample,mapping = aes(x=carat, y=price)) +
  geom_point()

# Draw the same plot as above, but color each of the points based on their 
# clarity.
ggplot(data = diamonds_sample,mapping = aes(x=carat, y=price, colour=clarity)) +
  geom_point()
  

# Draw the same plot as above, but for the entire `diamonds` data set. Note this
# may take a few seconds to generate.
ggplot(data = diamonds,mapping = aes(x=carat, y=price, colour=clarity)) +
  geom_point()

# Draw another scatter plot for `diamonds_sample` of price (y) by carat (x),
# but with all of the dots colored "blue".
# Hint: you'll need to set the color channel, not map a value to it!
ggplot(data = diamonds_sample,mapping = aes(x=carat, y=price)) +
  geom_point(color="blue")

# Draw a scatter plot for `diamonds_sample` of `price` by `carat`, where each
# point has an aesthetic _shape_ based on the diamond's `cut`.
ggplot(data = diamonds_sample,mapping = aes(x=carat, y=price, shape=cut)) +
  geom_point()

# Draw a scatter plot for `diamonds_sample` of *`cut`* by `carat`, where each
# point has an aesthetic _size_ based on the diamond's *`price`*
ggplot(data = diamonds_sample,mapping = aes(x=cut, y=carat, size=price)) +
  geom_point()

# Try coloring the above plot based on the diamond's price!
ggplot(data = diamonds_sample,mapping = aes(x=cut, y=carat, size=price, color=price)) +
  geom_point()

# Draw a line plot (with line geometry) for `diamonds_sample`. The x-position 
# should be mapped to carat, y-position to price, and color to cut.
ggplot(data = diamonds_sample,mapping = aes(x=carat, y=price, color=cut)) +
  geom_line()

# That's kind of messy. Try using `smooth` geometry instead.
ggplot(data = diamonds_sample,mapping = aes(x=carat, y=price, color=cut)) +
  geom_smooth()

# Draw a plot with column geometry (a bar chart), mapping the diamond's `cut` to 
# the x-axis and `price` to the y-axis. Note that by default, column geometry 
# will us the "sum" of all of the y-values, so that the chart is actually of the
# TOTAL value of all of the diamonds of that cut!
ggplot(data = diamonds_sample,mapping = aes(x=cut, y=price)) +
  geom_col

# Add an aesthetic property that will _fill_ each bar geometry based on the 
# `clarity` of the diamonds. 
# What kind of chart do you get?
ggplot(data = diamonds_sample,mapping = aes(x=cut, y=price,fill=clarity)) +
  geom_col()
#We get a stacked bar graph out of this

# Draw a plot of the `diamonds_sample` data (price by carat), with both points 
# for each diamond AND smoothed lines for each cut (hint: in a separate color)
# Give the points an `alpha` (transparency) of 0.3 to make the plot look nicer
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x=price, y=carat),alpha=0.3) +
  geom_smooth(mapping = aes(x=price, y=carat, color=cut))
  

## Bonus
# Draw a column chart of average diamond prices by clarity, and include 
# "error bars" marking the standard error of each measurement.
#
# You can calculate standard error as the _standard deviation_ divided by the 
# square root of the number of measurements (prices)

# Start by creating a data frame `clarity_summary` that includes summarized data 
# for each clarity group. Your summary data should include the mean price and the
# standard error of the price.


# Then draw the plot. The error bars should stretch from the mean-error to the 
# mean+error.

