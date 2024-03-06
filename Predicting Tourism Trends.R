# Load libraries
library(tidyverse)

# Load tourism data
tourism <- read.csv('https://raw.githubusercontent.com/jbryer/DATA606Fall2018/master/data/os3_data/Ch%207%20Exercise%20Data/tourism.csv')

# Print first few rows of the data
head(tourism)

# Create scatter plot with linear regression line
ggplot(data = tourism, aes(x = visitor_count_tho, y = tourist_spending)) +
  geom_point() + # Scatter plot
  geom_smooth(method = "lm", se = FALSE, color = "blue") + # Linear regression line
  labs(title = "Tourism Spending vs. Number of Visitors",
       x = "Number of Visitors (in thousands)",
       y = "Tourist Spending (in million $)") +
  theme_minimal()

# Fit linear regression model
model <- lm(tourist_spending ~ visitor_count_tho, data = tourism)

# Print summary of the model
summary(model)

# Predict future tourist spending
visitor_counts <- c(10, 15, 20) # Example visitor counts
predicted_spending <- predict(model, data.frame(visitor_count_tho = visitor_counts))

# Print predicted spending
print(predicted_spending)