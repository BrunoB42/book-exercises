# Exercise 2: advanced ggplot2 practice

# Install and load the `ggplot2` package
#install.packages('ggplot2')
library("ggplot2")

# For this exercise you will again be working with the `diamonds` data set.
# Use `?diamonds` to review details about this data set
?diamonds

## Position Adjustments

# Draw a column (bar) chart of diamonds cuts by price, with each bar filled by 
# clarity. You should see a _stacked_ bar chart.
ggplot(data = diamonds, mapping = aes(x=cut,y=price,fill=clarity)) +
  geom_col()

# Draw the same chart again, but with each element positioned to "fill" the y axis
ggplot(data = diamonds, mapping = aes(x=cut,y=price,fill=clarity)) +
  geom_col(position="fill")

# Draw the same chart again, but with each element positioned to "dodge" each other
ggplot(data = diamonds, mapping = aes(x=cut,y=price,fill=clarity)) +
  geom_col(position="dodge")

# Draw a plot with point geometry with the x-position mapped to `cut` and the 
# y-position mapped to `clarity`
# This creates a "grid" grouping the points
ggplot(data = diamonds, mapping = aes(x=cut,y=clarity)) +
  geom_point()

# Use the "jitter" position adjustment to keep the points from all overlapping!
# (This works a little better with a sample of diamond data, such as from the 
# previous exercise).
ggplot(data = diamonds, mapping = aes(x=cut,y=clarity)) +
  geom_point(position="jitter")


## Scales

# Draw a "boxplot" (with `geom_boxplot`) for the diamond's price (y) by color (x)
ggplot(data = diamonds, mapping = aes(x=color,y=price)) +
  geom_boxplot()

# This has a lot of outliers, making it harder to read. To fix this, draw the 
# same plot but with a _logarithmic_ scale for the y axis.
ggplot(data = diamonds, mapping = aes(x=color,y=price)) +
  geom_boxplot() +
  scale_y_log10()

# For another version, draw the same plot but with `violin` geometry instead of 
# `boxplot` geometry!
# How does the logarithmic scale change the data presentation?
ggplot(data = diamonds, mapping = aes(x=color,y=price)) +
  geom_violin() +
  scale_y_log10()
#The log scale makes the violin shapes more round and more evenly wide

# Another interesting plot: draw a plot of the diamonds price (y) by carat (x), 
# using a heatmap of 2d bins (geom_bin2d)
# What happens when you make the x and y channels scale logarithmically?
ggplot(data = diamonds, mapping = aes(x=carat,y=price)) +
  geom_bin2d() +
  scale_x_log10() +
  scale_y_log10()
#After log scaling, the plot is roughly linear.

# Draw a scatter plot for the diamonds price (y) by carat (x). Color each point
# by the clarity (Remember, this will take a while. Use a sample of the diamonds 
# for faster results)
ggplot(data = diamonds, mapping = aes(x=carat,y=price,color=clarity)) +
  geom_point()

# Change the color of the previous plot using a ColorBrewer scale of your choice. 
# What looks nice?
ggplot(data = diamonds, mapping = aes(x=carat,y=price,color=clarity)) +
  geom_point() + 
  scale_color_brewer(palette = "Purples")
#palette "Purples" looks quite nice

## Coordinate Systems

# Draw a bar chart with x-position and fill color BOTH mapped to cut
# For best results, SET the `width` of the geometry to be 1 (fill plot, no space
# between)
# TIP: You can save the plot to a variable for easier modifications
double_cut <- ggplot(data = diamonds, mapping = aes(x=cut,fill=cut)) +
  geom_bar()

# Draw the same chart, but with the coordinate system flipped
double_cut + coord_flip()

# Draw the same chart, but in a polar coordinate system. It's a Coxcomb chart!
double_cut + coord_polar()


## Facets

# Take the scatter plot of price by carat data (colored by clarity) and add 
# _facets_ based on the diamond's `color`
ggplot(data = diamonds, mapping = aes(x=carat,y=price,color=clarity)) +
  geom_point() +
  facet_wrap(~color)


## Saving Plots

# Use the `ggsave()` function to save the current (recent) plot to disk.
# Name the output file "my-plot.png".
# Make sure you've set the working directory!!
ggsave(filename = "my-plot.png")

