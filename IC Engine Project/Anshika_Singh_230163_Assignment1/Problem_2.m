                                               %PROBLEM 2

y1=@(x) 2.*x+1;
y2=@(x) (2.*x)./(1+0.2.*x);

% 1st part
Y_sum =@(x) y1(x)+y2(x);  % Y=y1+y2
derivative=2;   % dy1/dx =2
Fn_1=@(x) (1./Y_sum(x)).*(derivative);   % multiplied by derivative because we are differentiating with respect to dy1
integral_answer_1=integral(Fn_1,0,15);
disp(integral_answer_1);

%2nd part
Y_diff =@(x) y1(x)-y2(x);  % Y=y1+y2
Fn_2=@(x) (1./Y_diff(x)).*(derivative);   % multiplied by derivative because we are differentiating with respect to dy1
integral_answer_2=integral(Fn_2,0,15);
disp(integral_answer_2);
