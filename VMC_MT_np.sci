/////////////Variational Monte-Carlo Technique////////////////////////////
function [Vparamnew] = VMCnp1S0(Vparam,P,b)
    deltaObt = PFMRK5(Vparam, deltaExpt)//  calling
    N=length(deltaObt);
//    [y1o,p1s0]=np1S0(consto)//  calling 
//    N=length(p1s0);
///////////////////////////////////////////////////////////
nu= (abs((deltaExpt(1:N)')- deltaObt(1:N)')).^(2); // to calculate Mean Square Error
den= 1; // for Mean square error
//  disp(nu)
//////////////////////////////////////////////////////////////////
chi=mean(nu.*(den.^(-1))); // Mean square error
chisqmin=chi
//P=20; // for the iteration process we can change it to higher vals.
s=1;
while s<=P
    Vparamnew=Vparam;
    k=1
        while k<=3
        if(k==1) then 
            Vparamnew(k)=Vparam(k)+(-b+2*b*rand()) //adding random numbers to the initial guess.
        elseif(k==2)
            Vparamnew(k)=Vparam(k)+(-b+2*(b)*rand())
        else(k==3)
            Vparamnew(k)=Vparam(k)+(-b/10+2*(b/10)*rand())    
        end
        deltaObtNew = PFMRK5(Vparamnew, deltaExpt)
//        [y1,p1s0]=np1S0(constn)
        N=length(deltaObt)
//////////////////////////////////////////////////////////
nun = (abs((deltaExpt(1:N)')-deltaObtNew(1:N)')).^(2); //to calculate Mean Square Error
denn= 1 // for MSE
////////////////////////////////////////////////////
chin=mean(nun.*(denn.^(-1))); // MSE
if (chin)<(chi) then
    Vparam=Vparamnew;
    chisqmin=chin;
    chi=chin;
else
    Vparamnew=Vparam
    chisqmin=chi;
end
k=k+1;
disp([(deltaObtNew(1:N)'),deltaExpt(1:N)'],chisqmin,[Vparamnew])
end   
s=s+1;
end
endfunction 
