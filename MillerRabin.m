% n is the number we are testing for primality
% a is the potential witness
% returns 0 if composite
% returns 1 if test fails b/c a^q == 1 mod p
% returns 2 if test fails b/c a^(q*2^1) == -1 mod p
% if x = 1,2 n may be prime



function x = MillerRabin(a,n)
    x = 0;
    
    if (mod(n,2) == 0)
        return
    end

    if (gcd(a,n) > 1 & gcd(a,n) < n)
        return
    end

    factors = factor(n-1);
    pos = factors > 2;
    q = prod(factors(pos));
    k = sum(factors == 2);

    aq = expModP(a, q, n);
    if (aq == 1)
        x = 1;
        return;
    end
    
    rem = aq;
    for i = 0:k-1
        if (rem == 1)
            return;
        end
        
         if (rem == n - 1)
            x = 2;
            return;
        end
        
        rem = expModP(rem, 2, n);
        
    end
    
end