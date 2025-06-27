                          
%% WITHOUT PISTON KINEMATICS

cr=8.5;       % compression ratio
p1=110;        % Given p1=100kpa   
t1=400;   % kelvin
t3 = 2800;  % PEAK TEMPERATURE
bore = 0.09;  stroke = 0.1;  rod_length = 0.14;

V_swept_piston = (pi/4) * bore^2 * stroke ;
V_clear_piston = V_swept_piston/(cr-1);
v1=V_clear_piston+V_swept_piston;
v2= V_clear_piston;    

v4 = v1;  % ideal otto cycle- heat release at constant volume
v3=v2;    % ideal otto cycle- heat addition at constant volume
gamma=1.35; 
p2 = p1 * ( cr )^gamma;     % isoentropic compression-: P*V^gamma = constant
t2 = p2*v2*(t1)/(p1*v1);    % ideal gas equation
p3 = p2*(t3/t2);            % ideal gas equation
p4 = p3 *((v3)/(v4))^gamma;  % isoentropic expansion-: P*V^gamma = constant
t4 = p4*v4*(t3)/(p3*v3);

fprintf('P1 = %0.2f ',p1); fprintf(' P2 = %0.2f ',p2); fprintf(' P3 = %0.2f ',p3); fprintf(' P4 = %0.2f \n',p4);
fprintf('T1 = %0.2f ',t1); fprintf(' T2 = %0.2f ',t2);  fprintf(' T3 = %0.2f ',t3);  fprintf('T4 = %0.2f \n\n',t4);

% thermal efficiency
Percentage_Efficiency = (1-(cr^(gamma-1))^-1)*100;
fprintf(' thermal efficiency = %.2f \n\n',Percentage_Efficiency);


% NET WORK OUTPUT
W_net =trapz([v1 v2 v3 v4 v1],[p1 p2 p3 p4 p1]);
fprintf(' net work done WITHOUT PISTON KINEMATICS = %.2f \n',W_net);

% Mean Effective Pressure (MEP)
V_swept = v1-v2;
MEP = W_net/(V_swept);
fprintf(' Mean Effective Pressure (MEP) WITHOUT PISTON KINEMATICS = %.2f \n\n',MEP);

% PLOTTING
figure(1);
hold on
plot(v1,p1,'*','Color','r')
plot(v2,p2,'*','Color','r')
plot(v3,p3,'*','Color','r')
plot(v4,p4,'*','Color','r')
xlabel('Volume (m^3)');  title(' WITHOUT PISTON KINEMATICS ');
ylabel('Pressure (KPa)');
 
figure(2);
plot([v1 v2 v3 v4 v1],[p1 p2 p3 p4 p1],'color','red');
xlabel('Volume (m^3)');  title(' WITHOUT PISTON KINEMATICS ');
ylabel('Pressure (KPa)');

%% WITH PISTON KINEMATICS

const=p1*v1^gamma;
V_compression = piston_kinematics(bore,stroke,rod_length,cr,180,0);
P_compression=const./V_compression.^gamma;

constant = p3*v3^gamma;
V_expansion = piston_kinematics(bore,stroke,rod_length,cr,0,180);
P_expansion= constant./V_expansion.^gamma;

W_net_piston = trapz([V_compression v3 V_expansion v4],[P_compression p3 P_expansion p4]);
fprintf(' net work done considering PISTON KINEMATICS = %.2f \n',W_net_piston);
MEP_piston = W_net_piston/(V_swept_piston);
fprintf(' Mean Effective Pressure (MEP) considering PISTON KINEMATICS = %.2f \n',MEP_piston);


% PLOTTING
figure(3);  xlabel('Volume (m^3)');  title(' CONSIDERING PISTON KINEMATICS '); ylabel('Pressure (KPa)');
hold on
plot(V_compression,P_compression,'Color','green');
plot(V_expansion,P_expansion,'Color','green');
plot([v2 v3],[p2,p3],'Color','blue');
plot([v4 v1],[p4 p1],'Color','blue');
plot(v1,p1,'*','Color','red');
plot(v2,p2,'*','Color','red');
plot(v3,p3,'*','Color','red');
plot(v4,p4,'*','Color','red');