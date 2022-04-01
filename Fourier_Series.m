close all; clear; clc;
syms x
%%
%Function definition
%example #1
        %f(x)=exp(-abs(x));
%example #2
    %f(x)=piecewise(x<=-2,0, (-2<=x)<=-1,x+2, (-1<=x)<=1,1, (1<=x)<=2,-x+2, 2<=x,0);
%Define the function period
    T=2;
%Max N
    N=10;
%% 
%F(x) is the fourier series
%The initial value is the DC part
    F(x)=1/T*int(f(x),-T/2,T/2);
    disp(F(x));
    
    for n=1:N
            X_n=1/T*int(f(x)*exp(-1j*n*2*pi*x/T),-T/2,T/2);
            F(x)=F(x)+X_n*exp(1j*n*2*pi*x/T);
            
            X_n=1/T*int(f(x)*exp(-1j*-n*2*pi*x/T),-T/2,T/2);
            F(x)=F(x)+X_n*exp(1j*-n*2*pi*x/T);
    end
    
    t=linspace(-T/2,T/2,100);
    Y=F(t);
    G=f(t);
    plot(t,Y,t,G);
