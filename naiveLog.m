function i = naiveLog (g, h, p)

    for i = 0:p
        rem = expModP(g, i, p);
        if rem == h
            break;
    end
end