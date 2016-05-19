function [ b ] = createb( sourceI,sourceJ,currents,b )

count = length(sourceI);

for i = 1:count
    f = sourceI(i); %this is the node that gets current
    g = sourceJ(i); %this is the node that is behind the current source
    I = currents(i); %source current
    
    if(f ~=0 && g ~= 0)
        b(f,1) = b(f,1) + I;
        b(g,1) = b(g,1) - I;
    elseif (f>0 && g==0)
        b(f,1) = b(f,1) + I;
    else 
        b(g,1) = b(g,1) - I;
    end
    
end

end

