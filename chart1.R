
# Question: How do checkout numbers compare between Material types (books, movies, ebooks)?

library("dplyr")
library("stringr")
library("ggplot2")

spl_df <- read.csv("../../2017-2023-10-Checkouts-SPL-Data.csv") 

spl_df <- spl_df %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-", "01"))

spl_df$date <- as.Date(spl_df$date)

my_types <- spl_df %>% filter(MaterialType == "BOOK"  | MaterialType == "EBOOK" | MaterialType == "AUDIOBOOK" | MaterialType == "VIDEODISC")

groups <- my_types %>% group_by(date, MaterialType) %>% summarize(total = sum(Checkouts))

ggplot(data = groups) +
  geom_line(mapping = aes(x = date, y = total, color = MaterialType)) +
  labs(title = "Number of Checkouts for each item type from 2017 to 2023", 
       x = "Year",
       y = "Checkouts") +
  guides(color = guide_legend(title = "Type of item checked out"))
  

