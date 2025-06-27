
   % PROCESS 1

% let number of moles of gas =1
p1= 1; t1=70+273;
t2=150+273;  
R=0.0821; Cp=2.5*R ;  Cv=1.5*R;
%% for adiabatic process
%pv^gamma = const; gamma = cp/cv; p^(gamma-1)*(t^gamma) = const
gamma = Cp/Cv;
p2=p1*((t1/t2)^(gamma/(1-gamma)));

q1=0;  fprintf('q1=%.2f \n',q1);
w1=(R/(1-gamma))*(t2-t1);   fprintf('w1=%.2f \n',w1);
u1=-w1;  fprintf('u1=%.2f \n',u1);
h1=u1+'R*(t2-t1);  fprintf('h1=%.2f \n',h1);

%PLOTTING
v1=(R*t1)/p1;
P_val_1=linspace(p1,p2,100);
% pv^gamma = const=>v^gamma =const/p=>log(v) =log(const/p)/gamma  =>take
% exp on both sides to get v
V_val_1 = zeros(1,100);
const_adia= p1*(v1^gamma);
for i = 1:100
    V_val_1(i) = exp((1/gamma)*log(const_adia/P_val_1(i)));
end
figure(1); plot(V_val_1,P_val_1);  title("P-V curve for Process 1"); xlabel("V"); ylabel("P");
P_val_1=linspace(p1,p2,100);
const=p1*((t1)^(gamma/(1-gamma)));
T_val_1 =zeros(1,100);
for i=1:100
T_val_1=exp(((1-gamma)/gamma)*log(const/P_val_1(i)));
end
figure(2); plot(T_val_1+P_val_1*100,P_val_1);  title("P-T curve for Process 1"); xlabel("T"); ylabel("P");
figure(3); plot(V_val_1,T_val_1+V_val_1*0); title("T-V curve for Process 1"); xlabel("V"); ylabel("T");

% work done using the area under the PV curve using Trapz
area_1=trapz(V_val_1,P_val_1);
fprintf('work done for process_1 using the area under the PV curve using Trapz= %.2f \n\n',area_1);


     % PROCESS 2

t3=70+273;
p3=p2 ;  % cooled at constant pressure

u2=Cv*(t3-t2);  fprintf('u2=%.2f \n',u2);
q2=Cp*(t3-t2);   fprintf('q2=%.2f \n',q2);
w2=q2-u2;    fprintf('w2=%.2f \n',w2);
h2=u2+R*(t3-t2);    fprintf('h2=%.2f \n',h2);

 % PLOTTING
v2=v1*((p1/p2)^(1/gamma));
v3=R*t3/p3;
P_val_2=p3;
V_val_2=linspace(v2,v3,100);
P_val_2=P_val_2+V_val_2*0;
figure(4);  plot(V_val_2,P_val_2); title("P-V curve for Process 2"); xlabel("V"); ylabel("P");
T_val_2=linspace(t2,t3,100);
figure(5);  plot(T_val_2,P_val_2+V_val_2*0); title("P-T curve for Process 2"); xlabel("T"); ylabel("P");
figure(6);  plot(V_val_2,T_val_2); title("T-V curve for Process 2"); xlabel("V"); ylabel("T");

% work done using the area under the PV curve using Trapz
area_2=trapz(V_val_2,P_val_2);
fprintf('work done for process_2 using the area under the PV curve using Trapz= %.2f \n\n',area_2);

     % PROCESS 3

p4=1; t4 =70+273; % ISOTHERMAL 
% dw = pdv=nRTdv/v=RTdv/v=RTlnv => delta(work_done_iso) =
% RTln(v2/v1)=RTln(p1/p2)=> p1v1=p2v2=const =>PV=nRT

u3=0;     fprintf('u3=%.2f \n',u3);
w3=R*t4*log(p3/p4);    fprintf('w3=%.2f \n',w3);
q3=w3;      fprintf('q3=%.2f \n',q3);
  
% Plotting
P_val_3=linspace(p3,p4,100);
constant=p3*v3;    % PV = const
V_val_3=constant./P_val_3;
figure(7);  plot(V_val_3,P_val_3); title("P-V curve for Process 3"); xlabel("V"); ylabel("P");
T_val_3=t4;
figure(8);  plot(T_val_3+P_val_3*0,P_val_3); title("P-T curve for Process 3"); xlabel("T"); ylabel("P");
figure(9);  plot(V_val_3,T_val_3+V_val_3*0); title("T-V curve for Process 3"); xlabel("V"); ylabel("T");

% work done using the area under the PV curve using Trapz
area_3=trapz(V_val_3,P_val_3);
fprintf('work done for process_3 using the area under the PV curve using Trapz= %.2f \n\n',area_3);
