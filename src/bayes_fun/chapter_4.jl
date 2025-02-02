import Distributions as distmod

begin # Problem 2
    #=
        If there are aways 4 aces, then there is 4xC5,1 ways to choose one of the 5 pulls to get an ace.
        Now for the last 3 cards, there are always 48 cards to choose in 3 positions where order actually matters,
        so the number of possible events are 48^3. 
        Is important to notice that the author had assumed that there is no difference between the 4 aces and
        between the other cards either.
    =#
    println("P2 - With that said we can pull 4 aces in $(4*5*48^3) ways.");
end

begin # Problem 3
    #=
        If we're interest only in pulling an ace or not, than the probability of success in each pull
        is of p=4/52, since there is replacement. Now we're able to calculate the probability as
    =#
    println("P3 - B(k=5;10,4/52) = ", distmod.pdf(distmod.Binomial(10,4/52),5));
end

begin # Problem 4
    println("P3 - B(k≥2;n=7,p=1/5) = ", sum(distmod.pdf(distmod.Binomial(7,1/5),x) for x in 2:7));
end

begin # Problem 5
    println("P3 - B(k≥2;n=25,p=1/10) = ", sum(distmod.pdf(distmod.Binomial(25,1/10),x) for x in 2:25));
end