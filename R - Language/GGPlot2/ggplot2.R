# installing package
#install.packages(C("dplyr", "ggplot2"))

# Loading Libraries
library("ggplot2")
library("dplyr")

# Loading Dataset in dataframe
df <- read.csv("dataset/titanic.csv", stringsAsFactors = FALSE)
View(df)

# setting up factors
df$Pclass <- as.factor(df$Pclass)
df$Survived <- as.factor(df$Survived)
df$Sex <- as.factor(df$Sex)
df$Embarked <- as.factor(df$Embarked)

# visual analysis of the data focusing on questions related to survival rates.
# EX: Categorical


### Bar Chart ###

# Survival Rate using Bar Chart
ggplot(df, aes(x=Survived)) + 
  geom_bar()
# Saving as png
ggsave("images/01_SurvivalRate_barchart.png", dpi=300, width=4, height=4)

# data in percentage
prop.table(table(df$Survived))

# adding customization to bar chart
ggplot(df, aes(x=Survived)) + 
  theme_minimal() +
  geom_bar(color="steelblue", fill="steelblue") +
  labs(y = "Passenger Count", title = "Titanic Survival Rates")
# Saving as png
ggsave("images/02_SurvivalRate_Customized_barchart.png", dpi=300, width=4, height=4)

# Survival Rate By Gender using Bar Chart
ggplot(df, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  geom_bar(color="lightgreen", fill="lightgreen") +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Sex")
# Saving as png
ggsave("images/03_SurvivalRateByGender_barchart.png", dpi=300, width=4, height=4)

# Survival Rate by Class of Ticket
ggplot(df, aes(x = Pclass, fill = Survived)) + 
  theme_light() +
  geom_bar(color="lightblue", fill="lightblue") +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass")
# Saving as png
ggsave("images/04_SurvivalRateByClassOfTicket_barchart.png", dpi=300, width=4, height=4)

# Survival Rate by Class of Ticket and by Gender
# adding facets
ggplot(df, aes(x = Sex, fill = Survived)) + 
  theme_replace() +
  facet_wrap(~ Pclass) +
  geom_bar(color="magenta", fill="magenta") +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass and Sex")
# Saving as png
ggsave("images/05_SurvivalRateByClassOfTicket&ByGender_barchart.png", dpi=300, width=4, height=4)


# visualizing continuous data using ggplot2
# EX: Numerical

### Histogram ###

# distribution of passenger ages
ggplot(df, aes(x = Age)) +
  theme_update() +
  geom_histogram(binwidth = 5, color="orange", fill="orange") +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion")
# Saving as png
ggsave("images/06_DistributionOfPassengerAges_histogram.png", dpi=300, width=4, height=4)


# survival rates by age
ggplot(df, aes(x = Age, fill = Survived)) +
  theme_get() +
  geom_histogram(binwidth = 5, color="chartreuse", fill="chartreuse") +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Survival Rates by Age")
# Saving as png
ggsave("images/07_SurvivalRateByAge_histogram.png", dpi=300, width=4, height=4)

#survival rates by age when segmented by gender and class of ticket
ggplot(df, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")
ggsave("images/08_SurvivalRateByAge_SegmentedByGender&ClassOfTicket_histogram.png", dpi=300, width=4, height=4)

### Box Plot ###

# survival rates by age
ggplot(df, aes(x = Survived, y = Age)) +
  theme_gray() +
  geom_boxplot(color="goldenrod3", fill="goldenrod3") +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age")
# Saving as png
ggsave("images/09_SurvivalRateByAge_boxplot.png", dpi=300, width=4, height=4)

### Density Plot ###

#survival rates by age when segmented by gender and class of ticket
ggplot(df, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_density(alpha = 0.5, color="chocolate", fill="chocolate") +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")
# Saving as png
ggsave("images/10_SurvivalRateByAge_SegmentedByGender&ClassOfTicket_densityplot.png", dpi=300, width=4, height=4)