

x <- 5

y <- 2/3

x * y


z <- c(2, 3, 5, 2, 4, 3, 1)

mean(z)

# install and load packages

install.packages("tidyverse") #only needs to be done once
library(tidyverse) #needs to be done every time you open R


# upload data

dat <- read.csv("religion.csv") #make sure your working directory is set to where your file is stored. Otherwise, use full path

dat

summary(dat)

head(dat) #default shows first 6 lines. Can ask for more lines specifying the number in the next argument (see below)
head(dat, 10) #gives first 10 rows


# data wrangling

dat2 <- dat %>% 
  mutate(inCreds = insecurity * CREDs,
         lowCreds = ifelse(test = CREDs < 0, yes = 1, no = 0),
         lowBelief = ifelse(belief < 0, "heathens", "devout")) %>%
  select(inCreds, lowCreds, lowBelief)
  
heathens <- dat2 %>%
  filter(lowBelief == "heathens")

nrow(dat)
nrow(dat2)
nrow(heathens)

dat.long <- dat %>%
  pivot_longer(insecurity:reflection, values_to = "scores", names_to = "measure")

# graphs

ggplot(dat, aes(x = CREDs, y = belief, size = reflection)) +
  geom_point(position = "jitter", alpha = .3) +
  geom_
  stat_smooth(method = loess, se = F) +
  theme_bw()

ggplot(dat2, aes(x = inCreds, fill = lowBelief)) +
  geom_density(adjust = 2, alpha = .2) +
  theme_bw()

