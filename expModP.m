function rem = expModP(g,b,p)

    rem = 1;
    for i = 1:b
        rem = mod(g*rem, p);
    end

end