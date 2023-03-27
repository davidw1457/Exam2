% David Williams
% Exam 2 - Question 3

function [ x, niters ] = CG( A, b, x0 )

  % initialize r, x, and niters
  convergence = eps * norm(b);
  r = b - A*x0;
  x = x0;
  niters = 0;

  % iterate until norm(r) is less than machine epsilon * norm(b)
  while norm(r) > convergence
    if niters == 0
      p = r;
    else
      gamma = (r.' * r) / (rj.' * rj);
      p = r + gamma * p;
    end
    alpha = (r.' * r) / (p.' * A * p);
    x = x + alpha * p;
    rj = r;
    r = r - alpha * A * p;
    niters = niters + 1;
  end
end