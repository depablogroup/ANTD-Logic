% plot elastic energy of cross channel
% stripe: src6-2d-maze4/trial31/z0.0035r1
% L:      src6-2d-maze4/trial31/z0.0035r3
%

clear;
load stripe;
load L;
load cross;
fs=20;
lw=1.5;

figure(2);clf
nn=1:42;
nn2=1:30;

nn=1:50;
nn2=1:40;

t0=2.5;
e0=1e-11*1e-6/(1.38e-23*300);

hold on
plot((nn-nn(1))*t0,(stripe(nn,3)-stripe(1,3))*e0,'b-','linewidth',lw)
%plot((nn-nn(1))*t0,L(nn,3)*e0,'r-','linewidth',lw)
plot((nn2-nn2(1))*t0,(cross(nn2,3)-cross(1,3))*e0,'m-','linewidth',lw)
hold off
xlabel('t/$\tau$','interpreter','latex','fontsize',fs);
ylabel('$\Delta E_{el}/k_BT$','interpreter','latex','fontsize',fs);
set(gca,'fontsize',fs);
lgd=legend('stripe','cross');
set(lgd,'location','southeast','box','off');
box on
xlim([0 100])
xlim([0 75])