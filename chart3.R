library("dplyr")
library("stringr")
library("ggplot2")

spl_df3 <- read.csv("../../2017-2023-10-Checkouts-SPL-Data.csv")

spl_df3 <- spl_df3 %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-", "01"))

spl_df3$date <- as.Date(spl_df3$date)

my_types3 <- spl_df3 %>% filter(MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "AUDIOBOOK")

group3 <- my_types3 %>% group_by(MaterialType) %>% summarize(total = sum(Checkouts))

ggplot(data = group3) +
  geom_col(mapping = aes(x = MaterialType, y = total)) +
  labs(title = "How do people like consuming literature?", 
       x = "Method of consumption",
       y = "Total checkouts") 


