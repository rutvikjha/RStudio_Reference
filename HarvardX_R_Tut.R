##HarvardX R Studio Tutorial

##Help
?ls
help(ls)

##Accessing the Dataset
library(dslabs) ##Access the package with the Dataset
data("murders") ##Bring Data Frame to the workspace
class(murders) ##Returns type of variable passed in
head(murders) ##Returns the first part of the Data Frame to show all types and some examples
str(murders) ##Returns the structure of the object passed in
murders$population ##Returns all values under the 'population' column in a numeric vector
murders[["population"]] ##Same as $ accessor
murders["population"] ##Returns the elements of column 'population' in a data.frame
class(names(murders)) ##Returns columns of murders in a String vector

##Creating vectors
codes <- c(112, 541, 124) ##c is used to concate values into a vector
codes2 <- c(USA = 112, Canada = 154, Mexico = 124) ##Names can be attached to the values of a numeric vector
names(codes2)
names(codes) <- nombre ##This attaches the character vector nombre as names to the elements in numeric vector codes
seq(1,10,2) ##Returns a numeric vector of values from 1 to 10, inclusive, in 2 increments
1:10 ##Short-hand for seq(); Returns values from 1 to 10 inclusive
seq(1, 10, length.out = 100) ##Returns a numeric vector with 100 elements equally spaced between 1 and 10, inclusive.
codes2[1:3] ##Returns values from 1 to 3 inclusive
codes2["USA"] ##Values can be called by their names as well
codes2[c("USA", "Canada")] ##Character vectors of names can be used to call their respective values

##Vector Coercision
x <- c(1, "world", 3) ##x will become a character vector
y <- c(1, 2, 3)
as.character(y) ##Returns y converted into a character vector
z <- c("1", "f", 3)
as.numeric(z) ##Returns a numeric vector with the 2nd element being NA since R does not know how to convert b to numeric

##Vector Sorting
x <- c(31, 4, 52, 67, 12)
sort(x) ##Returns a numeric vector with the values of vector x arranged in increasing orders
order(x) ##Returns a numeric vector of the indeces corresponding to the x values sorted in increasing order
v <- rank(x) ##Returns a numeric vector of values from 1 to the length of x, inclusive.
##Each index corresponds to the value in x of the same index. Each value is given a rank based on their size relative to the other values.
##Value one corresponding to the smallest value. Ex: 31 has the 3rd largest value so. v[1] = 3.
max(x) ##Returns the highest value of numeric vector x
which.max(x) ##Returns the index of the highest value of numeric vector x // Works for min as well

##Vector Arithmetic
x * 2 ##Returns a numeric vector where every element is multiplied by 2
x - 2 ##Returns a numeric vector where every element is subtracted by 2
f <- c(1.2, 4.1, 2, 3.1, 6)
x * f ##Returns a numeric vector where every element in x is multiplied by every corresponding element in f. (Same size numeric vectors)
##Works for all other arithmetic operators + - /.
murder_rate <- (murders$total/murders$population) * 1000
murders$state[order(murder_rate, decreasing = TRUE)]

##Indexing Vectors with Logical Operators
x <- c(1:12)
index <- x >= 5 ##Returns a logical vector. Compares every element in x with >- 5. Stores result for each element in index.
sum(index) ##index is converted into numeric vector where T is 1 and F is 0. The numeric vector is then summed.
index1 <- x >= 7
index & index1 ##Logical operator applied between corresponding elements. Returns a logical vector.

##Subsetting datasets
z <- c(TRUE, FALSE, TRUE)
y <- (6:12)
which(z) ##Returns a numeric vector listing the indecies of the TRUE elements.
match(y,x) ##Returns a numeric vector of the location of each element of y in x.
y %in% x ##Returns a logical vector that states whether an element in y exists in x.

##Modifying Data Frames
murders <- mutate(murders, rate = (total/population)*100000)
##mutate returns a DataFrame with rate being a new column to murder. total and population are columns in murder but
##do not need murders$ to access them.
filter(murders, rate <= 0.71) ##Returns a Data Frame where rows that do not fit the criteria in the 2nd arg are filtered out.
new_table <- select(murders, state, region, rate) ##Returns a DataFrame containing only the state, region, and rate columns are selected.
murders %>% select(state, region, rate) %>% filter(rate <= 0.71) ##The pipe method subsetts the murders Data Frame with multiple phases of subsetting.
##First it selects three columns and then filters out rows that do not meat the criteria.

##Creating Data Frames
new_graph <- data.frame(names = c("Akash", "Sharwin", "Sharlose", "Alash"),
                        rank = c(3, 2, 1, 4),
                        bool = c(TRUE, TRUE, FALSE, FALSE),
                        stringsAsFactors = FALSE) ##W/o this statement the character vector names becomes a factor vector

##Data Visualization
population_in_million <- murders$population/10^6
population_total <- murders$total
plot(population_in_million, population_total)
hist(population_total)
boxplot(murders$region, data = murders)

##Conditionals
a <- c(1, 3, -2, NA, 4, -6)
a <- ifelse(is.na(a), 0, a) ##is.na() yeilds a logical vector when a vector is inputted. The result numeric vector contains 0 at the indeces where TRUE is located in is.na(a).
##Additionally, the result numeric vector retains the elements of a in the corresponding indeces of fALSE in the is.na(a) logical vector.
b <- c(TRUE, TRUE, FALSE)
any(b) ##Returns TRUE if any values in the inputted logical vector are TRUE.
all(b) ##Returns TRUE if all values in the inputted logical vector are TRUE.

##Creating functions
average <- function(x) {
  sum <- sum(x)
  length <- length(x)
  sum/length ##Returns the last line
}

##For Loops
m <- vector(length = 10) ##Creates an empty vector of length 10
for(i in 1:10){ ##Variable i iterates from 1 to 10
  m[i] = i
}
i ##After the loop executes when i is called it returns 10
