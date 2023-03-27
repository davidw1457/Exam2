% David Williams
% Exam 2 - Question 3
 
function [ A ] = Create_Poisson_problem_A( N )

  % Create the archtypical matrix A for an N x N Poisson problem (5-point
  % stencil.

  % Set the diagonal
  A = zeros(N * N);
  for i = 1:(N*N)
      A(i,i) = 4;
  end
    
  % Set the entries of the first sub and super diagonals
  if N > 1
    A(1,2) = -1;
    A(N*N,(N*N)-1) = -1;
    for i = 2:(N*N)-1
      A(i,i-1) = -1;
      A(i,i+1) = -1;
    end
  end
  
  % Set the other off-diagonal entries
  if N > 2
    for i = 1:N
      A(i,i+N) = -1;
    end
    for i = N+1:(N*N)-N
        A(i,i-N) = -1;
        A(i,i+N) = -1;
    end
    for i = (N*N)-N+1:(N*N)
        A(i,i-N) = -1;
    end
  end
end