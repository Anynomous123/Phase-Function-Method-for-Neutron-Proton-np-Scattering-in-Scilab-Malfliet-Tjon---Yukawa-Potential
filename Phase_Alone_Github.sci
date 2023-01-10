mp = 938.272046 //$MeV/c^2$
mn = 939.565379 //$MeV /c^2$ 
Elab = [0.1,1,5,10,25,50,100,150,200,250,300,350]// $MeV$
ObjVar = [mn,mp,Elab];
deltaExpt=[169.32, 147.748,118.169,102.587,80.559,62.645,43.088,30.644,21.244,13.551,6.966,1.176]//3S1
Vparam = [6441.306, 1673.652, 2.323] //3S1
deltaExpt1S0=[38.43,62.105,63.689,60.038,51.011,40.644,26.772,16.791,8.759,1.982,-3.855,-8.923]//1S0
Vparam1S0 = [3596.159, 994.549, 2.096] //1S0

function [k, fac] = input(ObjVar)
    muD = (mn*mp)/(mn + mp);
    hbarc = 197.329
    fac = hbarc^2/(2*muD) //= 41.47\\
    ECoM = Elab*mn/(mn+mp) 
    k = sqrt(ECoM/fac)
endfunction

function V = Potential(r, Vparam)
    Vr = Vparam(1); Va = Vparam(2); muA = Vparam(3); 
    V = -Va.*exp(-muA.*r)./r + Vr.*exp(-2.*muA.*r)./r
endfunction

function F = f(r,delta0,Vparam)
    [k,fac] = input(ObjVar)
    V = Potential(r, Vparam)
    F = (-V.*sin(k.*r + delta0).^2)./(k.*fac)
endfunction

function deltaObt = PFMRK5(Vparam, deltaExpt)
    h=0.01; r0=0.01; rf=5; delta0 = 0
    for r = r0:h:rf
        F1 = f(r,delta0,Vparam)
        F2 = f(r+h/4,delta0 + h*F1/4,Vparam)
        F3 = f(r+h/4,delta0 + h*F1/8 + h*F2/8,Vparam)
        F4 = f(r+h/2,delta0 -h*F2/2 + h*F3,Vparam)
        F5 = f(r+3*h/4,delta0+3*h*F1/16+9*h*F4/16,Vparam)
        F6 = f(r+h,delta0-3*h*F1/7+2*h*F2/7+12*h*F3/7-12*h*F4/7+8*h*F5/7,Vparam)
        delta1 = delta0 + h*(7*F1+32*F3+12*F4+32*F5+7*F6)/90
        r=r+h
        delta0 = delta1
    end
    deltaObt = delta0.*180./%pi
endfunction

function Phaseplot()
    deltaObt = PFMRK5(Vparam, deltaExpt); //SPS in degree
//////////////////////////3S1-Plot/////////////////////////////////////////////
    subplot(2,2,1)
    r = linspace(0.01,5,1000)
    V = Potential(r, Vparam)
    plot(r,V,'b','LineWidth',3)
    set(gca(),'data_bounds',[0,-150; 5,100])    
    xlabel('$\textbf{r (fm)}$','fontsize',4)
    ylabel('$\textbf{V(r) (MeV)}$','fontsize',4)
    title('$\bf{\text{Potential plot for } ^3S_1 \text{ state}}$','fontsize',4)
    legend(['$^1S_0 \text{-np}$'])
    subplot(2,2,2)
    deltaObt = PFMRK5(Vparam, deltaExpt)
    plot(Elab,deltaObt,'b', Elab,deltaExpt,'rs','LineWidth',3);
    xlabel('$\textbf{E (MeV)}$','fontsize',4)
    ylabel('$\textbf{Phase shift (degree)}$','fontsize',4)
    title('$\bf{\text{Scattering phase shift for } ^3S_1 \text{ state}}$','fontsize',4)
    legend(['$^3S_1 \text{-np(Simulated)}$','$^3S_1 \text{-np(Exp)}$'])
//////////////////////////1S0-Plot/////////////////////////////////////////////
    subplot(2,2,3)
    V = Potential(r, Vparam1S0)
    plot(r,V,'b','LineWidth',3)
    set(gca(),'data_bounds',[0,-100; 5,100])
    xlabel('$\textbf{r (fm)}$','fontsize',4)
    ylabel('$\textbf{V(r) (MeV)}$','fontsize',4)
    title('$\bf{\text{Potential plot for } ^1S_0 \text{ state}}$','fontsize',4)
    legend(['$^1S_0 \text{-np}$'])
    subplot(2,2,4)
    deltaObt = PFMRK5(Vparam1S0, deltaExpt1S0)
    plot(Elab,deltaObt,'b', Elab,deltaExpt1S0,'rs','LineWidth',3);
    xlabel('$\textbf{E (MeV)}$','fontsize',4)
    ylabel('$\textbf{Phase shift (degree)}$','fontsize',4)
    title('$\bf{\text{Scattering phase shift for } ^1S_0 \text{ state}}$','fontsize',4)
    legend(['$^1S_0 \text{-np(Simulated)}$','$^1S_0 \text{-np(Exp)}$'])     
endfunction
