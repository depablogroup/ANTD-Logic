%
%

nfile=[200:300];

x0=300;
xd=10;
n0=[1;0];

Nleft=0;
Nright=0;
Thleft1=[];
Thright1=[];
Th1=[];
Thleft2=[];
Thright2=[];
Th2=[];
for ifile=nfile
    dposp=load(['dposp' num2str(ifile)]);
    dposm=load(['dposm' num2str(ifile)]);
    nd=size(dposm,1);
    
    nleft=sum(dposp(:,1)<x0);
    nright=sum(dposp(:,1)>x0);
    Nleft=Nleft+nleft;
    Nright=Nright+nright;
    
    for i=1:nd
        if dposp(i,1)<x0 && x0-dposp(i,1)<xd
            t=dposp(i,4:5)*n0;
            Thleft1=[Thleft1 acos(t)];
        elseif dposp(i,1)>x0 && dposp(i,1)-x0<5*xd
            t=dposp(i,4:5)*n0;
            Thright1=[Thright1 acos(t)];
        elseif dposp(i,1)>10*xd && x0-dposp(i,1)<10*xd
            t=dposp(i,4:5)*n0;
            Th1=[Th1 acos(t)];
        end
        if dposm(i,1)<x0 && x0-dposm(i,1)<xd
            t1=dposm(i,4:5)*n0;
            t2=dposm(i,7:8)*n0;
            t3=dposm(i,10:11)*n0;
            t=max([t1 t2 t3]);
            Thleft2=[Thleft2 acos(t)];
        elseif dposm(i,1)>x0 && dposm(i,1)-x0<xd
            t1=dposm(i,4:5)*n0;
            t2=dposm(i,7:8)*n0;
            t3=dposm(i,10:11)*n0;
            t=max([t1 t2 t3]);
            Thright2=[Thright2 acos(t)];
        elseif dposm(i,1)>12*xd && x0-dposm(i,1)<12*xd
            t1=dposm(i,4:5)*n0;
            t2=dposm(i,7:8)*n0;
            t3=dposm(i,10:11)*n0;
            t=max([t1 t2 t3]);
            Th2=[Th2 acos(t)];
        end
    end
end

Thleft1=Thleft1/pi*180;
Thright1=Thright1/pi*180;
Th1=Th1/pi*180;
Thleft2=Thleft2/pi*180;
Thright2=Thright2/pi*180;
Th2=Th2/pi*180;

Th=[Thleft2 Thright2];

figure(5);
fs=20;

ddeg=4;
[N,edges] = histcounts(Th,0:ddeg:60);
X=0.5*(edges(1:end-1)+edges(2:end));
[N2,edges2] = histcounts(Th2,0:ddeg:60);
X2=0.5*(edges2(1:end-1)+edges2(2:end));

plot(X,N/sum(N)*180/ddeg/pi,'rs-',X2,N2/sum(N2)*180/ddeg/pi,'b^-','linewidth',1);
lgd=legend(['$|x|<$' num2str(xd) '$\xi$'],'$x<<0$');
set(lgd,'box','off','interpreter','latex');
ylim([0 5])
set(gca,'fontsize',fs);
xlabel('$\phi (^\circ)$','fontsize',fs,'interpreter','latex')
ylabel('pdf','fontsize',fs,'interpreter','latex')