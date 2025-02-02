begin # Problem 1
    # First, we need to calculate the probability p of getting X>7
    local n::Int64 = [i+j>7 for i in 1:6, j in 1:6] |> count; 
    local total::Int64 = 6^2;
    println("P1 - P(X>7) = ", round(n/total, digits=4));
end

begin # Problem 2
    # First, we need to calculate the probability p of getting X>7
    local n::Int64 = [i+j+k>7 for i in 1:6, j in 1:6, k in 1:6] |> count; 
    local total::Int64 = 6^3;
    println("P2 - P(X>7) = ", round(n/total, digits=4));
end

begin # Problem 3
    # First we calculate the odds
    local O::Float64 = 30/5;
    # Than we stipulate the probability
    println("P(X=Red Sox) = ", round(O/(O+1), digits=4));
end