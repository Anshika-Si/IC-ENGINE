%% x^2 + y^2 = 4 (circle)
%% parabola x^2-1=y;
%% finding variable will be a matrix (s)=[x,y] => s(1) = x and s(2) = y;
func_new_1 =  @(s)[s(1).^2+s(2).^2-4;
                      s(1).^2-s(2)-1];

initial_guess_2 = [1;1];
solution = fsolve(func_new_1,initial_guess_2);
disp(solution);