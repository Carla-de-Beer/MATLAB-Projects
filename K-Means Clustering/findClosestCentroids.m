function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])

% Set K
K = size(centroids, 1); % number of clusters

% Return variable
idx = zeros(size(X,1), 1);

%  Go over every example, find its closest centroid, and store
%  the index inside idx at the appropriate location.
%  Concretely, idx(i) should contain the index of the centroid
%  closest to example i. Hence, it should be a value in the
%  range 1..K

n = size(X,1); % number of x^(i)

for i = 1:n
    distance = zeros(1, K);
    for j = 1:K
        distance(1, j) = norm((X(i, :) - centroids(j, :)));
        %distance(1, j) = sqrt(sum(power((X(i, :) - centroids(j, :)), 2)));
    end
    [closest, p] = min(distance);
    idx(i) = p;
end

end

