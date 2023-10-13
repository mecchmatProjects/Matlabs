x=fminunc(@fff,[3 3]);
y = fminunc(@fff1,[3 3],optimset('Gradobj','on'))