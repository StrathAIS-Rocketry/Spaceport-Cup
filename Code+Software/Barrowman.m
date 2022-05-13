%%Barrowman equations

LN = 396.5;
XP = 0;
d =161.5;
LT = 0;
dR = d;
dF = d;
Xp = 0;
CR = 308;
CT = 120;
S = 165;
Lf = 189.9;
R = d/2;
XR = 188;
XB = 2444;
N = 4;

CNN =2;
XN = 0.466*LN;

CNT = 2*((dR/d)^2 - (dF/d)^2 );
XT = 0;

%Fin terms

CNF = (1+R/(S+R))*( (4*N*(S/d)^2)/(1+sqrt(1+( (2*Lf)/(CR + CT) ^2))) );

XF = XB + (XR/3)*( (CR+2*CT)/(CR+CT) ) + (1/6)*((CR +CT)-(CR*CT/(CR+CT)) );

%CP
CNR = CNN+CNT+CNF;
X = (CNN*XN+CNT*XT+CNF*XF)/(CNR);

