begin # Problem 1
    # First, we need to calculate the probability p of getting X>7
    local n::Int64, total::Int64 = 0, 6^2;
    for dice_1 in 1:6, dice_2 in 1:6
        if dice_1+dice_2 > 7
            n += 1;
        end
    end
    println("P(X>7) = ", round(n/total, digits=4));
end

begin # Problem 2
    # First, we need to calculate the probability p of getting X>7
    local n::Int64, total::Int64 = 0, 6^3;
    for dice_1 in 1:6, dice_2 in 1:6, dice_3 in 1:6
        if dice_1+dice_2+dice_3 > 7
            n += 1;
        end
    end
    println("P(X>7) = ", round(n/total, digits=4));
end

begin # Problem 3
    # First we calculate the odds
    local O::Float64 = 30/5;
    # Than we stipulate the probability
    println("P(X=Red Sox) = ", round(O/(O+1), digits=4));
end