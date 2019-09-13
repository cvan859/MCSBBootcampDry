%% Project 5: Discrete Logistical Growth

r = 2.5;
K = 0.6;
x0 = 0.2;
tmax = 100;

x(1) = x0;

for t = 1:tmax
    x(t+1) = x(t) + (r*(1-(x(t)/K))*x(t));
end

figure('Name', 'r=2.5, x0=5');
plot([0:tmax],x);

%% Project 5: Question 5

clearvars

K = 0.6;
x0 = 0.2;
tmax = 100;

N = [];

for r = 0:0.1:3
    x(1) = x0;
    for t = 1:tmax
        x(t+1) = x(t) + (r*(1-(x(t)/K))*x(t));
    end
    Nrun = x(end-10:end);
    N = [N; Nrun];
end

figure('Name', 'Plot N-cyles for variable r, K=0.6');
plot(0:0.1:3, N,'p');