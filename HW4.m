p_a = 0.012;
sum = 0;
vecx = zeros(1503,1);
vecy = zeros(1503,1);
for i=1:1503;
R = poissrnd(160);
	G = (rand(R)<p_a);
	G = G.*~(eye(size(G)) & G==1);
	G = triu(G) + triu(G)';
	GG = G^3;
	X= trace(GG)/6;
	Y = nchoosek(R,3);
	vecx(i) = X;
	vecy(i) = X/Y;
	if X<2
		sum = sum +1;
	end
end
prob_a = sum/1503
X_a = mean(vecx)
Y_a = mean(vecy)
stdx_a = std(vecx)
stdy_a = std(vecy)




p_b = 0.79;
sum_b = 0;
vecx_b = zeros(1503,1);
vecy_b = zeros(1503,1);
for i=1:1503;
	R_b = poissrnd(160);
	G_b = (rand(R_b)<p_b);
	G_b = G_b.*~(eye(size(G_b)) & G_b==1);
	G_b = triu(G_b) + triu(G_b)';
	GG_b = G_b^3;
	Xb = trace(GG_b)/6;
	Yb = nchoosek(R_b,3);
	vecx_b(i) = Xb;
	W = Xb/Yb;
	vecy_b(i) = W;
	if W>0.5;
		sum_b = sum_b + 1;
	end
end
prob_b = sum_b/1503
X_b = mean(vecx_b)
Y_b = mean(vecy_b)
stdx_b = std(vecx_b)
stdy_b = std(vecy_b)