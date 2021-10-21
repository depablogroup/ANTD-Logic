clear;
load trial2-src6_defect.dis.mat
FigHandle = figure(2);clf
set(FigHandle, 'Position', [100, 100, 630, 534]);
axes('Position',[0.15 0.15 0.8 0.8]);

ms=10;
fs=24;
lw=2;
deg=180/pi;

nd=60;
[x1,y1]=hist(th{2},nd);
[x2,y2]=hist(th{3},nd);
[x3,y3]=hist(th{9},nd);
yy=0:0.01:pi/4;
hold on

x1=smooth(x1);
x2=smooth(x2);
x3=smooth(x3);
x1=x1+200;
plot(y3*deg,x3./sum(x3)*2*nd/pi,'kv','markersize',ms)
plot(y2*deg,x2./sum(x2)*2*nd/pi,'bs','markersize',ms)
plot(y1*deg,x1./sum(x1)*2*nd/pi,'m^','markersize',ms)
%plot(yy*deg,exp(-60*yy.^2),'m-','linewidth',lw);
xlim([0 90])
set(gca,'fontsize',fs);
xlabel('$|\theta|(^\circ)$','fontsize',fs,'interpreter','latex')
ylabel('pdf','fontsize',fs,'interpreter','latex')

x0=20;
Y=(0.04:0.006:0.064)*2*nd/pi;
ta=2000;
len=0.008;
hlen=0.5*len;
for y=Y
    tth=y/max(Y)*pi/3;
    cth=cos(tth);
    sth=sin(tth);
    line([x0-ta*hlen*cth x0+ta*hlen*cth],[y-hlen*sth*2*nd/pi y+hlen*sth*2*nd/pi],...
        'linewidth',lw,'color','k')
end
y0=Y(3)-0.6*hlen*2*nd/pi;
line([x0-ta*hlen x0+ta*hlen],[y0 y0],'linestyle','--','color','k')
tth=Y(3)/max(Y)*pi/3;
tt=0:tth/10:tth;
tlen=0.8*hlen;
plot(x0-ta*0.6*hlen+ta*tlen*cos(tt),y0+tlen*sin(tt)*2*nd/pi,'r-','linewidth',lw)
text(x0+ta*0.8*hlen,y0+0.8*hlen*2*nd/pi,'$\theta$','fontsize',fs+4,'color','r',...
    'interpreter','latex','fontweight','bold')
hold off

lgd=legend('$x=-15\xi$','$x=5\xi$','$x\gg 0$');
set(lgd,'location','northeast','box','off','interpreter','latex');
%text(7.3,0.88,'$\exp(-W\xi^2\theta^2/2k_BT)$','fontsize',fs,'interpreter','latex')
box on