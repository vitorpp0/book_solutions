import Distributions as dt

begin # Problem 1
    # Item a
    # Ok, first we need to determine the probability(p) of the sum (X) be 8 
    local sum::Int64, total::Int64 = 0, 36; 
    for i in 1:6, j in 1:6
        sum = i+j==8 ? sum+1 : sum;
    end
    local p::Float64 = sum/total;
    # Nice, now we just need to understant that this events follows a binomial distribution
    # and P(X=8) = P = C4,3*p^3*(1-p)^1
    local P::Float64 = binomial(4,3)*p^3*(1-p);
    println("a. So the probability of reaching 8, 3 times in 4 draws is of $P ($(P*100)%)");

    # Item b
    # Ok, now we may be interest in having a distribution object.
    # Will be using Distributions.jl for that.
    local bin_dist = dist.Binomial(4,p);
    P = 1-dist.cdf(bin_dist, 1);
    println("b. Alright, so P(X>=2) = $P ($(P*100)%)");
end