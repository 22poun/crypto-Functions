function h = checkPrimRoot(a,p)
h = true;
x = 1:p-1;
rem = 1;

    for i = 1:p-1
        rem = mod(a*rem, p);
        if (ismember(rem,x))
            x = x(x~=rem);
        else
            h = false;
            break
        end
    end
end