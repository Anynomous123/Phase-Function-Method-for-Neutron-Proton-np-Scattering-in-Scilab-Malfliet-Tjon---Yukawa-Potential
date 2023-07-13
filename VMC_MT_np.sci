function[constn]=VMCnp1S0(consto,P,b)
    [y1o,p1s0]=np1S0(consto)//  calling 
    N=length(p1s0);
///////////////////////////////////////////////////////////
nu= (abs((y1o(1:N)'.*(180/%pi))-p1s0(1:N)')).^(2); // to calculate Mean Square Error
den= 1; // for Mean square error
//  disp(nu)
//////////////////////////////////////////////////////////////////
chi=mean(nu.*(den.^(-1))); // Mean square error
chisqmin=chi
//P=20; // for the iteration process we can change it to higher vals.
s=1;
while s<=P
    constn=consto;
    k=1
        
        while k<=3
        if(k==1) then 
            constn(k)=consto(k)+(-b+2*b*rand()) //adding random numbers to the initial guess.
        elseif(k==2)
            constn(k)=consto(k)+(-b+2*(b)*rand())
        else(k==3)
            constn(k)=consto(k)+(-b/10+2*(b/10)*rand())    
        end
        
        [y1,p1s0]=np1S0(constn)
        N=length(p1s0)
//////////////////////////////////////////////////////////
nun = (abs((y1(1:N)'.*(180/%pi))-p1s0(1:N)')).^(2); //to calculate Mean Square Error
denn= 1 // for MSE
////////////////////////////////////////////////////
chin=mean(nun.*(denn.^(-1))); // MSE
if (chin)<(chi) then
    consto=constn;
    chisqmin=chin;
    chi=chin;
else
    constn=consto
    chisqmin=chi;
end
k=k+1;
disp([(y1(1:N)'.*(180/%pi)),p1s0(1:N)'],chisqmin,[constn])
end   
s=s+1;
end
endfunction 
    

