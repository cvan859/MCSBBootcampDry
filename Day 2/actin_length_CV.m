length(1) = 10;
t_end = 100

for t = 1:t_end
    r = randi(2);
    r = r-1;
    if (r == 0) && (length(t) >1)
        length(t+1) = length(t) -1;
    elseif (r == 1) 
        length(t+1) = length(t) +1;        
    elseif (r == 0) && (length(t) <=1)
        length(t+1) = length(t)
    end
end

figure;
plot([0:t_end],length);
xlabel('Time'); ylabel('Polymer Length');
set(gca, 'fontsize', 20);



%%
% p=r*dt for monte carlo

steps = 1000;
length(1) = 10;

kon = .41287629312;
koff = .3000293846237;
dt = (1/max(kon,koff))*(1/100);
pon = kon*dt;
poff = koff*dt;

on_happens =0
off_happens =0

for t = 1:steps
    
    if rand() < pon
        length(t+1) = length(t)+1;
        on_happens = 1;
    end
    if rand() < poff
        length(t+1) = length(t)-1;
        off_happens = 1;
    else 
        length(t+1) = length(t);
    end
end

%disp(p/steps)

figure;
plot([0:steps],length);
xlabel('Time'); ylabel('Polymer Length');
set(gca, 'fontsize', 20, 'Ylim', [0 max(length)*1.1]);


%%
% make a gamma, exponential, and Weibull distributions 
% on top of the histogram formed by actin_lengths.mat

load('actin_lengths.mat')
histogram(sizes, 'Normalization', 'pdf')
ylabel('Number of filaments')
xlabel('Length (nm)')

% norm = normpdf([1:1000]);
gam = gampdf([1:150],8,4);
wbl = wblpdf([1:150],33.5,3);
hold on;
plot([1:150],gam);
hold on;
plot([1:150],wbl);



%%

[f,x]=ecdf(sizes);

% gamma distribution
gamsse=@(params)sumsquarederrors(@gamcdf,params,sizes);
start_params = [8, 4];
bestgamcdf = fminsearch(gamsse,start_params);

%weibull distribution
wblsse=@(params)sumsquarederrors(@wblcdf,params,sizes);
start_params = [33.5, 3];
bestwblcdf = fminsearch(wblsse,start_params);

figure;
stairs(x,f, 'DisplayName', 'Sizes Data'); hold on;
xlabel('Length (nm)'); ylabel('Cumulative Probability')
plot(x,gamcdf(x, bestgamcdf(1), bestgamcdf(2)), 'DisplayName', 'Gamma Fit'); hold on;
plot(x,wblcdf(x, bestwblcdf(1), bestwblcdf(2)), 'DisplayName', 'Weibull Fit'); hold off
legend;

function sse = sumsquarederrors(fun,params,sizes)
    [f,x]=ecdf(sizes);
    y=fun(x,params(1),params(2));
    sse=sum((y-f).^2);
end
