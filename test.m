clear all
t=0;tstop = 2000; %%specify initial and final times
x = [0; 0]; %% Specify initial conditions
S = [1 -1 0 0; 0 0 1 -1]; %% Specify stoichiometry
w = inline('[10, 1*x(1), 10*x(1), 1*x(2)]','x'); %% Specify Propensity functions
while t<tstop
 tpos = 1./w(x)*log(1./rand(4,1)); % possible times until first reaction
 [tpos,i]=min(tpos); % find which is first reaction
 t=t+tpos;
 if t<=tstop
	 	 x = x+S(:,i); % update the configuration
 end
end