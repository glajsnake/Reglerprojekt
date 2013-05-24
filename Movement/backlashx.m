function offx = backlashx(newoffx)
persistent peroffx;


if nargin == 1
   peroffx = newoffx;
end

offx = peroffx;