npts = 1e6;
nmaxlist = (zeros(npts,1));

p = (-2 + (2+2).*rand(npts,1))+(-2 + (2+2).*rand(npts,1))*1i;
for ind = 1:npts
    [~,nummax] = follow_z(p(ind),c);
    nmaxlist(ind) = nummax;
end

%plot(real(r),imag(r),'o')