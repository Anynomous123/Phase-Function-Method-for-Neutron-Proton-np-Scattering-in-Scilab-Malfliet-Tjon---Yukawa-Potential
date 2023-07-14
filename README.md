# Phase-Function-Method-for-Neutron-Proton-np-Scattering-in-Scilab-Malfliet-Tjon-Potential
Scilab program for Scattering Phase Shifts for Neutron-Proton Scattering Using Phase Fnction Method with Malfliet-Tjon and Yukawa Potential

How to Run Program.                                                                                                                                         
This is the readme file for execution of Scattering Phase Shift Programs                                                        
Please follow these steps :                                                                                                                                
Step-1. Copy or write this code directly into Scinotes windows.                                                                       
Step-2. Save it with extension .sci                                                                                                                    
Step-3. Now execute this code window using function key 'F5' this automatically save and execute the program.                                                                                                                                            

OR
1. Download Repository 
2. Unzip it 
3. Open .sci file with Scilab 					
4. Press Function key "F5" this automatically save and execute the program
5. In Console Window type "Phaseplot()" without quotes
6. A figure window with required plots is visible.

-->exec('/home/lalit/Downloads/Phase_Alone_Github.sci', -1)

-->Phaseplot()

![MTpot](https://user-images.githubusercontent.com/83568077/223094812-37730756-b61d-4a8e-97bb-f1a4c6fdafa8.png)

Could you uncomment the potential parameters and potential block for Yukawa Potential?

then execute program 

-->exec('/home/lalit/Downloads/Phase_Alone_Github.sci', -1)

-->Phaseplot()

![YukawaPot](https://user-images.githubusercontent.com/83568077/223094802-e04d0a97-038f-4822-bb55-3e811f540cfe.png)

**This block is for Variational Monte-Carlo Technique**  
Copy program **VMC_MT_np.sci** directly into main program i.e., **Phase_Alone_Github.sci**  
OR  
Open program **VMC_MT_np.sci** directly in Scilab  
NOTE -- Before Executing program **VMC_MT_np.sci** there be small changes in **Phase_Alone_Github.sci** line 6 and 8  
**COMMENT LINE NUMBER 6 AND 8 OF MAIN PROGRAM Phase_Alone_Github.sci**  
Now execute this new or the same program with   
--> exec('/home/lalit/Downloads/Phase_Alone_Github.sci', -1)  
--> [Vparamnew] = VMCnp1S0([100,100,10],10,1) //paramters inside [ ] are onyl for start not the final parameters  
