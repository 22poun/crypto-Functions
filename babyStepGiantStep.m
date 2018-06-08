function x = babyStepGiantStep(g, p, h)

    N = p - 1;
    n = floor(sqrt(N)) + 1;
    rem = 1;
    invG = invModP(g, p);
    l1(1) = 1;
%     
    for i = 1:n
        rem = mod(g*rem,p);
        l1(i+1) = rem;
    end
    
    
    for i = 1:n
        pow(i) = expModP(invG, n*i, p);
        l2(i) = mod(h*pow(i), p);
    end
    
    both = intersect(l1, l2); 
    x = find(l1 == both) - 1 + n * (find(l2 == both));
    
end