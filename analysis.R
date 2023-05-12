library(dplyr)

itemset <- read.csv("../../2017-2023-10-Checkouts-SPL-Data.csv")
# Which year had the most checkouts?
most_checkouts <- itemset %>% group_by(CheckoutYear) %>% summarize(total = sum(Checkouts)) %>% 
  filter(total == max(total))
most_year <- most_checkouts %>% pull(CheckoutYear)
most_checkouts_figure <- most_checkouts %>% pull(total)
# Which material type (books, movies, ebooks, etc.) got checked out the most?
type <- itemset %>% group_by(MaterialType) %>% summarize(total = sum(Checkouts)) %>% 
  filter(total == max(total))
most_type <- type %>% pull(MaterialType)
number_type <- type %>% pull(total)
# Which specific item had the most checkouts between 2017 and 2023?
item_type <- itemset %>% group_by(Title) %>% summarize(total = sum(Checkouts)) %>% 
  filter(total == max(total))
most_item <- item_type %>% pull(Title)
item_most_num <- item_type %>% pull(total)
# Which month sees the most checkouts?
month_type <- itemset %>% group_by(CheckoutMonth) %>% summarize(avg_checkout = mean(Checkouts)) %>% 
  filter(avg_checkout == max(avg_checkout))
month_most <- month_type %>% pull(CheckoutMonth)
month_num_most <- month_type %>% pull(avg_checkout)
# What is largest amount of checkouts for one item in one month?
most_item_checkout <- itemset %>% filter(Checkouts == max(Checkouts))
item_most <- most_item_checkout %>% pull(Title)
item_most_num <- most_item_checkout %>% pull(Checkouts)