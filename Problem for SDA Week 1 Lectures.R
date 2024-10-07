#1)If we roll two dice (one white, one black):

#a)How many different combinations are possible?
6 * 6

#b)What is the probability of getting two sixes?
1/6 * 1/6

#c)What is the probability of getting a two and a three?
1/36*2

#d)If we are interested in the sum of the numbers we get on the two dice, what
#  sum has the highest probability?
highestp <- 7



#2)Your genome is composed of 4 nucleotides: A, C, G, T. Let’s assume that each
#  of them is equally frequent. What is the probability that, at one particular
#  position of the genome, you find 3 bases in a row that are

#a)Exactly A T A?
(1/4)^3

#b)Any combination of A and T (without any C or G)?
(1/2)^3

#c)What assumptions did you need to make? How realistic do you think they are?
answer <- "Each nucleotide has equal probability (1/4) and each nucleotide in
           the genome is independent of all the others. In reality the human
           genome has around 59% A or T, and 41% C or G. It is also not the case
           that nucleotides are independent, and this also varies by location."



#3)In a certain city there are 3 males for every 2 females. Only 1/3 of the
#  males go to University, while for females, the proportion is 1/2.

#a)What proportion of the population go to University?
(1/2 * 2/5) + (1/3 * 3/5)

#b)Of those that go to University, what is the proportion of females?
(1/2 * 2/5) / (2/5)



#4)In cattle, the allele A1 is dominant and gives black coat colour. The A2
#  allele is recesive and gives a red coat. This means that calves with genotype
#  A1A1 or A1A2 are black, and only those with genotype A2A2 are red. The
#  heterozygous animals (A1A2) are black but since they carry a copy of the A2
#  allele, some of their offspring could be red.

#a)When crossing two heterozygous animals, what is the probability that one of
#  their offspring will be red?
1/2 * 1/2

#b)If two heterozygous animals have three offspring, what is the most probable
#  number of red calves?
dbinom(0:3, size = 3, prob = 1/4)



#5)A bag contains 3 red and 2 blue marbles. A random sample of two marbles is
#  taken from the bag, without replacement. What is the probability that

#a)Both are red?
3/5 * 2/4

#b)There is one of each colour?
(2/5 * 3/4) + (3/5 * 2/4)

#c)What are the answers if the balls are sampled with replacement?
3/5 * 3/5
(2/5 * 3/5) + (3/5 * 2/5)
