library(Hmisc)

data <- read.csv("C:/Users/Usuario/Downloads/COVID19_line_list_data.csv")
describe(data)

data$death_dummy <- as.integer(data$death != 0)

sum(data$death_dummy) / nrow(data)

dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)

men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%!
mean(women$death_dummy, na.rm = TRUE) #3.7%
# is this statistically significant?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
