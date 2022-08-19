function out = nancount(arr)
out = 0;
arr = reshape(arr,1,[]);
for i = 1 : length(arr)
    if isnan(arr(i))
        out = out + 1;
    end
end
end

