begin # Problem 1
    # Ok, if the probability of getting one 20 is 1/20, then
    println("P(X=(20, 20, 20)) = ", round(1/20^3, digits=4));
end

begin # Problem 2
    #=
        Well, the probability of the intersection is the product of probabilities
        since seens that the weather prediction doenst influence the forgetting one. 
    =#
    println("P(X=rain and forget the umbrella) = ", round(0.1*0.5, digits=4));
end

begin # Problem 3
    #=
        So we need to calculate the probability P(egg 1 with salmonella ∪ egg 2 with salmonella) = 
        P(egg 1 with salmonella) + P(egg 2 with salmonella) - P(egg 1 with salmonella ∩ egg 2 with salmonella)
    =#
    println(
        "P(egg 1 with salmonella ∪ egg 2 with salmonella) = ", 
        round(2/20_000 - 1/20_000^2, digits=100));
end

begin # Problem 4
    #= 
        Ok, so we need are interest in calculating 
        P(2 heads ∪ 3 six) = P(2 heads) + P(3 six) - P(2 heads ∩ 3 six)
    =#
    println("P(X = 2 heads ∪ 3 six) = ", round(1/2^2+1/6^3-(1/2^2)*(1/6^3), digits=4));
end