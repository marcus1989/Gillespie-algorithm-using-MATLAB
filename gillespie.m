t=0;tstop= 10;
S=[-1 1 0 0 0 0 ; -1 0 1 0 0 0 ;0 -1 0 1 0 0;0 0 -1 0 1 0;0 0 0 -1 0 1;0 0 0 0 -1 1];
X = [1000;0;0;0;0;0];
w = [2*X(1);3*X(1);1*X(2);2*X(3);3*X(4);3*X(5)];
figure;
hold on;
while t<tstop
    r = sum(w);
    tau = (1./r).*log(1./rand());
    t=t+tau;
    if t<=tstop
	 	 r2r=rand*r; 
	 	 i=1; 
         while sum(w)<r2r
	 	 	 i=i+1;
         end
    X = X+S(:,i)
    end
    while(t>tout)
        tout = tout+0.1;
    end
    plot(X);
    w = [2*X(1);3*X(1);1*X(2);2*X(3);3*X(4);3*X(5)];
end
hold off;