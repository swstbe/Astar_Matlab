function i_min = min_fn(OPEN)
%Function to return the Node with minimum fn
% This function takes the list OPEN as its input and returns the index of the
% node that has the least cost
    temp_array = [];
    k = 1;
    open_count = size(OPEN,1);
    for j=1: open_count
        if OPEN(j,1) == 1
            temp_array(k,:)=[OPEN(j,:),j];
            k=k+1;
        end
    end
    
    if size(temp_array) ~= 0
        [min_fn,min_index]=min(temp_array(:,8));%get the Index of the smallest node in temp array
        i_min=temp_array(min_index,9);%Index of the smallest node in the OPEN array
    else
        i_min=-1;%The temp_array is empty i.e No more paths are available.
    end
end