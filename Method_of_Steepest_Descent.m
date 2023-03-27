% David Williams
% Exam 2 - Question 3

function [ x, niters ] = Method_of_Steepest_Descent( A, b , x0 )

  % initialize r, x, and niters
  convergence = eps * norm(b);
  r = b - A*x0;
  x = x0;
  niters = 0;

  % iterate until the norm of r smaller than epsilon * norm(b)
  while norm(r) > convergence
    p = r;
    q = A * p;
    alpha = (p.' * r)/(p.' * q);
    x = x + alpha * p;
    r = r - alpha * q;
    niters = niters + 1;
  end
end