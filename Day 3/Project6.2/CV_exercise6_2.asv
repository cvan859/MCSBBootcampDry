%% FitzHugh-Nagumo model

% set up initial conditions
v0 = 0;
w0 = -0.5;


% set rates
e = 0.08;
a = 1.0;
b = 0.2;

% create differential equations

dvdt = @(v,w) (v - (1/3)*v^3 - w);
dwdt = @(v,w) (e*(v + a - b*w));

dxdt = @(t,x) [ dvdt(x(1),x(2));
        dwdt(x(1),x(2)) ];
        
% solve system
[T,X] = ode45(dxdt,[0,100],[v0,w0]);

% plot
figure(1); clf; hold on; box on;
plot(T,X,'LineWidth',2);
plot(T,sum(X,2),'--k','LineWidth',2);
xlabel('Time');
ylabel('Energy?');

legend('voltage', 'activity of ion pumps','sum');





%%FitzHugh-Nagumo model Q3
% set up initial conditions
v0 = 0;
w0 = -0.5;
I0 = 1.0;
tStart = 40;
tStop = 47;

% set rates
e = 0.08;
a = 1.0;
b = 0.2;

% create differential equations
I = @(t) I0(t>tStart).*(t<tStop);
dvdt = @(v,w) (v - (1/3)*v^3 - w + I);
dwdt = @(v,w) (e*(v + a - b*w));

dxdt = @(t,x) [ dvdt(x(1),x(2));
        dwdt(x(1),x(2)) ];
        
% solve system
[T,X] = ode45(dxdt,[0,100],[v0,w0]);

% plot
figure(1); clf; hold on; box on;
plot(T,X,'LineWidth',2);
plot(T,sum(X,2),'--k','LineWidth',2);
xlabel('Time');
ylabel('Energy?');

legend('voltage', 'activity of ion pumps','sum');