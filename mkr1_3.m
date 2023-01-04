f = @(x) (2*x + 10)^(1/4);

disp("методом простих ітерацій");
disp(fminbnd(f, 0, 1));
disp("методом m_piter"); 
disp(m_piter(f, 0, 100, 1e-5));