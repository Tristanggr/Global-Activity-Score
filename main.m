%% Initialisation
clear
clc

%% Import data from text file
% Script for importing data from the following folder:
%
%    filename:
%    C:\Users\trist\OneDrive\Documents\GitHub\Global-Activity-Score

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 27);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Horodateur", "Var2", "Quelleestvotreoccupationtravailprincipale", "Autravailvousvousasseyezparjour", "Autravailvoustesdebout", "Autravailvousmarchezparjour", "Autravailvoussoulevezdespoidslourds", "Aprsletravailvoustesfatigus", "Autravailvoustranspirez", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotretra", "Endehorsdevotretravailrguliercombiendheuresconsacrezvousparsema", "Pratiquezvousrgulirementuneactivitsportivedcrirelaprincipale", "Combiendeminutesconsacrezvousenmoyennechaquesancedactivitphysiq", "Aquellefrquencepratiquezvouscetteactivit", "Combiendemoisparanpratiquezvous", "Pendantvotresessionvoustranspirez", "Pendantlasessionlaconversationest", "Pendantlasessionvoustes", "Surunechellede11010tantlemaximumvoussituezlapnibilitdeleffort", "Pratiquezvousrgulirementuneautredesactivitssportives", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotreact", "Durantvotretempsconsacrauxloisirsvoustranspirez", "Durantvotretempsconsacrauxloisirsvousregardezuncranassisparjour", "Durantvotretempsconsacrauxloisirsvousmarchezparjour", "Durantvotretempsconsacrauxloisirsvousfaitesduvlo", "Pourvosallerretoursdomicilelieudetravailcombiendeminutesmarchez", "Combiendtagesenmoyennemontezvouspiedchaquejour"];
opts.SelectedVariableNames = ["Horodateur", "Quelleestvotreoccupationtravailprincipale", "Autravailvousvousasseyezparjour", "Autravailvoustesdebout", "Autravailvousmarchezparjour", "Autravailvoussoulevezdespoidslourds", "Aprsletravailvoustesfatigus", "Autravailvoustranspirez", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotretra", "Endehorsdevotretravailrguliercombiendheuresconsacrezvousparsema", "Pratiquezvousrgulirementuneactivitsportivedcrirelaprincipale", "Combiendeminutesconsacrezvousenmoyennechaquesancedactivitphysiq", "Aquellefrquencepratiquezvouscetteactivit", "Combiendemoisparanpratiquezvous", "Pendantvotresessionvoustranspirez", "Pendantlasessionlaconversationest", "Pendantlasessionvoustes", "Surunechellede11010tantlemaximumvoussituezlapnibilitdeleffort", "Pratiquezvousrgulirementuneautredesactivitssportives", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotreact", "Durantvotretempsconsacrauxloisirsvoustranspirez", "Durantvotretempsconsacrauxloisirsvousregardezuncranassisparjour", "Durantvotretempsconsacrauxloisirsvousmarchezparjour", "Durantvotretempsconsacrauxloisirsvousfaitesduvlo", "Pourvosallerretoursdomicilelieudetravailcombiendeminutesmarchez", "Combiendtagesenmoyennemontezvouspiedchaquejour"];
opts.VariableTypes = ["string", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ImportErrorRule = "error";
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Horodateur", "Var2"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Horodateur", "Var2"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, ["Quelleestvotreoccupationtravailprincipale", "Autravailvousvousasseyezparjour", "Autravailvoustesdebout", "Autravailvousmarchezparjour", "Autravailvoussoulevezdespoidslourds", "Aprsletravailvoustesfatigus", "Autravailvoustranspirez", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotretra", "Endehorsdevotretravailrguliercombiendheuresconsacrezvousparsema", "Pratiquezvousrgulirementuneactivitsportivedcrirelaprincipale", "Combiendeminutesconsacrezvousenmoyennechaquesancedactivitphysiq", "Aquellefrquencepratiquezvouscetteactivit", "Combiendemoisparanpratiquezvous", "Pendantvotresessionvoustranspirez", "Pendantlasessionlaconversationest", "Pendantlasessionvoustes", "Surunechellede11010tantlemaximumvoussituezlapnibilitdeleffort", "Pratiquezvousrgulirementuneautredesactivitssportives", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotreact", "Durantvotretempsconsacrauxloisirsvoustranspirez", "Durantvotretempsconsacrauxloisirsvousregardezuncranassisparjour", "Durantvotretempsconsacrauxloisirsvousmarchezparjour", "Durantvotretempsconsacrauxloisirsvousfaitesduvlo", "Pourvosallerretoursdomicilelieudetravailcombiendeminutesmarchez", "Combiendtagesenmoyennemontezvouspiedchaquejour"], "FillValue", 0);
opts = setvaropts(opts, ["Quelleestvotreoccupationtravailprincipale", "Autravailvousvousasseyezparjour", "Autravailvoustesdebout", "Autravailvousmarchezparjour", "Autravailvoussoulevezdespoidslourds", "Aprsletravailvoustesfatigus", "Autravailvoustranspirez", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotretra", "Endehorsdevotretravailrguliercombiendheuresconsacrezvousparsema", "Pratiquezvousrgulirementuneactivitsportivedcrirelaprincipale", "Combiendeminutesconsacrezvousenmoyennechaquesancedactivitphysiq", "Aquellefrquencepratiquezvouscetteactivit", "Combiendemoisparanpratiquezvous", "Pendantvotresessionvoustranspirez", "Pendantlasessionlaconversationest", "Pendantlasessionvoustes", "Pratiquezvousrgulirementuneautredesactivitssportives", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotreact", "Durantvotretempsconsacrauxloisirsvoustranspirez", "Durantvotretempsconsacrauxloisirsvousregardezuncranassisparjour", "Durantvotretempsconsacrauxloisirsvousmarchezparjour", "Durantvotretempsconsacrauxloisirsvousfaitesduvlo", "Pourvosallerretoursdomicilelieudetravailcombiendeminutesmarchez", "Combiendtagesenmoyennemontezvouspiedchaquejour"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["Quelleestvotreoccupationtravailprincipale", "Autravailvousvousasseyezparjour", "Autravailvoustesdebout", "Autravailvousmarchezparjour", "Autravailvoussoulevezdespoidslourds", "Aprsletravailvoustesfatigus", "Autravailvoustranspirez", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotretra", "Endehorsdevotretravailrguliercombiendheuresconsacrezvousparsema", "Pratiquezvousrgulirementuneactivitsportivedcrirelaprincipale", "Combiendeminutesconsacrezvousenmoyennechaquesancedactivitphysiq", "Aquellefrquencepratiquezvouscetteactivit", "Combiendemoisparanpratiquezvous", "Pendantvotresessionvoustranspirez", "Pendantlasessionlaconversationest", "Pendantlasessionvoustes", "Pratiquezvousrgulirementuneautredesactivitssportives", "Encomparaisonaveclesautrespersonnesdemongevouspensezquevotreact", "Durantvotretempsconsacrauxloisirsvoustranspirez", "Durantvotretempsconsacrauxloisirsvousregardezuncranassisparjour", "Durantvotretempsconsacrauxloisirsvousmarchezparjour", "Durantvotretempsconsacrauxloisirsvousfaitesduvlo", "Pourvosallerretoursdomicilelieudetravailcombiendeminutesmarchez", "Combiendtagesenmoyennemontezvouspiedchaquejour"], "ThousandsSeparator", ",");

% Import the data
fpath = 'C:\Users\trist\OneDrive\Documents\GitHub\Global-Activity-Score\DATA';
fname = 'DATAquestionnaires.csv';
full_fname = fullfile(fpath,fname);

SGA = readtable(full_fname, opts);

SGAsize = (size(SGA));

% Initiate matrix for scores results
ScoresMatrix = zeros(SGAsize(1),5);

%% Clear temporary variables
clear opts

%% Scores Calculation
% Maximum values for each score
Baecke = 78;
RiccietGagnon = 45;
METparActivit = [0,19];
METparSemaine = 34;

% Define Tables for scores results
ScoresTab = table(Baecke,RiccietGagnon,METparActivit,METparSemaine);
ScoresSubject = ScoresTab; %scores for each iteration of For Loop

SGA = double(table2array(SGA));
for i = 1 : (SGAsize(1))
    SGAi = SGA(i,:);
    [Baecke,RiccietGagnon,METparActivit,METparSemaine] = ScoresCalculation(SGAi);
    % add values in matrix
    ScoreMatrix(i,:)= [Baecke,RiccietGagnon,METparActivit,METparSemaine];
    % add values in table
    ScoresSubject = table(Baecke,RiccietGagnon,METparActivit,METparSemaine);
    ScoresTab = [ScoresTab;ScoresSubject];
end
ScoresTab = sortrows(ScoresTab,'Baecke','descend');

%% GAS Calculation
GAScalcul = (((ScoreMatrix(:,1)*10)/78) + ((ScoreMatrix(:,2)*10)/45) + ((ScoreMatrix(:,5)*10)/34) + acceleration)/4; %need to add acceleration data
GAS = [GAScalcul,((ScoreMatrix(:,1)*10)/78), ((ScoreMatrix(:,2)*10)/45), ((ScoreMatrix(:,5)*10)/34), acceleration];
%% Exemple
% Subject choice
x = 10
acceleration = 5

%GAS Calculation
GAScalcul = (((ScoreMatrix(x,1)*10)/78) + ((ScoreMatrix(x,2)*10)/45) + ((ScoreMatrix(x,5)*10)/34) + acceleration)/4; %need to add acceleration data
GAS = [GAScalcul,((ScoreMatrix(x,1)*10)/78), ((ScoreMatrix(x,2)*10)/45), ((ScoreMatrix(x,5)*10)/34), acceleration];

% Scores Histogram
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

