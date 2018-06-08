% takes in integers a1, s2
% computes the inverse of a1 mod a2
% function assumes a1 < a2
function x = modInv(a1, a2)
    if (gcd(a1, a2) ~= 1)
        disp('error: num not coprime to modulus')
        x = 0;
        return
    else
        i = 1;
        rem(i) = mod(a2, a1);
        quot(i) = a1;
        cof(i) = (a2 - rem(i))/quot(i);
        while (rem(end) ~= 0)
            rem(i+1) = mod(quot(i), rem(i));
            cof(i+1) = (quot(i) - rem(i+1))/rem(i);
            quot(i+1) = (quot(i) - rem(i+1))/cof(i+1);
            i = i + 1;
        end
        
    end
    
    matrix = [0 1; 1 0];
    for i = 1:length(cof)
        matrix(:, i+2) = cof(i)*matrix(:, i+1) + matrix(:, i);
    end
    
    if matrix(2,end) == a1
        x = (-1)^ (length(cof) + 1)* matrix(1, end-1);
    else
        x = (-1) ^ (length(cof))*matrix(2, end-1);
    end
    
    x = mod(x, a2);     
end