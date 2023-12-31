function [Path_found,OPEN,path] = A_star_search(map,MAX_X,MAX_Y)
    %addpath 'A_star';
%This part is about map/obstacle/and other settings
    %pre-process the grid map, add offset
    size_map = size(map,1); %障碍物的数量加2（起始点和目标点）
    Y_offset = 0;
    X_offset = 0;
    
    %Define the 2D grid map array.
    %Obstacle=-1, Target = 0, Start=1
    MAP=2*(ones(MAX_X,MAX_Y));
    
    %Initialize MAP with location of the target
    xvalue=floor(map(size_map, 1)) + X_offset;
    yvalue=floor(map(size_map, 2)) + Y_offset;
    xTarget=xvalue; %map的最后一行保存了目标点的坐标位置
    yTarget=yvalue;
    MAP(xvalue,yvalue)=0;
    
    %Initialize MAP with location of the obstacle
    for i = 2: size_map-1 %遍历障碍物坐标
        xvalue=floor(map(i, 1)) + X_offset;
        yvalue=floor(map(i, 2)) + Y_offset;
        MAP(xvalue,yvalue)=-1;
    end 
    
    %Initialize MAP with location of the start point
    xvalue=floor(map(1, 1)) + X_offset;
    yvalue=floor(map(1, 2)) + Y_offset;
    xStart=xvalue;
    yStart=yvalue;
    MAP(xStart,yStart)=1;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %LISTS USED FOR ALGORITHM
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %OPEN LIST STRUCTURE
    %--------------------------------------------------------------------------
    %IS NODE ON LIST? 1/0 |X value |Y value |Parent X value |Parent Y value |h(n) |g(n)|f(n)|
    %--------------------------------------------------------------------------
    OPEN=[];
    %CLOSED LIST STRUCTURE
    %--------------
    %X val | Y val |
    %--------------
    % CLOSED=zeros(MAX_VAL,2);
    CLOSED=[];

    %Put all obstacles on the Closed list
    k=1;%Dummy counter
    for i=1:MAX_X
        for j=1:MAX_Y
            if(MAP(i,j) == -1)
                CLOSED(k,1)=i;
                CLOSED(k,2)=j;
                k=k+1;
            end
        end
    end
    CLOSED_COUNT=size(CLOSED,1);
    %set the starting node as the first node
    xNode=xStart;
    yNode=yStart;
    OPEN_COUNT=1;
    goal_distance=distance(xNode,yNode,xTarget,yTarget);
    path_cost=0;
    OPEN(OPEN_COUNT,:)=insert_open(xNode,yNode,xNode,yNode,goal_distance,path_cost,goal_distance);

    
    Path_found = 0;


%This part is your homework
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    while(~OPEN_isEmpty(OPEN)) %you have to dicide the Conditions for while loop exit 
        node_fn_min_index = min_fn(OPEN);
        OPEN(node_fn_min_index,1) = 0;
        
        node_x = OPEN(node_fn_min_index,2);
        node_y = OPEN(node_fn_min_index,3);
        node_gn = OPEN(node_fn_min_index,7);
        
        CLOSED_COUNT=CLOSED_COUNT+1;
        CLOSED(CLOSED_COUNT,1)=node_x;
        CLOSED(CLOSED_COUNT,2)=node_y;
        if node_x == xTarget && node_y == yTarget
            Path_found = 1;
            break; 
        end
        
         %IS NODE ON LIST? 1/0 |X value |Y value |Parent X value |Parent Y value |h(n) |g(n)|f(n)|
        
        exp_array = expand_array(node_x,node_y,node_gn,xTarget,yTarget,CLOSED,MAX_X,MAX_Y);
        n_neighbor = size(exp_array,1);
        for i = 1:1:n_neighbor
            x_value  = exp_array(i,1);
            y_value  = exp_array(i,2);
            h_value  = exp_array(i,3);
            g_value  = exp_array(i,4);
            f_value  = exp_array(i,5);
            index  = is_inOPEN(x_value,y_value,OPEN);
            if index > 0
                if g_value < OPEN(index,7)
                    OPEN(index,7) = g_value;
                    OPEN(index,4) = node_x;
                    OPEN(index,5) = node_y;
                end
            else
                OPEN_COUNT = OPEN_COUNT +1;
                OPEN(OPEN_COUNT,:) = insert_open(x_value,y_value,node_x,node_y,h_value,g_value,f_value);
            end
           
        end
     %
     %finish the while loop
     %
    end %End of While Loop

    %Once algorithm has run The optimal path is generated by starting of at the
    %last node(if it is the target node) and then identifying its parent node
    %until it reaches the start node.This is the optimal path
    
    %
    %How to get the optimal path after A_star search?
    %please finish it
    %
   
    
    path = [];
    x_value = xTarget;
    y_value = yTarget;
    if Path_found == 1
        while true
            path = [x_value,y_value;path];
            par_index = parent_index(x_value,y_value,OPEN);
           
            x_value = OPEN(par_index,2);
            y_value = OPEN(par_index,3);

            if x_value == xStart && y_value == yStart
                path = [x_value,y_value;path];
                break;
            end
        
        end
    end
    num = size(OPEN,1);

    disp(['OPEN_LIST中的节点数量：',num2str(num)]);

end
