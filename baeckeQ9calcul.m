function [Q9ans,a92] = baeckeQ9calcul(q91,q92,q93,q94)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if q91 == 1
    Q9ans = 1;
    a92 = 0;
else
    if q91 == 4
        a91 = 1.76;
    else
        if q91 == 3
            a91 = 1.26;
        else
            a91 = 0.76;
        end
    end
        
    if q93 == 1
        a92p = 0.5*q92;
    else
        a92p = q92*q93;
    end
    
    if a92p >= 20
        a92 = 4.5;
    elseif a92p >= 15
        a92 = 3.5;
    elseif a92p >= 10
        a92 = 2.5;
    elseif a92p >= 6
        a92 = 1.5;
     else
        a92 = 0.5;
               
    end
    
    if q94 == 5
        a93 = 0.92;
    elseif q94 == 4
        a93 = 0.67;
    elseif q94 == 3
        a93 = 0.42;
    elseif q94 == 2
        a93 = 0.17;
    else 
        a93 = 0.04;
                
    end
    
    a9 = a91*a92*a93;
    
    if a9 >= 12 
        Q9ans = 5;
    elseif a9 >= 8
        Q9ans = 4;
    elseif a9 >= 4
        Q9ans = 3;
    else
        Q9ans = 2;
    end
end
                