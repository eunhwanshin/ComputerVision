% Example 6.2

% Projection matrix
P = [...
  3.53553e+2,  3.39645e+2, 2.77744e+2, -1.44946e+6;
 -1.03528e+2,  2.33212e+1, 4.59607e+2, -6.32525e+5;
  7.07107e-1, -3.53553e-1, 6.12372e-1, -9.18559e+2];

M = P(:,1:3);  

% image center
C_tilde = -inv(M) * P(:,4);

% Camera matrix and ratation matrix
[K, R] = givens_rq(M);

  


