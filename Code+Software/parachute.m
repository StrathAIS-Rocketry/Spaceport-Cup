     % Input data
    
    Ad =0.164 ;      %effective area of the drogue chute
    Am = 7.3;   %effective area of the main chute
    As = 0.018; %initial effective area of the fuselage
    M = 20;    %the spacecraft mass (kg)
    He = 3;   %the initial height (km)
    Hm= 0.5;       %the main chute deployment height (km)
    U=0;        % initial velocity (m/s)
    Cd=1.5; %drag coefficiant for drogue chute
    Cp=2.1;      % drag coefficient for main chute
    Tstep=0.01;  % time step (s)
    
    % Increment initialisation:
    i=1; H(i)=He; v(i)=U; s(i)=0; t(i)=0; a(i)= (40*10^7)/(6371+H(i))^2;
    e(i)=As;
    
   
  
   
    %Fall with drogue
    
    while (H(i)>Hm)
        p(i)=1.225; % Density
        FD(i)=0.5*Cd*p(i)*e(i)*v(i)*v(i); % Resistant force
        g(i)=9.81; % Gravitational acceleration
        %e(i+1)=
        
        if e(i)>=Ad
            e(i+1)=Ad;
        else
            e(i+1)=e(i)+Ad/1000;
            
            
        end
        
        
        
        
        a(i+1)=g(i)-FD(i)/M;          % Spacecraft acceleration
        s(i+1)=s(i)+0.001*(v(i)*Tstep+0.5*a(i+1)*Tstep^2); % Displacement
        v(i+1)=v(i)+a(i+1)*Tstep;     % Velocity
        t(i+1)=t(i)+Tstep;            % Next time moment
        H(i+1)=He-s(i+1);             % Height
        i=i+1;
        continue
    end
    % %Fall with main chute
    
    while (H(i)>=0)
        p(i)=1.225; % Density
        FD(i)=0.5*Cp*p(i)*e(i)*v(i)*v(i); % Resistant force
        g(i)=9.81; % Gravitational acceleration
        %e(i+1)=e(i)+Am/700;
        if e(i)>=Am
            e(i+1)=Am;
        else
            e(i+1)=e(i)+Am/1000;
            
            
        end
        
        a(i+1)=g(i)-FD(i)/M;          % Spacecraft acceleration
        s(i+1)=s(i)+0.001*(v(i)*Tstep+0.5*a(i+1)*Tstep^2); % Displacement
        v(i+1)=v(i)+a(i+1)*Tstep;     % Velocity
        t(i+1)=t(i)+Tstep;            % Next time moment
        H(i+1)=He-s(i+1);             % Height
        i=i+1;
        continue
    end
% Display graphs 
% In one Diagram
subplot(2,2,1); plot(t,s);  % 1st graph - Displacement
grid; axis([0 169 0 4]);
title('The dependence of displacement on time s(t), km'), 
ylabel('s(t), km'),
xlabel('t, s')
subplot(2,2,2); plot(t,H);  % 2nd graph - Height
grid; axis([0 169 0 4]);
title('The dependence of height on time H(t), km'), 
ylabel('H(t), km'),
xlabel('t, s')
subplot(2,2,3); plot(t,v);  % 3rd graph - Velocity
grid; axis([0 169 0 50]);
title('The dependence of velocity on time v(t), m/s'), 
ylabel('v(t) ), m/s'),
xlabel('t, s')
subplot(2,2,4); plot(t,a);  % 4th graph - Acceleration
grid; axis([0 169 -20 10]);
title('The dependence of acceleration on time a(t), m/s^2'), 
ylabel('a(t), m/s^2'),
xlabel('t, s'); 