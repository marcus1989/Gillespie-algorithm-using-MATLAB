function [t, x] = GillespieAlgorithm(matrix, propensity, tspan, x0, params)

MAXIMUM_POPULATION = 1000000;
species_size = size(matrix, 2);
T = zeros(MAXIMUM_POPULATION, 1);
X = zeros(MAXIMUM_POPULATION, species_size);
T(1)     = tspan(1);
X(1,:)   = x0;
count = 1;
%trajectory = 3001;
trajectory = 1369;

while count < trajectory        
    a = propensity(X(count,:), params);
    a0 = sum(a);
    r = rand(1,2);
    tau = -log(r(1))/a0;
    [~, mu] = histc(r(2)*a0, [0;cumsum(a(:))]);
    
    T(count+1)   = T(count)   + tau;
    X(count+1,:) = X(count,:) + matrix(mu,:);    
    count = count + 1;
end

t = T(1:count);
x = X(1:count,:);
disp('X');disp(x);
end
