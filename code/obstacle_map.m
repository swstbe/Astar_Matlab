function map = obstacle_map(obstacle_ratio,xStart,yStart,xTarget,yTarget,MAX_X,MAX_Y)
%This function returns a map contains random distribution obstacles.
%该函数返回的map第一行记录了起始坐标点，最后一行记录了目标坐标点，中间记录了所有障碍物坐标点
    rand_map = rand(MAX_X,MAX_Y);
    map = [];
    map(1,1) = xStart;
    map(1,2) = yStart;
    k=2;
    for i = 1:1:MAX_X
        for j = 1:1:MAX_Y
            if( (rand_map(i,j) < obstacle_ratio) && (i~= xStart || j~=yStart) && (i~= xTarget || j~=yTarget))
                map(k,1) = i;
                map(k,2) = j;
                k=k+1;
            end    
        end
    end
    map(k,1) = xTarget;
    map(k,2) = yTarget;
end
