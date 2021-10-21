%
%

function []=plot_mdefect2(fign,x0,angle_def)
lw=3;
%fs=20;
%angle_def=0;       % whether to show definition of defects
angle_phi0=0;
%x0=-5;             % defect core x-coordinate
y0=5;
phi0=pi/24;

figure(fign);
set(gcf,'units','normalized','position',[0.1,0.1,0.7,0.7])
clf;hold on;
line([0 0],[-y0 y0],'linewidth',lw,'color','k','linestyle','--');
if angle_def==1
    if x0<0
        line([x0 0],[0 0],'linewidth',lw,'color','k','linestyle','-.');
    else
        line(2*[x0 0],[0 0],'linewidth',lw,'color','k','linestyle','-.');
    end
end


% defect triad
d=abs(x0)/cos(phi0);
for i=0:2
    phi=(i*2+1)*pi/3+phi0;
    line([x0 x0+d*cos(phi)],[0 d*sin(phi)],'linewidth',2*lw,'color','r');
end
if angle_phi0==1
    line([x0 x0+d*cos(phi0)],[0 d*sin(phi0)],'linewidth',2*lw,'color',...
        'r','linestyle','--');
end

% definition of phi0
if angle_phi0==1
    phi=(0:0.05:1)*phi0;
    x=0.45*abs(x0)*cos(phi)+x0;
    y=0.45*abs(x0)*sin(phi);
    plot(x,y,'b-','linewidth',2*lw);
    text(x0+0.5*abs(x0),0.1*y0,'$\phi_0$','color','b','fontsize',64,...
        'interpreter','latex')
end

% definition of phi
if angle_def==1
    if phi0>0
        phi=(0:0.05:1)*(phi0-pi/3);
    else
        phi=(0:0.05:1)*(pi/3-phi0);
    end
    x=0.25*abs(x0)*cos(phi)+x0;
    y=0.25*abs(x0)*sin(phi);
    plot(x,y,'b-','linewidth',2*lw);
    text(x0+0.3*abs(x0),-0.1*y0*sign(phi0),'$\phi$','color','b',...
        'fontsize',64,'interpreter','latex')
end

% defect shape outline
d=0.4*abs(x0);
dd=0.1;
Nj=abs(x0)*8;
for i=0:2
    th1=phi0+pi/3+(i*2+1)*pi/3;
    x1=d*cos(th1);
    y1=d*sin(th1);
    x=x1;
    y=y1;
    X=x1;
    Y=y1;
    for j=1:Nj
        th=-(atan2(y,x))/2+th1*1.5+pi/2;
        if j>1 && abs(th-tho)>pi/2
            th=th+pi;
        end
        x=x+dd*cos(th);
        y=y+dd*sin(th);
        X=[X x];
        Y=[Y y];
        tho=th;
    end
    line(x0+X,Y,'linewidth',lw,'color','k')
    
    x1=d*cos(th1);
    y1=d*sin(th1);
    x=x1;
    y=y1;
    X=x1;
    Y=y1;
    for j=1:Nj
        th=-atan2(y,x)/2+th1*1.5-pi/2;
        x=x+dd*cos(th);
        y=y+dd*sin(th);
        X=[X x];
        Y=[Y y];
    end
    line(x0+X,Y,'linewidth',lw,'color','k')
end

axis([-2*abs(x0) 2*abs(x0) -y0 y0])
axis equal
axis off

% director field + activity gradient force at activity boundary
d=0.5;
for y=-y0+0.5:y0-0.5
    phi=atan2(y,-x0);
    th=-phi/2+1.5*phi0+pi/2;
    line([-d*cos(th) d*cos(th)],[y-d*sin(th) y+d*sin(th)],'linewidth',lw,...
        'color','b')
    arrow([0,y],[2*1.6*d*(-0.5+cos(th)^2),y+2*1.6*d*sin(th)*cos(th)],'linewidth',...
        2*lw,'color',[0 0.5 0])
    
    if y+1>=0 && y<0 && angle_def==1 && 1==0
        line([0,d],[y y],'linewidth',lw,'linestyle','-.','color','b')
        phi=(0:0.05:1)*th;
        xx=0.75*d*cos(phi);
        yy=0.75*d*sin(phi);
        plot(xx,y+yy,'linewidth',2*lw,'linestyle','-','color','b');
        text(1.2*d,y,'$\theta$','color','b','fontsize',64,...
            'interpreter','latex')
    end
end

% coordinate
if angle_def==1
    arrow([0,0],[abs(0.3*x0),0],'linewidth',2*lw)
    arrow([0,0],[0,abs(0.3*x0)],'linewidth',2*lw)
    text(abs(0.33*x0),0.3,'$x$','fontsize',64,'color','k','interpreter','latex')
end

% activity pattern
if x0<0
    patch(2*[x0 0 0 x0],[-y0 -y0 y0 y0],'r','facealpha',0.1,'edgecolor','none')
else
    patch(-[x0 0 0 x0],[-y0 -y0 y0 y0],'r','facealpha',0.1,'edgecolor','none')
end
