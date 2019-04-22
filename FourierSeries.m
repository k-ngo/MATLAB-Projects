% By KHOA NGO
% Return the Fourier Series of a function 'f' to the 'n'-th degree.

function FS = FourierSeries(f, n)

    syms x;
    
    FS = 0;
    
    %Evaluate 1st coefficient and add to FS
    a_0 = (1/pi()) * int(f, x, -pi(), pi());
    FS = FS + a_0/2;
    
    %Evaluate remaining coefficients and add to FS
    for counter = 1:n
        a_n = (1/pi()) * int(cos(counter * x) .* f, x, -pi(), pi());
        b_n = (1/pi()) * int(sin(counter * x) .* f, x, -pi(), pi());
        FS = FS + a_n * cos(counter * x) + b_n * sin(counter * x);
    end

end