% original name: plot_a_p_traj2
%
clear;
fs=20;
lw=1;
z=0.001;
shift=7;
aa=0.5;
ap=10;

p=load(['p' num2str(z) '/dposp']);
a1=load(['a' num2str(z) 'l/dpospA']);
a2=load(['a' num2str(z) 'l/dpospB']);
pp=load(['pp' num2str(z) '/dposp']);

x0=69;

figure(1);clf;
hold on
plot((0:length(a1)-1)*aa,a1(:,1)-x0,'b^-','markerfacecolor','b',...
    'linewidth',lw)
plot((shift+(0:length(a2)-1))*aa,a2(:,1)-x0,'r^-','linewidth',lw)
plot((0:length(p)-1)*ap,p(:,1)-x0,'ko-','markerfacecolor','k',...
    'linewidth',lw)
plot((0:length(pp)-1)*ap,pp(:,1)-x0,'co-','linewidth',lw)
patch([0 200 200 0],[0 0 80 80],'white','facecolor','blue','facealpha','0.1')
axis([0 200 -12 108])
xlabel('t/$\tau$','fontsize',fs,'interpreter','latex')
ylabel('$x$/$\xi$','fontsize',fs,'interpreter','latex')
set(gca,'fontsize',fs);
lgd=legend('original, gate-on','tunneled, gate-on','gate-off','no gate');
set(lgd,'box','off','Position',[0.68 0.45 0.1 0.2])
box on
set(gca,'fontsize',fs);

% axes('Position',[0.5 0.25 0.35 0.35]);
% plot((0:length(p)-1)*af*aa,p(:,1)-x0,'ko-','markerfacecolor','k')
% axis([0 200 -12 50])