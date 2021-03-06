function features = segment2features(segment)
% segment2features returns a list of features in the trimmed binary image segment
% features is a vector containing 
%  [
%   1. the intensity of ones in the image
%   2. the intensity of ones above the center of mass
%   3. the intensity of ones below the center of mass
%   4. vertical symmetry (1 for perfect symmetry and 0 for none)
%   5. vertical odd symmetry
%   6. the intensity of ones left of the center of mass
%   7. the intensity of ones right of the center of mass
%   8. horizontal symmetry
%   9. horizontal odd symmetry
%   10. the intensity of ones in the x-derivative
%   11. the intensity of ones in the y-derivative
%  ]

%% find center of mass
% the center of mass is assumed to be located in the middle of the trimmed
% image, even though this is not true the result will be the same when we
% compare the features of different images. If the number of rows/columns
% the middle row/column is ignored.

hh = size(segment,1)/2;
hw = size(segment,2)/2;

if mod(hh,1) == 0.5 %then we have a odd number of rows
    top = 1:(hh-0.5);
    bottom = (hh+1.5):(2*hh);
else 
    top = 1:hh;
    bottom = (hh+1):2*(hh);
end

if mod(hw,1) == 0.5 %then we have a odd number of columns
    left = 1:(hw-0.5);
    right = (hw+1.5):(2*hw);
else 
    left = 1:hw;
    right = (hw+1):2*(hw);
end

%% intensity of ones

    ntot =  sum(segment(:))/(4 * hw * hh);
    
%% the number of ones above the center of mass

    nabove = sum(sum(segment(top,:)))/(length(top) * 2 * hw); 
    
%% the number of ones below the center of mass

    nbelow = sum(sum(segment(bottom,:))) / (length(bottom) * 2 * hw); 
    
%% vertical symmetry
    
    symy = sum(sum(segment(top,:) == segment(bottom(end:-1:1), :))) / (length(top) * 2 * hw);
    
%% vertical odd symmetry
       
    osymy = sum(sum(segment(top,:) == segment(bottom(end:-1:1), end:-1:1))) / (length(top) * 2 * hw);

    
%% the number of ones left of the center of mass

    nleft = sum(sum(segment(:,left))) / (length(left) * 2 * hh); 
    
%% the number of ones right of the center of mass

    nright = sum(sum(segment(:,right))) / (length(right) * 2 * hh);  
    
%% horizontal symmetry
    
    symx = sum(sum(segment(:,left) == segment(:,right(end:-1:1)))) / (length(left) * 2 * hh);
    
%% horizontal odd symmetry
       
    osymx = sum(sum(segment(:,left) == segment(end:-1:1,right(end:-1:1)))) / (length(left) * 2 * hh);

%% the intensity of ones in the x-derivative
    
    dxfilter = [1 -1];    
    dx = sum(sum(abs(conv2(double(segment), dxfilter)))) / (4 * hw * hh);

%% the intensity of ones in the y-derivative
    
    dyfilter = [1 -1]';    
    dy = sum(sum(abs(conv2(double(segment), dyfilter)))) / (4 * hw * hh);
    

%% The result
features = [ntot; nabove; nbelow; symy; osymy; nleft; nright; symx; osymx; dx; dy];
end
