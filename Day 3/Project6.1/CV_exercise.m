%% Biochemical Reaction Networks exercises

% set up initial conditions
Ptot = 100;
Ktot = 100;
A0 = 0;
I0 = 0;
AP0 = 50;
IK0 = 50;

% set rates
kAon = 0.1;
kAoff = 0.5;
kAcat = 0.2;
kIon = 0.4;
kIoff = 0.1;
kIcat = 0.5;

% create differential equations
dAdt = @(A,I,AP,IK) (-kAon*A*(Ptot-AP) + kAoff*AP + kAcat*IK);
dIdt = @(A,I,AP,IK) (-kIon*I*(Ktot-IK) + kIoff*IK + kIcat*AP);
dAPdt = @(A,I,AP,IK) (kAon*A*(Ptot-AP) - kAoff*AP - kIcat*AP);
dIKdt = @(A,I,AP,IK) (kIon*I*(Ktot-IK) - kIoff*IK - kAcat*IK);

dxdt = @(t,x) [ dAdt(x(1),x(2),x(3),x(4));
        dIdt(x(1),x(2),x(3),x(4)); 
        dAPdt(x(1),x(2),x(3),x(4));
        dIKdt(x(1),x(2),x(3),x(4)) ];
    
% solve system
[T,X] = ode45(dxdt,[0,100],[A0,I0,AP0,IK0]);

% plot
figure(1); clf; hold on; box on;
plot(T,X,'LineWidth',2);
plot(T,sum(X,2),'--k','LineWidth',2);

legend('A', 'I', 'AP','IK','sum');