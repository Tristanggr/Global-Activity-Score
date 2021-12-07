%% Initialisation
clear
clc
clf
%% Import the data
fpath = 'C:\Users\trist\OneDrive\Documents\GitHub\Global-Activity-Score\DATA';
fname = 'exemple.csv';
full_fname = fullfile(fpath,fname);

SGA = readmatrix(full_fname);

acceleration = 6;
% Initiate matrix for scores results
ScoresMatrix = zeros(1,5);

%% Extract Scores from questionnaires
[Baecke,RiccietGagnon,METparActivit,METparSemaine] = ScoresCalculation(SGA);
ScoreMatrix = [Baecke,RiccietGagnon,METparActivit,METparSemaine];

%% GAS Calculation
GAScalcul = (((ScoreMatrix(1,1)*10)/78) + ((ScoreMatrix(1,2)*10)/45) + ((ScoreMatrix(1,5)*10)/34) + acceleration)/4; %need to add acceleration data
GAS = [GAScalcul,((ScoreMatrix(1,1)*10)/78), ((ScoreMatrix(1,2)*10)/45), ((ScoreMatrix(1,5)*10)/34), acceleration];

%% Results
HistogramGAS = bar(GAS);
HistogramGAS.FaceColor = 'flat';
HistogramGAS.CData(1,:)= [0.4660 0.6740 0.1880];
HistogramGAS.CData(2,:)= [0 0.4470 0.7410];
HistogramGAS.CData(3,:)= [0.3010 0.7450 0.9330];
HistogramGAS.CData(4,:)= [0.8500 0.3250 0.0980];
HistogramGAS.CData(5,:)= [1 1 0];

yline(GAScalcul(1,1),'g--', 'LineWidth', 2);

title('GAS and others Scores for subject x')
legend('GAS',' ')
text(1.7,2,'Baecke','FontWeight','bold');
text(2.83,2,'R&G','FontWeight','bold');
text(3.6,2,'MET/week','FontWeight','bold');
text(4.6,2,'Acceleration','FontWeight','bold');
axis([0 inf  0 10])
