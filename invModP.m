% takes in a integer  a and a modulus N
% if N is prime we use a combo of fermat's little theorem and the fast
% powering algorithm
% if N is not prime, we use euclid's 

function x = invModP (a, N)
    if gcd(a, N) ~= 1
        disp('base is not coprime to modulus. modulo inverse does not exit')
        x = 0
    
    elseif isprime(N)
        x = expModP(a, N-2, N)
   
    else 
        x = euclidAlg(a,N);
    end
    
end
