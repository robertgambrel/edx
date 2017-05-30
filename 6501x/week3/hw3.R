pacman::p_load(dplyr, readr, purrr, outliers, ggplot2, lubridate, tidyr, stats, smooth)

temps <- read_tsv('T:\\Clients\\WIP\\EJGH\\Data Science Team\\RG\\trainings\\temps.txt')

temps_sorted <- temps %>%
	gather(year, high_temp, 2:21) %>%
	group_by(year) %>%
	mutate(rn = 1:n()) %>%
	ungroup() %>%	
	arrange(year, rn) %>%
	select(high_temp)

series <- ts(temps_sorted$high_temp, frequency = 123)

temps_long <- temps %>%
	gather(year, high_temp, 2:21) %>%
	group_by(year) %>%
	mutate(rn = 1:n())

yearly <- temps_long %>%
	filter(year == 1996)

data_ts <- as.ts(temps[2:21], deltat = 1/123)

m <- HoltWinters(x = series, seasonal = 'mult', beta = F)
m <- es(series, model = "AAM")
plot(m)
plot(fitted(m))
