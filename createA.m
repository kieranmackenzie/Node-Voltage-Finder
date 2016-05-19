function [ A ] = createA( nodeI,nodeJ,A,resistance )
% iterate the function for however many values we import
count = length(nodeI);


for i = 1:count
b = nodeI(i);
c = nodeJ(i);
R = resistance(i);

% as long as it isnt 0, create your matrix
if (b ~= 0 && c ~= 0)
A(b,b) = A(b,b) + (1/R);
A(c,c) = A(c,c) + (1/R);
A(b,c) = A(b,c) - (1/R);
A(c,b) = A(c,b) - (1/R);
% if the resistor's node connects with ground dont fill in all regular
% values
elseif (b > 0 && c==0) 
A(b,b) = A(b,b) + (1/R);
else 
A(c,c) = A(c,c) + (1/R);
end
    
end 


end

