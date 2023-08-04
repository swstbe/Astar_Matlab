function map = obstacle_map(obstacle_ratio,xStart,yStart,xTarget,yTarget,MAX_X,MAX_Y)
%This function returns a map contains random distribution obstacles.
%�ú������ص�map��һ�м�¼����ʼ����㣬���һ�м�¼��Ŀ������㣬�м��¼�������ϰ��������
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
