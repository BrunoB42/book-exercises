# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_dly <- flights %>% group_by(dest) %>% summarise(avg_arr=mean(arr_delay,na.rm=TRUE)) %>% rename(faa=dest)
avg_delay_with_name <- avg_dly %>% left_join(airports,by="faa") %>% select(faa,avg_arr,name)
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
smallest_arr_delay_airline <- flights %>% group_by(carrier) %>% summarize(avg_arr=mean(arr_delay,na.rm=TRUE)) %>% left_join(airlines,by="carrier") %>% filter(avg_arr==min(avg_arr)) %>% select(name)

