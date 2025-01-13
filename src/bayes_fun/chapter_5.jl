import Distributions as distmod

begin # Problem 1
#=
    We're interest in calculating likelihoods (P) about p, the probability 
    of coin landing heads. Well, we know that P is a beta distribuion with α=4 and β=6.
=#
    local P::distmod.Beta = distmod.Beta(4, 6);
    # So we calculate P(0.6; 4, 6) = acc
    local acc::Float64 = 1-distmod.cdf(P, 0.6);
    println("P(0.6; 4, 6) = ", round(acc, digits=4));
end

begin # Problem 2
    #In a similar way, we want to calculate the cdf of acc = P(x∈[0.45, 0.55]; 9, 11)
    local P::distmod.Beta = distmod.Beta(9, 11);
    local acc::Float64 = distmod.cdf(P, 0.55)-distmod.cdf(P, 0.45);
    println("P(x∈[0.45, 0.55]; 9, 11) = ", round(acc, digits=4));
end

begin # Problem 3
    # Similarly with problem 2, we do
    local P::distmod.Beta = distmod.Beta(109, 111);
    local acc::Float64 = distmod.cdf(P, 0.55)-distmod.cdf(P, 0.45);
    println("P(x∈[0.45, 0.55]; 109, 111) = ", round(acc, digits=4));
end