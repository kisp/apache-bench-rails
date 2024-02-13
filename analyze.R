######################################################################
###                          import data                           ###
######################################################################

url1_full_exp1 <- read.table("url1-full-exp1.csv", header = TRUE, sep = "\t")
url1_turbo_frame_exp1 <- read.table("url1-turbo-frame-exp1.csv", header = TRUE, sep = "\t")
url2_full_exp1 <- read.table("url2-full-exp1.csv", header = TRUE, sep = "\t")
url2_turbo_frame_exp1 <- read.table("url2-turbo-frame-exp1.csv", header = TRUE, sep = "\t")

url1_full_exp1$group <- "url1_full_exp1"
url1_turbo_frame_exp1$group <- "url1_turbo_frame_exp1"
url2_full_exp1$group <- "url2_full_exp1"
url2_turbo_frame_exp1$group <- "url2_turbo_frame_exp1"

# Combine the data from all four groups into a single data frame
d <- rbind(url1_full_exp1, url1_turbo_frame_exp1, url2_full_exp1, url2_turbo_frame_exp1)
d$group <- factor(d$group, labels = c("us/full", "us/partial", "eu/full", "eu/partial"))

######################################################################
###                        remove outliers                         ###
######################################################################

d <- d[d$ttime <= quantile(d$ttime, .99),]

######################################################################
###                            boxplot                             ###
######################################################################

# png("Rplots.png", width = 800, height = 600)

# Create a boxplot to compare the performance of the four groups
boxplot(ttime ~ group, data = d, main = "Comparison of Response Time by Group",
        xlab = "Group", ylab = "Response Time (milliseconds)", log = "y")

# dev.off()
