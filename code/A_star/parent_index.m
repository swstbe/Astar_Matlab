function index = parent_index(x_value,y_value,openlist)
    size_openlist = size(openlist,1);
    index = -1;
    for i = 1:1:size_openlist
       if x_value == openlist(i,2) && y_value == openlist(i,3)
           index = i;
           break;
       end
    end
    
    parent_x_value = openlist(index,4);
    parent_y_value = openlist(index,5);
    for i = 1:1:size_openlist
       if parent_x_value == openlist(i,2) && parent_y_value == openlist(i,3)
           index = i;
           break;
       end
    end
end