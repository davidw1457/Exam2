% David Williams
% Exam 2 - Question 3

function [ x, niters ] = Method_of_Steepest_Descent_ichol( A, b, x0 )
    
  % initialize L, A, b, x, r, and niters
  convergence = eps * norm(b);
  L = sparse(ichol(sparse(A)));
  A = (L \ A) \ L.';
  b = L \ b;
  x = L.' * x0;
  r = b - A * x;
  niters = 0;
  
  % iterate until norm(r) is smaller than machine epsilon * norm(b)
  while norm(r) > convergence
    p = r;
    q = A * p;
    alpha = (p.' * r) / (p.' * q);
    x = x + alpha * p;
    r = r - alpha * q;
    x = L.' \ x;
    niters = niters + 1;
  end

end