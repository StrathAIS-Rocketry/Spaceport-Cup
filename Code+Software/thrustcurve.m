t0 = 0;
f0 = 0;

t1 = 0.021;
f1 = 3639;

t2 = 0.049;
f2 = 3360;

t3 = 0.111;
f3 = 3300.9;

t4 = 0.374;
f4 = 3478.64;


h = 0.01;

t_data = 0:0.01:8;

f_data = linspace(f0,f1,round(t1/h)+1);
f_data = f_data(1:length(f_data)-1);
f_data = [f_data linspace(f1,f2,round(t2/h)+1)];
f_data = f_data(1:length(f_data)-1);
f_data = [f_data linspace(f2,f3,round(t3/h)+1)];
f_data = f_data(1:length(f_data)-1);
f_data = [f_data linspace(f3,f4,round(t4/h)+1)];

f_data(i)
