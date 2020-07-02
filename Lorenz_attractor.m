%Setting initial parameters
Sigma = 10;
Beta = 8/3;
Rho = 28;
state = [1, 1, 1]; %Initial states of x, y, z
t = [0, 50]; %Time step

%Lorenz function w/ pointer
lorenz = @(t,state) [(Sigma*state(2) - Sigma*state(1)) ; (state(1)*Rho - state(1)*state(3) - state(2)) ; (state(1)*state(2) - Beta*state(3))]

%ODE solver
[t,state] = ode45(lorenz, t, state);

%Plotting
f=figure('Position', [100 100 900 600]);
plot3(state(:,1), state(:,2), state(:,3), 'c')
set(gca, 'Color', 'k')
xlabel('x');
ylabel('y');
zlabel('z');
title('Lorenz attractor');

%UI Slider
sldSigma = uicontrol('Parent', f, 'Style', 'slider', 'Position', [90 75 120 3], 'value', Sigma, 'min', -10, 'max', 30);
labelSigma = uicontrol('Parent', f, 'Style', 'text', 'Position', [132, 37, 35, 20], 'String', 'Sigma');
sldBeta = uicontrol('Parent', f, 'Style', 'slider', 'Position', [390 75 120 3], 'value', Beta, 'min', 1, 'max', 4);
labelBeta = uicontrol('Parent', f, 'Style', 'text', 'Position', [435, 37, 35, 20], 'String', 'Beta');
sldRho = uicontrol('Parent', f, 'Style', 'slider', 'Position', [690 75 120 3], 'value', Rho, 'min', 13, 'max', 43);
labelRho = uicontrol('Parent', f, 'Style', 'text', 'Position', [735, 37, 35, 20], 'String', 'Rho');

%Tracing
hold on
p = plot3(state(1,1), state(1,2), state(1,3), 'o', 'MarkerFaceColor', 'red');
hold off
axis manual

for i=1:length(state)
    p.XData = state(i,1);
    p.YData = state(i,2);
    p.ZData = state(i,3);
    drawnow
end

