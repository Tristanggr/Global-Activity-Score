function [baecketot,RGStot,METa,METw,a92] = ScoresCalculation(SGA)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
baecke = zeros(16,1);

% Question 1
if SGA(1,2) == 3
    baecke(1,1) = 5;
else
    if SGA(1,2) == 2
        baecke(1,1) = 3;
    else 
        baecke(1,1) = 1;
    end
end

% Question 2
 baecke(2,1)= 6 - SGA(1,3);

% Question 3
 baecke(3,1)= SGA(1,4);

% Question 4
 baecke(4,1)= SGA(1,5);
 
% Question 5
 baecke(5,1)= SGA(1,6);
 
% Question 6 
 baecke(6,1)= SGA(1,7);
 
% Question 7
 baecke(7,1)= SGA(1,8);
% Question 8
 baecke(8,1)= SGA(1,9);
 
% Question 9
 [Q9ans,a92] = baeckeQ9calcul(SGA(1,11),SGA(1,12),SGA(1,13),SGA(1,14));
 baecke(9,1)= Q9ans;

% Question 10
 baecke(10,1)= SGA(1,20);
 
% Question 11
 baecke(11,1)= SGA(1,21);
 
% Question 12
  baecke(12,1)= baecke(9,1);
  
% Question 13 télé
  baecke(13,1)= 6-SGA(1,22);
  
% Question 14
  baecke(14,1)= SGA(1,23);
 
% Question 15
  baecke(15,1)= SGA(1,24);
  
% Question 16
  baecke(16,1)= SGA(1,25);
  
baecketot = sum(baecke());



RGS = zeros(9,1);

% Question 1
a1p = SGA(1,3)+ SGA(1,22);
if a1p <= 1
    RGS(1,1) = 5;
else
    if a1p > 5
        RGS(1,1) = 1;
    else
    RGS(1,1) = 6 - a1p;
    end
end

% Question 2
if SGA(1,11) == 1
    RGS(2,1) = 1;
else
    RGS(2,1) = 5;
end

% Question 3
RGS(3,1) = SGA(1,13);

% Question 4
RGS(4,1) = SGA(1,12);

% Question 5
RGS(5,1) = round(SGA(1,18)/2);

% Question 6
RGS(6,1) = baecke(1,1);

% Question 7
RGS(7,1) = SGA(1,10);

% Question 8
a8p = SGA(1,5) + SGA(1,23) + (SGA(1,25)-1);
if a8p <= 3 && (SGA(1,5) + SGA(1,23))==2
    RGS(8,1) = 1;
elseif a8p <=3
    RGS(8,1) = 2;
elseif a8p <= 5
    RGS(8,1) = 3;
elseif a8p <= 6
    RGS(8,1) = 4;
else
    RGS(8,1) = 5;
end
% Question 9
RGS(9,1) = SGA(1,26);
 
RGStot = sum(RGS());

METscore = zeros(6,1);

% Question 1
METscore(1,1) = SGA(1,15);

% Question 2
METscore(2,1) = SGA(1,16);

% Question 3
METscore(3,1) = SGA(1,17);

% Question 4
if SGA(1,18)<= 4
    METscore(4,1) = 1;
elseif SGA(1,18)<= 6
    METscore(4,1) = 2;
elseif SGA(1,18)<= 8
    METscore(4,1) = 3;
else
    METscore(4,1) = 4;
end

% Question 5
if SGA(1,12)== 1
    METscore(5,1) = 4;
elseif SGA(1,12) == 2
    METscore(5,1) = 3;
elseif SGA(1,12)<= 4
    METscore(5,1) = 2;
else
    METscore(5,1)= 1;
end

% Question 6
%
%
% FREQUENCE cardiaque
%
METscore(6,1)= 2;

METscoretot = sum(METscore());
if METscoretot == 0
    METa = [0,0];
    METw = 0;
elseif METscoretot < 9
    METa = [1.6,2.9];
    METw = 2.25 * a92;
elseif METscoretot <= 15
    METa = [3,5.9];
    METw = 4.45 * a92;
elseif METscoretot <= 21
    METa = [6,8.9];
    METw = 7.45 * a92;
else
    METa = 9;
    METw = 9 * a92;
    
end

