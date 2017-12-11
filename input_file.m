function input_file()
import methods.*
clear all;

%ui = 5;
%uf = 10;
%us = 1;
%ue = 1;
%pf = 0.8;
%ps = (1 - pf);

ki1 = 1;
ki2 = 0.1;
kr1 = 0.5;
kr2 = 0.01;
alpha = 0.2;

%p.k1 = (ui*pf);
%p.k2 = (ui*ps);
%p.k3 = uf;
%p.k4 = us;

p.k1 = ki1;
p.k2 = kr1;
p.k3 = (1/alpha)*ki2;
p.k4 = kr2;
p.k5 = kr1;
p.k6 = alpha*ki1;
p.k7 = kr2;
p.k8 = ki2;

%pf_rand_matrix = zeros(294642, 1);

%tspan = [0, 30001];
tspan = [0, 300];
x0 = [1000, 0, 0, 0, 0];
%% Specify reaction network
propensity = @prop;

%react_matrix = [-1  1  0  0  0
%              -1  0  1  0  0
%              0  -1  0  1  0
%              0  0  -1  1  0
%              0  0  0  -1  1];
matrix = [-1  1  0  0  0
                1  -1  0  0  0
                0  -1  1  0  0
                0  1  -1  0  0
                0  0  -1  0  1
                0  0  1  0  -1
                1  0  0  0  -1
                -1  0  0  0  1];
[t,x] = GillespieAlgorithm(matrix, propensity, tspan, x0, p);
%[t1, t2, x] = m_GillespieAlgo(react_matrix, prop_func, tspan, x0);

%% Plot time course
figure();
%plot(t1,x);
plot(t,x);
%stairs(t,x);

%plot(t,x(:,6));
xlabel('time (s)');
ylabel('Copies');
legend({'SS','IS','II','IS','SI'});
grid on;

%figure();
%plot(t1,x);
%xlabel('ps_rand[0, 1]');
%ylabel('Copies');
%legend({'phi','S1','S2','S3','Oe'});
%grid on;

end

function a = prop(x, p)
%phi = x(1);
%s1 = x(2);
%s2 = x(3);  
%s3 = x(4);
ss = x(1);
is = x(2);
ii = x(3);
is = x(4);
si = x(5); 

 %a = [p.k1*phi;
 %    p.k2*phi;
 %    p.k3*s1;
 %    p.k4*s2;
 %    p.k5*s3];
 a = [p.k1*ss;
      p.k2*is;
      p.k3*is;
      p.k4*ii;
      p.k5*ii;
      p.k6*si;
      p.k7*si;
      p.k8*ss;]
end