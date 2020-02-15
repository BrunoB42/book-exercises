# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!


# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
source("apikey.R")

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- "godfather"

# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`
# The resource is `reviews/search.json`
# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!
base_uri <- "https://api.nytimes.com/svc/movies/v2/"
endpoint <- "reviews/search.json"
query_params <- paste0("?query=",movie_name,"&api-key=",nyt_key)
uri <- paste0(base_uri,endpoint,query_params)

# Send the HTTP Request to download the data
# Extract the content and convert it from JSON
nyt_data <- fromJSON(content(GET(uri),"text"))
#passing query params through GET didn't work for some reason...

# What kind of data structure did this produce? A data frame? A list?
#This produced a list

# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.

#nyt_data$results 
#This returns the reviews of the films

# Flatten the movie reviews content into a data structure called `reviews`
reviews <- flatten(nyt_data$results)

# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables
headline <- reviews$headline[1]
short_summary <- reviews$summary_short[1]
link <- reviews$link.url[1]

# Create a list of the three pieces of information from above. 
# Print out the list.
movie_data_list <- list("Headline"=headline,"Short Summary"=short_summary,"Link"=link)
print(movie_data_list)
