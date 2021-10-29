% This code takes the number of pages and the constant value to calculate
% the page rank for each page. 

% this will allow the user to enter the N and d values
N = input('enter value for N =');
d = input('enter value for d =');

% This line will create a matrix of N*N with random integers between 1
% and 0
A = randi([0 1],N,N);
% This line makes the matrix's diagonal equal to zero 
A(1:N+1:end) = 0;
% Divide each column by the sum of its entries, or if the column is all
% zeros then keep it all zeros by dividing by 1
H = A./max(1,sum(A,1));

% the matrix I is the same size as H matrix
I = eye(size(H));
% this line create a vector of one colum with ones values with rows equal
% to H matrix
one = ones(size(H, 1), 1);

% r represents the value of the pagerank
r = ((I-d*H)^-1) * ((1-d)*one);

% Create a vector containing the number of links going to each page
links_to = sum(A,2);
% *** Create a vector containing the number of links going from each page ***
links_from = sum(A)';

% *** Create a results matrix with the following columns: ***
%   1: page numbers
%   2: ranks
%   3: number of outgoing links
%   4: number of incoming links
results = [[1:N]',r, links_from, links_to];

% *** Sort the rows of the results matrix by the ranks in descending order.  
% Look at the documentation of the "sortrows" function. ***
results_sorted = sortrows(results,2, 'descend');

% Print the results to the screen.
fprintf('The rank of page %i is %.2f, with %i outgoing links and %i incoming links\n',results_sorted')

% *** Plot the number of outgoing and incoming links on a single plot, vs
% the rank of the corresponding page (i.e. the ranks should be on the 
% x-axis, and the number of links should be on the y-axis.  Use
% the sorted results matrix, so you can see if there is a correlation
% between the rank and either of the metrics. ***
plot([[results_sorted(:,2)],[results_sorted(:,3:4)]])

% *** Label the axes. ***
xlabel ('Ranks')    
ylabel ('Links from / Links to')