getwd()
moviedata <- read.csv(file.choose())
str(moviedata)

moviedata$Film <- factor(moviedata$Film)
moviedata$Genre <- factor(moviedata$Genre)
moviedata$Year.of.release <- factor(moviedata$Year.of.release)

colnames(moviedata) <- c('Film','Genre','CriticalRating','AudienceRating',
                         'BudgetMillion','ReleaseYear')

ggplot(data = moviedata, aes(x = CriticalRating, y = AudienceRating, 
                             color = Genre, pch = ReleaseYear, 
                             alpha=I(0.6))) +
  geom_point()

#overriding aesthetics with layers
ggplot(data = moviedata, aes(x = CriticalRating, y = AudienceRating, 
                             color = Genre, alpha=I(0.6))) +
  geom_point(aes(color = BudgetMillion, size=I(2)))


#transforming plot into an object
movieplot <- ggplot(data = moviedata, aes(x = CriticalRating, y = AudienceRating, 
                             color = Genre, alpha=I(0.6)))

#overriding data either in x or y, or maybe both
movieplot + geom_point(aes(x = BudgetMillion, size = BudgetMillion))

#giving correct name for overridden data
movieplot + geom_point(aes(x = BudgetMillion, size = BudgetMillion)) +
  xlab('Budget in Million')

#setting size without aes() for geom_line()
movieplot + geom_line(size=1) + geom_point(size=2)

#--------------------------------------------------
# MAPPING vs SETTING

q <- ggplot(data = moviedata, aes(x = CriticalRating, 
            y = AudienceRating))

# add color

# 1. use MAPPING
q + geom_point(aes(colour=Genre))

# 2. use SETTING
q + geom_point(color='Green')

#these are the diffences between MAPPING and SETTING

q + geom_point(aes(size = BudgetMillion))

q + geom_point(size = 3)

q + geom_point(aes(size = BudgetMillion, color ='Red'))

q + geom_point(size = 2, aes(size = BudgetMillion))

# if we want to set something don't use aes()
# if we want to map something use aes()


# Histogram and Density Charts

# histogram
r <- ggplot(moviedata, aes(x = BudgetMillion))
r + geom_histogram(binwidth = 10, color = 'black',
                   aes(fill = Genre))

# density chart
r + geom_density(aes(fill = Genre), color = 'yellow', position = 'stack')


# geom smooth
s <- ggplot(moviedata, aes(x = CriticalRating,
                           y = AudienceRating,
                           color = Genre))
s + geom_point(alpha = 0.5) + geom_smooth(fill = NA)

# boxplot
t <- ggplot(moviedata, aes(x = Genre, y = AudienceRating,
                           color = Genre))
t + geom_boxplot(color = 'black', aes(fill = Genre))

t + geom_boxplot() + geom_jitter()

u <- ggplot(moviedata, aes(x = Genre, y = CriticalRating,
                           color = Genre))

u + geom_boxplot() + geom_jitter()

#using facets
v <- ggplot(data = moviedata, aes(x = BudgetMillion))

v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   color = 'black') +
  facet_grid(Genre~., scales = 'free')

w <- ggplot(moviedata, aes(x = CriticalRating,
                           y = AudienceRating,
                           color = Genre))

w + geom_point() + facet_grid(Genre~.)

w + geom_point() + facet_grid(~ReleaseYear)

w + geom_point() + facet_grid(Genre~ReleaseYear)

w + geom_point() + facet_grid(Genre~ReleaseYear) +
  geom_smooth(color = 'black', fill = NA)

w + geom_point() + geom_smooth(color = 'black', fill = NA) +
  facet_grid(Genre~ReleaseYear)
  
# how to zoom graphic

m <- ggplot(data = moviedata, aes(x=AudienceRating, y=BudgetMillion,
                                  color = Genre))
m + geom_point() + geom_smooth(fill=NA) + 
  coord_cartesian(ylim = c(25,100), xlim = c(50,90))

# use theme

m + geom_point() + xlab('Rating by Audience') +
  ylab('Budget Spent')

m + geom_point() + xlab('Rating by Audience') +
  ylab('Budget Spent') +
  theme(axis.title.x = element_text(hjust = 0,
                                    color = 'Green'),
        axis.title.y = element_text(hjust = 0,
                                    color = 'red'),
        axis.text.x = element_text(color = 'darkblue'),
        axis.text.y = element_text(color = "darkgreen"),
        axis.ticks.x = element_line(color = 'green'),
        axis.ticks.y = element_line(color = 'red'),
        axis.line.x = element_line(size = 1, color = 'blue'),
        axis.line.y = element_line(size = 1, color = 'red'),
        panel.border = element_rect(size = 2, color = 'yellow',
                                    fill = NA),
        panel.background = element_rect(fill = 'white'),
        panel.grid.major.x = element_line(color = 'red'),
        panel.grid.major.y = element_line(color = 'cyan'),
        panel.grid.minor = element_line(color = 'blue'),
        legend.position = c(0,1),
        legend.justification = c(0,1),
        legend.background = element_rect(fill = NA),
        legend.key = element_rect(fill = NA),
        legend.direction = 'horizontal')

