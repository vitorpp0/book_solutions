include(joinpath(@__DIR__, "./init.jl"));

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

begin # Problem 2
    # If every 1 over 5 is defective, then the probability (p) 
    # of a defective casting is
    local p::Float64 = 1/5;
    # Then we can calculate the probability(P(X=2|Bin(8,p)) o 2 over 8 defective
    # as an element of a distribution Bin(8, p)
    local P::Float64 = binomial(8, 2)*p^2*(1-p)^6
    println("Then P(X=2|Bin(p,8)) = $P ($(P*100)%)");
end


begin # Problem 3 

    # To stablish load loss, the system must produce less than 80MW
    # which happens when the number of defective generator is X > 1.
    # So, the expected load loss for X=i can be calculated by 
    # E(X=i|Bin(5, 0.005)) = P(X=i|Bin(5, 0.005))*min(20*(i-1), 80), then:
    local Eₚ(p::Float64, n::Int64, min::Int64, power::Float64, load::Float64)::Float64 = sum([minimum([power*(i-min+1), load])*binomial(n, i)*p^i*(1-p)^(n-i) for i in min:n]);
    local Δtₚ(p::Float64, n::Int64, min::Int64)::Float64 = 365*24*sum([binomial(n, i)*p^i*(1-p)^(n-i) for i in min:n]);

    # Item a
    println("a - The expected loss is $(Eₚ(0.005, 5, 2, 20., 80.)) MW with a curtailment of $(Δtₚ(0.005, 5, 2)) h/year")

    # Item b 
    # We implement something similar to item a
    println("b - The expected loss is $(Eₚ(0.015, 9, 2, 10., 80.)) MW with a curtailment of $(Δtₚ(0.015, 9, 2)) h/year")

end