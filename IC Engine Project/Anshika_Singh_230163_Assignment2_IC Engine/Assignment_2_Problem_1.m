cr=8;       % compression ratio
p1=100;        % Given p1=100kpa   
t1=30+273;   % kelvin
t3 = 1200+273;  % PEAK TEMPERATURE
v1= 0.0038;    % m^3
v2=v1/cr;    % cr=(v_max)/(v_min)   i.e cr=v1/v2
v4 = v1;  % ideal otto cycle- heat release at constant volume
v3=v2;    % ideal otto cycle- heat addition at constant volume
Cv = 0.718;   %(kJ/kg-K)
R=0.287;    gamma=1+(R/Cv); % gamma= 1.4 for air 
p2 = p1 * ( cr )^gamma;     % isoentropic compression-: P*V^gamma = constant
t2 = p2*v2*(t1)/(p1*v1);    % ideal gas equation
p3 = p2*(t3/t2);            % ideal gas equation
p4 = p3 *((v3)/(v4))^gamma;  % isoentropic expansion-: P*V^gamma = constant
t4 = p4*v4*(t3)/(p3*v3);

% thermal efficiency
Percentage_Efficiency = (1-(cr^(gamma-1))^-1)*100;
fprintf(' thermal efficiency = %.2f \n',Percentage_Efficiency);

% HEAT REJECTION
Q_out = Cv*(t1-t4);
fprintf(' heat rejected = %.2f \n',Q_out);

% NET WORK OUTPUT
W_net =trapz([v1 v2 v3 v4 v1],[p1 p2 p3 p4 p1]);
fprintf(' net work done = %.2f \n',W_net);

% Mean Effective Pressure (MEP)
V_swept = v1-v2;
MEP = W_net/(V_swept);
fprintf(' Mean Effective Pressure (MEP) = %.2f \n',MEP);

% PLOTTING
figure(1);
hold on
plot(v1,p1,'*','Color','r')
plot(v2,p2,'*','Color','r')
plot(v3,p3,'*','Color','r')
plot(v4,p4,'*','Color','r')
xlabel('Volume (m^3)');
ylabel('Pressure (KPa)');
 
figure(2);
plot([v1 v2 v3 v4 v1],[p1 p2 p3 p4 p1],'color','red');
xlabel('Volume (m^3)');
ylabel('Pressure (KPa)');