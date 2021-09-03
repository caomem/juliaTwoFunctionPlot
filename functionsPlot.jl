using Plots

function plotTwoFunctions(c_1 = n -> 506n - 1481, 
                          c_2 = n -> 465n -1304,
                          c1 = n -> (44*n + 475)*2^(n-4) - 108,
                          c2 = n ->(44*n + 394)*2^(n-4) - 14;
                          interval = 4:0.05:8)
    
    c1vals = zeros(size(interval,1))
    c2vals = zeros(size(interval,1))
    c_1vals = zeros(size(interval,1))
    c_2vals = zeros(size(interval,1))

    i = 1
    for j in interval
        c_1vals[i] = c_1(j)
        c_2vals[i] = c_2(j)
        c1vals[i] = c1(j)
        c2vals[i] = c2(j)
        i += 1
    end

    plot(interval, c_1vals[1:size(interval,1)], line = (1, :dash, :black), label = "c1 underline", legend = :topleft)
    plot!(interval, c_2vals[1:size(interval,1)], line = (1, :gray), label = "c2 underline")

    savefig("cUnderline.pdf")

    plot(interval, c1vals[1:size(interval,1)], line = (1, :dash, :black), label = "c1 overline", legend = :topleft)
    plot!(interval, c2vals[1:size(interval,1)], line = (1, :gray), label = "c2 overline")

    savefig("cOverline.pdf")
end
