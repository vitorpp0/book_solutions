using CairoMakie
using Statistics
using Distributions
using SpecialFunctions
using Logging

# 5.1.1 
begin
    pmf = [ 
        .10 .04 .02;
        .08 .20 .06;
        .06 .14 .30
    ]
    @info "a." pmf[1,1];
    @info "b." sum(pmf[1:2,1:2])
    @info "c. No pump is not being used"
    pₓ, pᵢ = ones(1,3)*pmf, pmf*ones(3,1); 
    @info "d. p(x) = $pₓ" 
    @info "d. p(y)  = $pᵢ"
    @info "d. p(x ≤ 1) = $(sum(pₓ[1,1:2]))"
    @info "e. $(all(pᵢ*pₓ .== pmf))"
end

# 5.1.2
begin
    px = [.5,.3,.2];
    py = [0.6, .1, .05, .05, .2];
    pmf = px*py';
    @info "a." pmf;
    @info "b." "p(x≤1,y≤1)=" (sum(pmf[1:2,1:2])) sum(pmf[1:2,1:2]) == sum(pmf[1:2,:])*sum(pmf[:,1:2])
    @info "c. Since X,Y⋝0 then X+Y=0 means no violation, the probability of no problems being found"
    @info "d." "p(x+y≤1)=" sum([pmf[x, y] for x in 1:3, y in 1:4 if x+y-2≤1])
end

# 5.1.2
begin
    px = [.5,.3,.2];
    py = [0.6, .1, .05, .05, .2];
    pmf = px*py';
    @info "a." pmf;
    @info "b." "p(x≤1,y≤1)=" (sum(pmf[1:2,1:2])) sum(pmf[1:2,1:2]) == sum(pmf[1:2,:])*sum(pmf[:,1:2])
    @info "c. Since X,Y⋝0 then X+Y=0 means no violation, the probability of no problems being found"
    @info "d." "p(x+y≤1)=" sum([pmf[x, y] for x in 1:3, y in 1:4 if x+y-2≤1])
end

# 5.1.3
begin 
    pmf = [
        .08 .07 .04 .00;
        .06 .15 .05 .04;
        .05 .04 .10 .06;
        .00 .03 .04 .07;
        .00 .01 .05 .06;
    ]
    @info "a. p(x1=1, x2=1)=" pmf[2,2] 
    @info "b. p(x1=x2)=" sum([pmf[x,x] for x in 1:4])

    function p_more(n)
        return ( 
            n==0 
            ? sum([pmf[x,x] for x in 1:4]) 
            : sum([pmf[x,x+n] for x in 1:(size(pmf)[2]-n)]) + sum([pmf[x+n,x] for x in 1:(size(pmf)[1]-n)])
        )
    end
    @info "c. p(x1+2=x2)+p(x2+2=x1)=" 1 - p_more(0) - p_more(1)  

    @info "d" "p(x1+x2=4)=" sum([pmf[x1, x2] for x1 in 1:5, x2 in 1:4 if x1+x2-2==4])
    @info "d" "p(x1+x2≥4)=" 1-sum([pmf[x1, x2] for x1 in 1:5, x2 in 1:4 if x1+x2-2<4]) 
end

# 5.1.4
begin 
    pmf = [
        .08 .07 .04 .00;
        .06 .15 .05 .04;
        .05 .04 .10 .06;
        .00 .03 .04 .07;
        .00 .01 .05 .06;
    ]

    px1=sum(pmf, dims=2);
    px2=sum(pmf, dims=1);
    @info "a. p(x1)=" sum(pmf, dims=2)
    @info "a. E(x1)=" px1'*[x-1 for x in 1:5]
    @info "b. E(x2)=" px2
    @info "c." all(px1*px2 .== pmf)
end
