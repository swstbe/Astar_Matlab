function new_row = insert_open(xvalue,yvalue,parent_xvalue,parent_yvalue,hn,gn,fn)
%Function to Populate the OPEN LIST
%OPEN LIST FORMAT
%--------------------------------------------------------------------------
%IS NODE ON LIST 1/0 |X value |Y value |Parent X value |Parent Y value |h(n) |g(n)|f(n)|
%-------------------------------------------------------------------------
%
%   Copyright 2009-2010 The MathWorks, Inc.
    new_row=[1,8];
    new_row(1,1)=1;
    new_row(1,2)=xvalue;
    new_row(1,3)=yvalue;
    new_row(1,4)=parent_xvalue;
    new_row(1,5)=parent_yvalue; 
    new_row(1,6)=hn;
    new_row(1,7)=gn;
    new_row(1,8)=fn;

end