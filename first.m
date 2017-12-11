t=0;tstop= 10;
S=[-1 1 0 0 0 0 ; -1 0 1 0 0 0 ;0 -1 0 1 0 0;0 0 -1 0 1 0;0 0 0 -1 0 1;0 0 0 0 -1 1];
X = [1000;0;0;0;0;0];
w = [2*X(1);3*X(1);1*X(2);2*X(3);3*X(4);3*X(5)];
tout =0.1;
figure;
hold on;
while (t<tstop)
    tau = (1./w').*log(1./rand());
    [tau,i]=min(tau);
    t=t+tau;
    while(t>tout)
        tout = tout+0.1;
    end
    if t<=tstop
        X = X + (S(i,:))'
            %D = vec2mat(X,100);
    end
    plot(X);
    w = [2*X(1);3*X(1);1*X(2);2*X(3);3*X(4);3*X(5)];
end
hold off;