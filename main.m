%% Initialisation
clear
clc
clf

%% Import data from text file
% Script for importing data from the following folder:
%
%    filename: C:\Users\trist\OneDrive\Bureau\Santé-Activité
%    Physique\Programme...

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
fpath = 'C:\Users\trist\OneDrive\Bureau\Santé-Activité Physique\Programme';
fname = uigetfile;
%fname = 'SGA1.csv';
full_fname = fullfile(fpath,fname);

SGA = readtable(full_fname, opts);
SGA = double(table2array(SGA));
SGAsize = (size(SGA)+1);
Scores = zeros(SGAsize(1),5);

%% Clear temporary variables
clear opts

%% Scores Calculation
Baecke = 78;
RiccietGagnon = 45;
METparActivit = [0,19];
METparSemaine = 34;

ScoresTab = table(Baecke,RiccietGagnon,METparActivit,METparSemaine);
ScoresSubject = ScoresTab;

for i = 1 : (SGAsize(1)-1)
    SGAi = SGA(i,:);
    [Baecke,RiccietGagnon,METparActivit,METparSemaine] = ScoresCalculation(SGAi);
    ScoreMatrix(i,:)= [Baecke,RiccietGagnon,METparActivit,METparSemaine];
    ScoresSubject = table(Baecke,RiccietGagnon,METparActivit,METparSemaine);
    ScoresTab = [ScoresTab;ScoresSubject];
end
ScoresTab = sortrows(ScoresTab,'Baecke','descend');

%% GAS Calculation
GASqcm = (((ScoreMatrix(:,1)*10)/78) + ((ScoreMatrix(:,2)*10)/45) + ((ScoreMatrix(:,5)*10)/34))/3;
