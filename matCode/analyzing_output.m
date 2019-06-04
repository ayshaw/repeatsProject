[hi, eij, fi, fij, meta] = read_eij('PF00023.model');
FN = plot_norms_eij(eij);
D = zeros(size(FN));
for ix = 1:numel(I)
    D(I(ix),J(ix)) = medMIN(ix);
    D(J(ix),I(ix)) = medMIN(ix);
end