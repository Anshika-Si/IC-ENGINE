%% (Yt-1)/Xt = 2/(1+Xt)^2    ---------   equation_1
%% Yt = 2*Xt/(1+Xt)          ---------   equation_2
%% finding variable will be a matrix (s)=[Xt,Yt] => s(1) = Xt and s(2) = Yt;
func=@(s) [((1+s(1)).^2).*(s(2)-1)-2.*s(1);
            ((1+s(1)).*s(2))-2.*s(1)];
initial_guess=[1;1];
answer= fsolve(func,initial_guess);
disp(answer);     % answer = [Xt,Yt] = POINT OF TANGENCY
Xt = answer(1); Yt = answer(2);

SLOPE = 2/(1+Xt)^2;     % slope of tangent
  
% Equation of tangent through point A(0,1) using straight line eqn :-
% y=slope*x + 1

                                       % PLOTTING
X_val_1 =linspace(-1,10,100);
Y_val_1= (2.*X_val_1)./(1+X_val_1);

X_val_2 = linspace(0,10,100);
Y_val_2=(SLOPE.*X_val_2)+1;

plot(X_val_1,Y_val_1);
hold on
plot(X_val_2,Y_val_2);
title("Tangent to the Curve");
xlabel("x");
ylabel("y(x)");

