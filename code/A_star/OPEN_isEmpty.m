function value = OPEN_isEmpty(openlist)
    sizelist = size(openlist,1);
    value = 1;
    for i=1:1:sizelist
       if openlist(i,1) ~= 0
          value = 0;
          break;
       end
    end
end