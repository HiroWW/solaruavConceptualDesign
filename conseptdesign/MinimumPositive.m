function min_pos = MinimumPositive(z)
    min_pos = NaN;
    for j=1:1:length(z)
        if (isreal(z(j)) && z(j)>0)
            if isnan(min_pos)      
                min_pos = z(j);
            elseif z(j)<min_pos  
                min_pos = z(j);
            end
        else 
            %disp('coult not solve');
        end
    end
end