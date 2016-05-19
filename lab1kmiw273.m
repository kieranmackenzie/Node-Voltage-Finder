function [ A,b ] =lab1kmiw273( info )


[names, nodeI, nodeJ, totalvalues] = textread(info, '%s %f %f %f');

%% Sort the currents from resistances

k = 1;
for i = 1:(length(nodeI)-1)
   flag = strncmpi(names(i),names(i+1),1);
    if (flag == 0)
      break  
    end
k=k+1;
end

%% Fill in Voltage and Current Matrices

% voltages
for i = 1:k
    nodeIR(i) = nodeI(i);
    nodeJR(i) = nodeJ(i);
    values(i) = totalvalues(i);
end
% currents
p=1;
for j = k+1:(length(nodeI))
  
    sourceI(p) = nodeI(j);
    sourceJ(p) = nodeJ(j);
    current(p) = totalvalues(j);
    p = p+1;
end

% we get the max because the max number of nodes determines the matrix size
num_rows_R = max(nodeIR);
num_rows_R1 = max(nodeJR);
if (num_rows_R1 > num_rows_R)
    num_rows_R = num_rows_R1;
end
    

num_rows_I = max(sourceI);

% initialize the matrix with max number of nodes
A = zeros(num_rows_R,num_rows_R);

% a function that creates matrix A 
A = createA(nodeIR,nodeJR,A,values);


% initialize b
b = zeros(num_rows_I,1);

% create matrix b
b = createb(sourceI,sourceJ,current,b);

%% Print Node Voltages

answers = A\b;
k=1;
for i = 1:length(answers)
    fprintf('Node %.f is at %.5f volts\n',k,answers(i))
    k=k+1;
end

end

