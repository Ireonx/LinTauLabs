function H = hurwitz_matrix(den_coeffs_cell)
    if isempty(den_coeffs_cell)
        error('Denominator coefficients are empty.');
    end
    den_coeffs = den_coeffs_cell{1};
    order = length(den_coeffs) - 1;
    H = zeros(order);
    for i = 1:order
        k = 1;
        for j = i*2:-1:1
            if k <= order
                if j <= order + 1
                    H(k, i) = den_coeffs(j);
                end
                k = k + 1;
            end
        end
    end
    disp('Hurwitz matrix:');
    disp(H);
end