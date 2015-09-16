counts_raw <- read.delim("data/counts-raw.txt.gz") #dataframe
ls() #list the contents in the R session
dim(counts_raw)
head(counts_raw)
tail(counts_raw)
#how to look at an individual cell
counts_raw[1, 10] #first row in 10th column
#how to look at a group of cells
counts_raw[1:3, 10:12]
#first three rows, all columns
counts_raw[1:3, ]
#10 rows of a specific column
counts_raw[1:10, "pmid"]
#get info on structure of df column
str(counts_raw$daysSincePublished)
> int [1:24331] 2628 2593 2593 2628 2684 2684 2684 2628 2628 2628 ...
#tells us this column contains integers, the dimensions and the values
#R likes to think in vectors
head(counts_raw$daysSincePublished / 7) #we can divide the values by 7 to get weeks
#works because vectors, it will use the first value of the original vector and 
#divide by the integer dividend we gave it, if there was more than one value in the dividend it would switch off
#to ask for info on type of data
is.numeric(counts_raw$daysSincePublished)
#factors handle specific types of things
str(counts_raw$journal)
> Factor w/ 7 levels "pbio","pcbi",..: 1 1 1 1 1 1 1 1 1 1 ...
levels(counts_raw$journal) #just reports the levels in that factor
#important to remember that R likes to store strings as factors more efficient
#sometimes you will want to change all factors to strings
counts_raw$authorsCount[1:10]
is.na(counts_raw$authorsCount[1:10])
anyNA(counts_raw$authorsCount[1:10])
summary(counts_raw$wosCountThru2011)
mean(counts_raw$wosCountThru2011)
hist(sqrt(counts_raw$wosCountThru2011))
plot(counts_raw$daysSincePublished, counts_raw$wosCountThru2011)
#asking R logical questions about our data
dim(counts_raw[counts_raw$journal == "pone", ])
#complex statement where you count all the cases journal = plos one
dim(counts_raw[counts_raw$journal != "pone", ]) 
#ones not in plos one
dim(counts_raw[counts_raw$journal %in% c("pone", "pbio", "pgen"), ])
#asks for the count of journals in any of the three sources
dim(counts_raw[grepl("Immunology", counts_raw$plosSubjectTags), ])
#will count true or false for lines that have Immunology in the Subject tag
#grep will report the lines, grepl will report true or false
________________
if (anyNA(counts_raw$authorsCount)) {
        print("there are NAs")
} else {
        print("No NAs")
}

for (i in 1:10) {
        print(i)
}

for (i in c("cat", "dog", "mouse")){
        print(i)
}

#deomonstrating how slow loops are in R
for (i in 1:length(counts_raw$wosCountThru2011)){
        x <- c(x, counts_raw$wosCountThru2011 +1)
}
#each time it will save the variable +1 and then concatenate the new value to the list

#loop to calculate mean for each journal etc
levels(counts_raw$journal)
results <- numeric(length=length(levels(counts_raw$journal)))
names(results) <- levels(counts_raw$journal) #sets the names of levels to the results list
for (j in levels(counts_raw$journal)){
        results[j] <- mean(counts_raw$wosCountThru2011[counts_raw$journal == j])
}
#will calculate the mean by journal type

________________
#afternoon session, now using dplyr in Rmarkdown
#then using ggplot2
