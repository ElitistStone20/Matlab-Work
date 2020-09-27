% ==========================
% Filename: Perceptron_XOR.m
% ==========================

echo on ;
%
%
%
% ====================================================================
% The perceptron: an attempt to learn linearly non-separable functions
% ====================================================================

% ============================================================================
% Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent  
%            Systems", 3rd edn. Addison Wesley, Harlow, England, 2011.
%            Sec. 6.3 The perceptron
% ============================================================================

% ===========================================================================
% Problem: Two-input perceptron is required to perform logical operation XOR.
% ===========================================================================

% Hit any key to define four 2-element input vectors denoted by "p". 
pause 

input=[0 0 1 1;0 1 0 1];
z=input(1,:).*input(2,:);

% Hit any key to define four 1-element target vectors denoted by "t". 
pause 

% Various boolean functions for a choice of perceptron target output
NANDTarget=[1 1 1 0];
ORTarget=[0 1 1 1];
NORTarget=[1 1 1 1];
ANDTarget=[0 0 0 1];
XORTarget=[0 1 1 0];

p=[input;z]

t=XORTarget;



% Hit any key to plot the input and target vectors.
v=[-2 3 -2 3 -2 3];

plotpv(p,t,v);

% Hit any key to create the perceptron and set its initial weights to random 
% numbers in the range [0, 1]. The perceptron's threshold is set to zero.
pause

net=newp([0 1;0 1;0 1],t);
w=(rands(3))';
b=[0];
net.IW{1,1,1}=w;
net.b{1}=b;

plotpv(p,t,v);
linehandle=plotpc(net.IW{1},net.b{1});

% Hit any key to train the perceptron for one pass and plot the classification line. 
% The training will be stoped after 10 passes.
pause
E=1;

while sse(E);
   [net,Y,E]=adapt(net,p,t);
   linehandle=plotpc(net.IW{1},net.b{1},linehandle);
   pause
end;

% Hit any key to see that the perceptron has learned the XOR operation.
pause

p=[1;1;1]
a=sim(net,p)

% Hit any key to continue.
pause

p=[0;1;0]
a=sim(net,p)

% Hit any key to continue.
pause

p=[1;0;0]
a=sim(net,p)

% Hit any key to continue.
pause

p=[0;0;0]
a=sim(net,p)
   
echo off
disp('end of Perceptron_XOR')