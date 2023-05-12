# Question2: How does the checkouts comapre between JK. Rowling and J.R.R. Tolkien?

library("dplyr")
library("stringr")
library("ggplot2")

spl_df2 <- read.csv("../../2017-2023-10-Checkouts-SPL-Data.csv")

spl_df2 <- spl_df2 %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-", "01"))

spl_df2$date <- as.Date(spl_df2$date)

spl_df2$main_author[str_detect(spl_df2$Creator, "(?i)Tolkien")] <- "J.R.R. Tolkien"
spl_df2$main_author[str_detect(spl_df2$Creator, "(?i)Rowling")] <- "J.K. Rowling"

my_types2 <- spl_df2 %>% filter(main_author == "J.R.R. Tolkien" | main_author == "J.K. Rowling")

groups2 <- my_types2 %>% group_by(date, main_author) %>% summarize(total2 = sum(Checkouts))

ggplot(data = groups2) +
  geom_line(mapping = aes(x = date, y = total2, color = main_author)) +
  labs(title = "J.R.R. Tolkien vs. J.K. Rowling: Who's more popular?", 
       x = "Year",
       y = "Checkouts") +
  guides(color = guide_legend(title = "Author"))


