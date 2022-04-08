function [R, Q] = givens_rq(A)
% A4.1.1 (p.579)

n = size(A, 1);
m = size(A, 2);

Q = eye(m);

for i=n:-1:2,
  for j=1:i-1,
    rho = sqrt(A(i, i)^2 + A(i, j)^2);
	s = A(i, j) / rho;
	c = A(i, i) / rho;
	for k=1:i,
	  x = c * A(k, j) - s * A(k, i);
	  A(k, i) = s * A(k,j) + c * A(k, i);
	  A(k, j) = x;
	end;
	
	for k=1:m,
	  x = c * Q(k,j) - s*Q(k,i);
	  Q(k, i) = s * Q(k,j) + c * Q(k, i);
	  Q(k, j) = x;
	end
	
  end
end

R = A(:,1:n);	
Q = Q';