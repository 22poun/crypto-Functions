% uses the pollard p -1 algorithm to try to factor N 
% into primes p and q
% bound is the max number iterations
% lower is n with which we start the algorithm 
% returns (0,0) if the bound is reached without finding a factor

function [p q] = polFac(N, lower, bound)
    p = 0;
    q = 0;
    a = 2;
    n = lower;
    
    rem = expModP(a, factorial(n), N);
    while (n <= bound)
        w = gcd(rem - 1, N);        
        if (w > 1 & w < N)
            p = w;
            q = N/p;
            return;
        end
        n = n + 1;
        rem = expModP(rem,n, N);
    end  
end