function offy = backlashy(newoffy)
persistent peroffy;


if nargin == 1
   peroffy = newoffy;
end

offy = peroffy;