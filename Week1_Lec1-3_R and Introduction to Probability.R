library(ggplot2)
library(ggthemes)

##Tossing a coin
coin <- c(1,0)
coin

sample(coin, size = 1)
sample(coin, size = 2)
sample(coin, size = 2, replace = TRUE)
sample(coin, size = 3, replace = TRUE)

sample_eins <- sample(coin, size = 20, replace = TRUE)

#Exercises for Week1 Lectures
#a)Can you count the number of Heads? Can you do purely with R code?
sum(sample_eins)
#Or
x = 0
for (i in 1:length(sample_eins)) {
  if (sample_eins[i] == 1) {
    x = x + 1
  }
  x
}
x

#Zwei: How many Heads do you think there should be in 20 tosses?
10



##Counting the number of Heads
tosses <- sample(coin, size = 10, replace = TRUE)
sum(tosses)

#Exercises
#Eins: Try the code again and again. What is the smallest number of Heads you 
#obtained? And the largest?
min <- 0
max <- 10



###Determining a probability
for (j in c(100, 1000, 10000, 100000, 1000000)){
  tosses <- sample(coin, size = j, replace = TRUE)
  print(sum(tosses)/j)
}

for (i in 1:7){
  tosses <- sample(coin, size = 100000, replace = TRUE)
  print(fracs <- sum(tosses[1:i])/i)
}

tosses <- sample(coin, size=1000000, replace=TRUE)

frac1 <- sum(tosses[1])/1
frac2 <- sum(tosses[1:2])/2
frac3 <- sum(tosses[1:3])/3
frac4 <- sum(tosses[1:4])/4
frac5 <- sum(tosses[1:5])/5
frac6 <- sum(tosses[1:6])/6
frac7 <- sum(tosses[1:7])/7

frac_heads <- c(frac1, frac2, frac3, frac4, frac5, frac6, frac7)

plot(frac_heads, type="b", ylim=c(0,1), xlab="Number of tosses", ylab="Fraction of Heads")

abline(h=0.5, col='red')

frac_heads_df <- data.frame(frac_heads)
ggplot(data = frac_heads_df, 
       mapping = aes(x = c(1,2,3,4,5,6,7), 
       y = frac_heads), ) + 
  geom_point() +
  geom_line() +
  geom_hline(yintercept = 0.5, col="red") +
  theme_clean() +
  labs(
    x = "Number of tosses", y = "Fraction of Heards"
  )




##Final Exercise:Let’s use R to create a virtual die and estimate the 
# probability of "getting a 6".

#a)Create a virtual die in R, just like we did with a coin. Test it out by 
#  sampling one value multiple times.
die <- c(1,2,3,4,5,6)
sample(die, size = 1)

#b)Since we are only interested in the probability of getting a 6, can you think
#  of different ways to create your virtual die to simplify this? Try it out…
prob6 <- function(size){
  tosses <- sample(die, size, replace = TRUE)
  sum6 <- 0
  for (numbers in tosses) {
    if (numbers == 6) {
      sum6 = sum6 + 1
    } else {
      sum6 = sum6 + 0
    }
  }
  probability <- sum6/size
  return(probability)
}

#c)Calculate and visualise the fraction of times your die lands on a 6 with more
#  and more throws. What value does the probability converge towards?
prob6(100000000)

#d)How would you simulate the probability of getting "a 5 or a 6"?
prob5or6 <- function(size){
  tosses <- sample(die, size, replace = TRUE)
  sum5or6 <- sum(tosses == 5 | tosses == 6)
  probability <- sum5or6/size
  return(probability)
}
prob5or6(100000000)



##mini R Exercise: Now consider the box example we used before (3R and 4B).



#1)If you randomly sample 4 balls, without replacement:

#a)what is the probability that 3 will be red? (considering red as success)
choose(3, 3) * choose(4, 1)/choose(7, 4)
dhyper(3, 3, 4, 4)

#b)what is the probability that 1 will be blue? (considering blue as success)
choose(4, 1) * choose(3, 3)/choose(7, 4)
dhyper(1, 4, 3, 4)

#c)what is the probability that no reds are left in the box? (red success)
choose(3, 3) * choose(4, 1)/choose(7, 4)
dhyper(3, 4, 3, 3)



#2)If you now sample 3 balls, without replacement:

#a)what is the probability of 3 blues? (blue success)
choose(3, 3) * choose(4, 1)/choose(7, 3)
dhyper(3, 4, 3, 3)