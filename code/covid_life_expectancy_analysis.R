# Effects of COVID-19 on Male and Female Life Expectancy in Canada
# Load the World Bank Data package
library(WDI)

# Download Canadian male and female life expectancy data (2019–2024)
dat <- WDI(
  country = "CA",
  indicator = c(
    Male = "SP.DYN.LE00.MA.IN",
    Female = "SP.DYN.LE00.FE.IN"
  ),
  start = 2019,
  end = 2024
)

# Open the dataset in a spreadsheet view
View(dat)

# Display the first few rows to check that the data was imported correctly
head(dat)

# Display descriptive statistics (minimum, maximum, mean, median, etc.)
summary(dat)

# Leave extra space below the graph for the figure caption
par(mar = c(11, 4, 4, 2) + 0.1)

# Create a line graph of male life expectancy over time
plot(dat$year, dat$Male,
     type = "l",
     col = "blue",
     ylim = range(c(dat$Male, dat$Female)),
     xlab = "Year",
     ylab = "Life Expectancy (Years)",
     main = "Male and Female Life Expectancy in Canada",
     cex.main = 1.3)

# Add the female life expectancy line to the graph
lines(dat$year, dat$Female, col = "red")

# Add a legend to identify the male and female lines
legend("bottomleft",
       legend = c("Male", "Female"),
       col = c("blue", "red"),
       lty = 1)

# Add a figure caption below the graph
mtext("Figure 1. Male and female life expectancy in Canada (2019 to 2024).",
      side = 1, line = 5, adj = 0, cex = 0.8)

mtext("Life expectancy declined during the COVID-19 pandemic (2020–2022),",
      side = 1, line = 6, adj = 0, cex = 0.8)

mtext("with females consistently having higher life expectancy than males. Differences between male and",
      side = 1, line = 7, adj = 0, cex = 0.8)

mtext("female life expectancy during 2020–2022 were statistically analyzed using a Welch two-sample t-test: p < 0.001.",
      side = 1, line = 8, adj = 0, cex = 0.8)

# Select data during the COVID-19 period (2020–2022)
covid <- subset(dat, year >= 2020 & year <= 2022)

# Compare male and female life expectancy using a Welch two-sample t-test
t.test(covid$Male, covid$Female)