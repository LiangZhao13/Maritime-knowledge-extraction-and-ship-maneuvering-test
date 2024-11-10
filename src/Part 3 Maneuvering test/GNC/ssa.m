function angle = ssa(angle,unit)
% SSA is the "smallest signed angle" or the smallest difference between two
% angles. Examples:
%
% angle = ssa(angle) maps an angle in rad to the interval [-pi pi) 
% angle = ssa(angle,'deg') maps an angle in deg to the interval [-180 180)
%__________________________________________________________________________

if (nargin == 1)
    angle = mod( angle + pi, 2 * pi ) - pi; 
elseif strcmp(unit,'deg')
    angle = mod( angle + 180, 360 ) - 180; 
end
    
