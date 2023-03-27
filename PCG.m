% David Williams
% Exam 2 - Question 3

function [ x, niters ] = PCG( A, b, x0 )

  % initialize L, A, b, x, r, and niters
  convergence = eps * norm(b);
  L = sparse(ichol(sparse(A)));
  M = L * L.';
  x = x0;
  r = b - A * x0;
  niters = 0;

  % iterate until norm(r) is less than machine epsilon * norm(b)
  while norm(r) > convergence
    z = M \ r;
    if niters == 0
      p = z;
    else
      gamma = (r.' * z)/(rj.' * zj);
      p = z + gamma * p;
    end
    q = A * p;
    alpha = (r.' * z) / (p.' * q);
    x = x + alpha * p;
    rj = r;
    r = r - alpha * q;
    zj = z;
    niters = niters + 1;
  end
  
end