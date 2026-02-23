# install.packages("tidyverse") 
library(tidyverse)

# load the dataset
netflix <- read.csv("Netflix_Movies_and_TV_Shows.csv")

# first 6 rows in the console
head(netflix)

# see the structure (data types of each column)
str(netflix)

# check for missing values
sum(is.na(netflix))

# count how many Movies vs TV Shows
type_counts <- table(netflix$Type)
print(type_counts)

# create a bar chart of genres
ggplot(data = netflix, aes(x = Genre, fill = Genre)) +
  geom_bar() +
  coord_flip() +  # makes it horizontal so labels are easy to read
  theme_minimal() +
  labs(title = "Content Distribution by Genre",
       x = "Genre",
       y = "Count")

# count movies vs tv shows
ggplot(netflix, aes(x = Type, fill = Type)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Distribution of Content: Movies vs TV Shows",
       y = "Total Count", x = "Type") +
  scale_fill_brewer(palette = "Set1")

# count content based on country
netflix %>%
  count(Country) %>%
  top_n(10) %>% # show top 10 countries
  ggplot(aes(x = reorder(Country, n), y = n)) +
  geom_segment(aes(x=reorder(Country, n), xend=reorder(Country, n), y=0, yend=n), color="grey") +
  geom_point(color="red", size=4) +
  coord_flip() +
  theme_minimal() +
  labs(title = "Top 10 Countries Producing Content",
       x = "Country", y = "Count")