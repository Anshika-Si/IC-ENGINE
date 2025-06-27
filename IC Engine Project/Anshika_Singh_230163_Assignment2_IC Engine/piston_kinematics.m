function [V]=piston_kinematics(bore,stroke,rod_length,cr,start_crank,end_crank)
a=stroke/2;
R=rod_length/a;
V_s=(pi/4)*bore^2*stroke;
V_c=V_s/(cr-1);
angle=linspace(start_crank,end_crank,100);

%formula
term1=0.5*(cr-1);
term2=R+1-cosd(angle);
term3=(R^2-sind(angle).^2).^0.5;
V=(1+term1*(term2-term3)).*V_c;
end
