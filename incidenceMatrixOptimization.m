% Alex Stephens 2/6/18
% example incidence matrix problem: min vtx cover

function [x, oofv] = incMat(A)
 
A = [1 1 0 0 0 0; % e1 has endpoints v1 and v2
     0 1 1 0 0 0;
     0 1 0 1 0 0; % e3 has endpoints v2 and v4
     1 0 0 1 0 0;
     0 0 0 1 1 0;
     0 0 1 0 1 0;
     0 0 1 0 0 1];
 
mEdges  = length(A);        % gets the length of a col
nVtcs   = length(A(1,:));   % gets the length of a row
b       = ones(1,mEdges);   % makes a vector of ones


f = ones(1,nVtcs);

Ain = -A;   % negate
bin = -b';  % negate
Aeq = [];   % empty
beq = [];



lb=zeros(nVtcs,1);  % tells us the upper bound for each element is 1
ub=ones(nVtcs,1);   % tells us the lower bound "" is zero
intcon=1:nVtcs;     % pics all elements of x to be integers
% to sum the last three lines up:
% x must be all integers between 0 and 1, thus only 0 and 1 possible.

[x,oofv] = intlinprog(f,intcon,Ain,bin,Aeq,beq,lb,ub);


%run [x, oofv] = incMat(A)

end