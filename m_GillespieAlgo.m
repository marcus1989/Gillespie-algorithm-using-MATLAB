function [t, x] = m_GillespieAlgo(react_matrix, prop_func,...
                                    tspan, x0, params)
%function [t1, t2, x] = m_GillespieAlgo(react_matrix, prop_func,...
%                                    tspan, x0)      
                                
%pf_rand_matrix = zeros(294642, 1);
%ps_rand_matrix = zeros(294642, 1);

%ui = 5;
%uf = 10;
%us = 1;
%ue = 1;
%pf = 0.8;
%ps = (1 - pf_rand);

MAX_OUTPUT_LENGTH = 100000;
num_species = size(react_matrix, 2);
T = zeros(MAX_OUTPUT_LENGTH, 1);
X = zeros(MAX_OUTPUT_LENGTH, num_species);
T(1)     = tspan(1);
X(1,:)   = x0;
rxn_count = 1;
%trajectory = 294642;
trajectory = 1000;
while rxn_count < trajectory
    %disp('itearator count'); disp(rxn_count);
    %pf_rand = (1/randi([2, 30]));
    %ps_rand = (1 - pf_rand);
    %p.k1 = (ui*pf_rand);
    %p.k2 = (ui*ps_rand);
    %p.k3 = uf;
    %p.k4 = us;  
    %p.k5 = ue;
    %pf_rand_matrix(1:rxn_count) = pf_rand;
    %ps_rand_matrix(1:rxn_count) = ps_rand;
    
    %a = prop_func(X(rxn_count,:),p);
    a = prop_func(X(rxn_count,:),params);
    a0 = sum(a);
    r = rand(1,2);
    tau = -log(r(1))/a0;
    [~, mu] = histc(r(2)*a0, [0;cumsum(a(:))]);
 
    T(rxn_count+1)   = T(rxn_count)   + tau;
    X(rxn_count+1,:) = X(rxn_count,:) + react_matrix(mu,:);    
    rxn_count = rxn_count + 1;
end
t = T(1:rxn_count);
%t1 = T(1:rxn_count);
%t2 = ps_rand_matrix(1:rxn_count);
x = X(1:rxn_count,:);
disp('X');disp(x);
end
