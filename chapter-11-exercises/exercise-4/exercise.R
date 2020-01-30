# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")
library("nycflights13")

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights) #336776 rows
ncol(flights) #19 columns

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights <- mutate(flights,in_air_delay=arr_delay-dep_delay)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights <- arrange(flights,-in_air_delay)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
flights <- mutate(flights,in_air_delay=arr_delay-dep_delay)

# Make a histogram of the amount of time gained using the `hist()` function
hist(pull(flights,in_air_delay))

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
summarize(flights,avg=mean(in_air_delay,na.rm=TRUE))
#Flights on average lost 5.66 minutes in the air

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
sea_flights <- select(filter(flights,dest=="SEA"),origin,dest,in_air_delay)

# On average, did flights to SeaTac gain or loose time?
summarize(sea_flights,avg=mean(in_air_delay,na.rm=TRUE))
#On average, Seattle flights lost 11.7 min in the air.

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!

filter(flights,origin=="JFK",dest=="SEA") %>% summarize(avg=mean(in_air_delay,na.rm=TRUE),min=min(in_air_delay,na.rm=TRUE),max=max(in_air_delay,na.rm=TRUE))
#avg: -10.4 min, min: -71 min, max: 125 min
