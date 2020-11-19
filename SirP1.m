clear all;
clc;
s = input('Susceptible: ');
i = input('Infected: ');
r = input('Recovered: ');
beta = input('beta: ');
mu = input('mu: ');
t1 = input('Starting from what day? ');
t2 = input('How many total days? ');

X0 = [s,i,r];

N = sum(X0);
delta_time = t2 - t1;

[T, Y] = ode45(@(t, y) SIR(t, y, beta, mu), [t1 t2], X0);

plot(T,Y(:,1),'-b','linewidth',2);
hold on;
plot(T,Y(:,2),'-m','linewidth',2);
plot(T,Y(:,3),'-r','linewidth',2);
xlabel('Time(days)');
ylabel('Population');
legend('Susceptible','Infected','Removed');
hold off
disp(' ------------------------------------------------------------------- ');
disp(' ------------------------------------------------------------------- ');
No = ['Population:                   ', num2str(N)];
disp(No);
G = ['Susceptible:                  ', num2str(s)];
disp(G);
H = ['Infected:                     ', num2str(i)];
disp(H);
I = ['Recovered:                    ', num2str(r)];
disp(I);
Q = ['Total Days:                   ', num2str(t2)];
disp(Q);
U = ['Per Capita Contact Rate:      ', num2str(beta)];
disp(U);
E = ['Per Capita Recovered Rate:    ', num2str(mu)];
disp(E);
M = ['Total days:                   ', num2str(t2)];
disp(M);
C = ['Days on the Graph:            ',num2str(delta_time)];
disp(C);
disp('Graph attached on left');

close all
h = animatedline;
h.Color = 'b';
h.LineWidth = 2;
h2 = animatedline;
h2.Color = 'm';
h2.LineWidth = 2;
h3 = animatedline;
h3.Color = 'r';
h3.LineWidth = 2;
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize', [10 10]);
set(gcf,'PaperPosition',[0.5 0.5 0.7 0.7]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'color','w');
% plot(T,Y(:,1),'w')
% plot(T,Y(:,2),'w')
% plot(T,Y(:,3),'w')
hold on;


axis([t1,500,0,N])
ylabel('Population','FontSize',20)
xlabel('Time (days)','FontSize',20)
title({'Spread of Ebola Virus in Sierra Leone';'Starting December 14th, 2014'})
% axis square;
box on;
set(gca,'LineWidth',3);   % Axis Width
set(gca,'FontSize',20);  % Axis font size
% set(gca,'FontWeight','Bold');

% legend location best

x = T;
y = Y;
for k = 1:length(x)
    addpoints(h,x(k),y(k,1));
    addpoints(h2,x(k),y(k,2));
    addpoints(h3,x(k),y(k,3));
    drawnow
    pause(.1)
end
legend('Susceptible','Infected','Removed','Location','Best')
legend boxoff




