tic
clear all; %#ok<CLALL>
close all;

load(['C:\Users\mcdannal\Dropbox (McDannald Lab)\Manuscripts\Wright\vlpag record inhibit\vlPAG cube\','cube']);
%     load(['/Users/kristinawright/Dropbox (McDannald Lab)/Manuscripts/Wright/vlpag record inhibit/vlPAG cube/','cube']);
%    addpath('/Users/kristinawright/Dropbox (McDannald Lab)/Manuscripts/Wright/vlpag record inhibit/helper_codes/');

for ii = 1:size(vlPAGcube.tag,3)
   
   % Determine significance (h) and direction (d) of firing compared to baseline for danger trials 
    
   h = ttest(vlPAGcube.fire.raw.base10(1:6,1,ii),vlPAGcube.fire.raw.select.cueFirstFive(1:6,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueFirstFive(1:6,1,ii))-(mean(vlPAGcube.fire.raw.base10(1:6,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,1,ii) = h*d; %DANGER
   clear h d;
   
   % Determine significance (h) and direction (d) of onset firing compared to baseline for uncertainty trials 
   
   h = ttest(vlPAGcube.fire.raw.base10(7:22,1,ii),vlPAGcube.fire.raw.select.cueFirstFive(7:22,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueFirstFive(7:22,1,ii))-(mean(vlPAGcube.fire.raw.base10(7:22,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,2,ii) = h*d; %%UNCERTAINTY
   clear h d;
   
   % Determine significance (h) and direction (d) of onset firing compared to baseline for safety trials 
   
   h = ttest(vlPAGcube.fire.raw.base10(23:32,1,ii),vlPAGcube.fire.raw.select.cueFirstFive(23:32,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueFirstFive(23:32,1,ii))-(mean(vlPAGcube.fire.raw.base10(23:32,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,3,ii) = h*d; %%SAFETY
   clear h d;
   
   % Determine significance (h) and direction (d) of offset firing compared to baseline for danger trials 
    
   h = ttest(vlPAGcube.fire.raw.base10(1:6,1,ii),vlPAGcube.fire.raw.select.cueLastFive(1:6,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueLastFive(1:6,1,ii))-(mean(vlPAGcube.fire.raw.base10(1:6,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,4,ii) = h*d; %%DANGER
   clear h d;
   
   % Determine significance (h) and direction (d) of offset firing compared to baseline for uncertainty trials 
   
   h = ttest(vlPAGcube.fire.raw.base10(7:22,1,ii),vlPAGcube.fire.raw.select.cueLastFive(7:22,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueLastFive(7:22,1,ii))-(mean(vlPAGcube.fire.raw.base10(7:22,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,5,ii) = h*d; %%UNCERTAINTY
   clear h d;
   
   % Determine significance (h) and direction (d) of offset firing compared to baseline for safety trials 
   
   h = ttest(vlPAGcube.fire.raw.base10(23:32,1,ii),vlPAGcube.fire.raw.select.cueLastFive(23:32,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueLastFive(23:32,1,ii))-(mean(vlPAGcube.fire.raw.base10(23:32,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,6,ii) = h*d;  %%SAFETY
   clear h d;

   % Determine significance (h) and direction (d) of CueEntire firing compared to baseline for danger trials
   
   h = ttest(vlPAGcube.fire.raw.base10(1:6,1,ii),vlPAGcube.fire.raw.select.cueEntire(1:6,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueEntire(23:32,1,ii))-(mean(vlPAGcube.fire.raw.base10(23:32,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,7,ii) = h*d; %%DANGER
   clear h d;
   
   % Determine significance (h) and direction (d) of CueEntire firing compared to baseline for uncertainty trials 
   
   h = ttest(vlPAGcube.fire.raw.base10(7:22,1,ii),vlPAGcube.fire.raw.select.cueEntire(7:22,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueOffset(7:22,1,ii))-(mean(vlPAGcube.fire.raw.base10(7:22,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,8,ii) = h*d; %%UNCERTAINTY
   clear h d;
   
   % Determine significance (h) and direction (d) of CueEntire firing compared to baseline for safety trials 
   
   h = ttest(vlPAGcube.fire.raw.base10(23:32,1,ii),vlPAGcube.fire.raw.select.cueEntire(23:32,1,ii),'Alpha',0.0125);
   d = sign(mean(vlPAGcube.fire.raw.select.cueOffset(23:32,1,ii))-(mean(vlPAGcube.fire.raw.base10(23:32,1,ii))));
   vlPAGcube.fire.raw.select.dirSig(1,9,ii) = h*d;  %%SAFETY
   clear h d;

   
%columns 1,2,3 are cueFirstFive
%columns 4,5,6 are cueLastFive
%columns 7,8,9 are cueEntire

     
    vlPAGcube.fire.raw.select.dirSig(isnan(vlPAGcube.fire.raw.select.dirSig))=0;

    
   if ((vlPAGcube.fire.raw.select.dirSig(1,1,ii) == -1)|| ... 
      (vlPAGcube.fire.raw.select.dirSig(1,2,ii) == -1) || ...
      (vlPAGcube.fire.raw.select.dirSig(1,4,ii) == -1) || ... 
      (vlPAGcube.fire.raw.select.dirSig(1,5,ii) == -1))

  %&& ... % doubling the number will not change the data is just rewrites the same thing twice
  %(clusterID(ii,1) == 1) - Selection no longer based on firing rate - OFF
      
        inh.tag(:,:,ii) = vlPAGcube.tag(:,:,ii);
        inh.name(:,:,ii) = vlPAGcube.name(:,:,ii);
        inh.wave(:,:,ii) = vlPAGcube.wave(:,:,ii);
        inh.poke.base(:,:,ii) = vlPAGcube.poke.base(:,:,ii);
        inh.poke.cue(:,:,ii) = vlPAGcube.poke.cue(:,:,ii);
        inh.poke.s1.interval(:,:,ii) = vlPAGcube.poke.s1.interval(:,:,ii);
        inh.poke.ms500.interval(:,:,ii) = vlPAGcube.poke.ms500.interval(:,:,ii);
        inh.cer.cue(:,:,ii) = vlPAGcube.cer.cue(:,:,ii);
        inh.cer.s1.interval(:,:,ii) = vlPAGcube.cer.s1.interval(:,:,ii);
        inh.cer.ms500.interval(:,:,ii) = vlPAGcube.cer.ms500.interval(:,:,ii);
        inh.fire.raw.base10(:,:,ii) = vlPAGcube.fire.raw.base10(:,:,ii);
        inh.fire.raw.select.shock(:,:,ii) = vlPAGcube.fire.raw.select.shock(:,:,ii);
        inh.fire.raw.select.cueOnset(:,:,ii) = vlPAGcube.fire.raw.select.cueOnset(:,:,ii);
        inh.fire.raw.select.cueOffset(:,:,ii) = vlPAGcube.fire.raw.select.cueOffset(:,:,ii);
        inh.fire.raw.select.cueEntire(:,:,ii) = vlPAGcube.fire.raw.select.cueEntire(:,:,ii);
        inh.fire.raw.select.cueFirstFive(:,:,ii) = vlPAGcube.fire.raw.select.cueFirstFive(:,:,ii);
        inh.fire.raw.select.cueLastFive(:,:,ii) = vlPAGcube.fire.raw.select.cueLastFive(:,:,ii);
        inh.fire.raw.select.dirSig(:,:,ii) = vlPAGcube.fire.raw.select.dirSig(:,:,ii);
        inh.fire.raw.s1.interval(:,:,ii) = vlPAGcube.fire.raw.s1.interval(:,:,ii);
        inh.fire.raw.ms500.interval(:,:,ii) = vlPAGcube.fire.raw.ms500.interval(:,:,ii);
        inh.fire.raw.ms250.interval(:,:,ii) = vlPAGcube.fire.raw.ms250.interval(:,:,ii);
        inh.fire.raw.ms100.interval(:,:,ii) = vlPAGcube.fire.raw.ms100.interval(:,:,ii);
        inh.fire.diff.s1.interval(:,:,ii) = vlPAGcube.fire.diff.s1.interval(:,:,ii);
        inh.fire.diff.ms500.interval(:,:,ii) = vlPAGcube.fire.diff.ms500.interval(:,:,ii);
        inh.fire.diff.ms250.interval(:,:,ii) = vlPAGcube.fire.diff.ms250.interval(:,:,ii);
        inh.fire.diff.ms100.interval(:,:,ii) = vlPAGcube.fire.diff.ms100.interval(:,:,ii);
        inh.fire.z.s1.interval(:,:,ii) = vlPAGcube.fire.z.s1.interval(:,:,ii);
        inh.fire.z.ms500.interval(:,:,ii) = vlPAGcube.fire.z.ms500.interval(:,:,ii);
        inh.fire.z.ms250.interval(:,:,ii) = vlPAGcube.fire.z.ms250.interval(:,:,ii);
        inh.fire.z.ms100.interval(:,:,ii) = vlPAGcube.fire.z.ms100.interval(:,:,ii);
       
    else % Assign nan values to units not excited to either cueFirstFive or cueLastFive
    
        inh.tag(:,:,ii) = nan(32,2);
        inh.wave(:,:,ii) = nan(32,1);
        inh.poke.base(:,:,ii) = nan(32,1);
        inh.poke.cue(:,:,ii) = nan(32,1);
        inh.poke.s1.interval(:,:,ii) = nan(32,50);
        inh.poke.ms500.interval(:,:,ii) = nan(32,100);
        inh.cer.cue(:,:,ii) = nan(32,1);
        inh.cer.s1.interval(:,:,ii) = nan(32,50);
        inh.cer.ms500.interval(:,:,ii) = nan(32,100);
        inh.fire.raw.base10(:,:,ii) = nan(32,1);
        inh.fire.raw.select.shock(:,:,ii) = nan(32,1);
        inh.fire.raw.select.cueOnset(:,:,ii) = nan(32,1);
        inh.fire.raw.select.cueOffset(:,:,ii) = nan(32,1);
        inh.fire.raw.select.cueEntire(:,:,ii) = nan(32,1);
        inh.fire.raw.select.cueFirstFive(:,:,ii) = nan(32,1);
        inh.fire.raw.select.cueLastFive(:,:,ii) = nan(32,1);
        inh.fire.raw.select.dirSig(:,:,ii) = nan(1,9); % call # of columns
        inh.fire.raw.s1.interval(:,:,ii) = nan(32,50);
        inh.fire.raw.ms500.interval(:,:,ii) = nan(32,100);
        inh.fire.raw.ms250.interval(:,:,ii) = nan(32,200);
        inh.fire.raw.ms100.interval(:,:,ii) = nan(32,500);
        inh.fire.diff.s1.interval(:,:,ii) = nan(32,50);
        inh.fire.diff.ms500.interval(:,:,ii) = nan(32,100);
        inh.fire.diff.ms250.interval(:,:,ii) = nan(32,200);
        inh.fire.diff.ms100.interval(:,:,ii) = nan(32,500);
        inh.fire.z.s1.interval(:,:,ii) = nan(32,50);
        inh.fire.z.ms500.interval(:,:,ii) = nan(32,100);
        inh.fire.z.ms250.interval(:,:,ii) = nan(32,200);
        inh.fire.z.ms100.interval(:,:,ii) = nan(32,500);
        
    end % Identify the nan matrix slices
    
        deleteThisSliceE(ii) = any(all(isnan(inh.tag(32,1,ii)), 1));  %#ok<*SAGROW>
             
end

% Excise the nan slices, creating 3D matrix of only shock-responsive units

inh.tag = inh.tag(:,:,~deleteThisSliceE);
inh.wave = inh.wave(:,:,~deleteThisSliceE);
inh.name = inh.name(:,:,~deleteThisSliceE);
inh.poke.base = inh.poke.base(:,:,~deleteThisSliceE);
inh.poke.cue = inh.poke.cue(:,:,~deleteThisSliceE);
inh.poke.s1.interval = inh.poke.s1.interval(:,:,~deleteThisSliceE);
inh.poke.ms500.interval = inh.poke.ms500.interval(:,:,~deleteThisSliceE);
inh.cer.cue = inh.cer.cue(:,:,~deleteThisSliceE);
inh.cer.s1.interval = inh.cer.s1.interval(:,:,~deleteThisSliceE);
inh.cer.ms500.interval = inh.cer.ms500.interval(:,:,~deleteThisSliceE);
inh.fire.raw.base10 = inh.fire.raw.base10(:,:,~deleteThisSliceE);
inh.fire.raw.select.shock = inh.fire.raw.select.shock(:,:,~deleteThisSliceE);
inh.fire.raw.select.cueOnset = inh.fire.raw.select.cueOnset(:,:,~deleteThisSliceE);
inh.fire.raw.select.cueOffset = inh.fire.raw.select.cueOffset(:,:,~deleteThisSliceE);
inh.fire.raw.select.cueEntire = inh.fire.raw.select.cueEntire(:,:,~deleteThisSliceE);
inh.fire.raw.select.cueFirstFive = inh.fire.raw.select.cueFirstFive(:,:,~deleteThisSliceE);
inh.fire.raw.select.cueLastFive = inh.fire.raw.select.cueLastFive(:,:,~deleteThisSliceE);
inh.fire.raw.select.dirSig = inh.fire.raw.select.dirSig(:,:,~deleteThisSliceE);
inh.fire.raw.s1.interval = inh.fire.raw.s1.interval(:,:,~deleteThisSliceE);
inh.fire.raw.ms500.interval = inh.fire.raw.ms500.interval(:,:,~deleteThisSliceE);
inh.fire.raw.ms250.interval = inh.fire.raw.ms250.interval(:,:,~deleteThisSliceE);
inh.fire.raw.ms100.interval = inh.fire.raw.ms100.interval(:,:,~deleteThisSliceE);
inh.fire.diff.s1.interval = inh.fire.diff.s1.interval(:,:,~deleteThisSliceE);
inh.fire.diff.ms500.interval = inh.fire.diff.ms500.interval(:,:,~deleteThisSliceE);
inh.fire.diff.ms250.interval = inh.fire.diff.ms250.interval(:,:,~deleteThisSliceE);
inh.fire.diff.ms100.interval = inh.fire.diff.ms100.interval(:,:,~deleteThisSliceE);
inh.fire.z.s1.interval = inh.fire.z.s1.interval(:,:,~deleteThisSliceE);
inh.fire.z.ms500.interval = inh.fire.z.ms500.interval(:,:,~deleteThisSliceE);
inh.fire.z.ms250.interval = inh.fire.z.ms250.interval(:,:,~deleteThisSliceE);
inh.fire.z.ms100.interval = inh.fire.z.ms100.interval(:,:,~deleteThisSliceE);

clear ii deleteThisSliceE deleteThisSliceI;

% Replace Nan cer values with 1

inh.cer.cue(isnan(inh.cer.cue))=1; 
inh.cer.s1.interval(isnan(inh.cer.s1.interval))=1;
inh.cer.ms500.interval(isnan(inh.cer.ms500.interval))=1;

%Select based on cluster ID


inh.clusterDanger = [1;2;2;2;2;2;1;2;2;2;2;1;2;2;2;1;1;1;2;1;2;2;2;2;1;2;1;2;1;2;1;2;2;1;1;1;1;1;2;1;2;2;2;2;2;2;1;1;1;1;1;2;1;2;2;2;2;1;2;2;1;1;2;2;2;1;1;1;1;1;1;1;1;1;1;2;1;1;2;1;1;2;2;2;2;1;1;1;2;1;2;1;2;1;1];

for ii = 1:length(inh.clusterDanger)

    if ((inh.clusterDanger(ii,1) == 1) && ...
       (strcmp(inh.name(:,:,ii),'dr02091716epr38aSPK16a') == 0) && ...
       (strcmp(inh.name(:,:,ii),'rf03102716epr38bSPK05a') == 0) && ...
       (strcmp(inh.name(:,:,ii),'rf03091816epr38bSPK16a') == 0) && ...
       (strcmp(inh.name(:,:,ii),'rf03110916epr38bSPK07a') == 0))
      
        inhSus.tag(:,:,ii) = inh.tag(:,:,ii);
        inhSus.wave(:,:,ii) = inh.wave(:,:,ii);
        inhSus.name(:,:,ii) = inh.name(:,:,ii);
        inhSus.poke.base(:,:,ii) = inh.poke.base(:,:,ii);
        inhSus.poke.cue(:,:,ii) = inh.poke.cue(:,:,ii);
        inhSus.poke.s1.interval(:,:,ii) = inh.poke.s1.interval(:,:,ii);
        inhSus.poke.ms500.interval(:,:,ii) = inh.poke.ms500.interval(:,:,ii);
        inhSus.cer.cue(:,:,ii) = inh.cer.cue(:,:,ii);
        inhSus.cer.s1.interval(:,:,ii) = inh.cer.s1.interval(:,:,ii);
        inhSus.cer.ms500.interval(:,:,ii) = inh.cer.ms500.interval(:,:,ii);
        inhSus.fire.raw.base10(:,:,ii) = inh.fire.raw.base10(:,:,ii);
        inhSus.fire.raw.select.shock(:,:,ii) = inh.fire.raw.select.shock(:,:,ii);
        inhSus.fire.raw.select.cueOnset(:,:,ii) = inh.fire.raw.select.cueOnset(:,:,ii);
        inhSus.fire.raw.select.cueOffset(:,:,ii) = inh.fire.raw.select.cueOffset(:,:,ii);
        inhSus.fire.raw.select.cueEntire(:,:,ii) = inh.fire.raw.select.cueEntire(:,:,ii);
        inhSus.fire.raw.select.cueFirstFive(:,:,ii) = inh.fire.raw.select.cueFirstFive(:,:,ii);
        inhSus.fire.raw.select.cueLastFive(:,:,ii) = inh.fire.raw.select.cueLastFive(:,:,ii);
        inhSus.fire.raw.select.dirSig(:,:,ii) = inh.fire.raw.select.dirSig(:,:,ii);
        inhSus.fire.raw.s1.interval(:,:,ii) = inh.fire.raw.s1.interval(:,:,ii);
        inhSus.fire.raw.ms500.interval(:,:,ii) = inh.fire.raw.ms500.interval(:,:,ii);
        inhSus.fire.raw.ms250.interval(:,:,ii) = inh.fire.raw.ms250.interval(:,:,ii);
        inhSus.fire.raw.ms100.interval(:,:,ii) = inh.fire.raw.ms100.interval(:,:,ii);
        inhSus.fire.diff.s1.interval(:,:,ii) = inh.fire.diff.s1.interval(:,:,ii);
        inhSus.fire.diff.ms500.interval(:,:,ii) = inh.fire.diff.ms500.interval(:,:,ii);
        inhSus.fire.diff.ms250.interval(:,:,ii) = inh.fire.diff.ms250.interval(:,:,ii);
        inhSus.fire.diff.ms100.interval(:,:,ii) = inh.fire.diff.ms100.interval(:,:,ii);
        inhSus.fire.z.s1.interval(:,:,ii) = inh.fire.z.s1.interval(:,:,ii);
        inhSus.fire.z.ms500.interval(:,:,ii) = inh.fire.z.ms500.interval(:,:,ii);
        inhSus.fire.z.ms250.interval(:,:,ii) = inh.fire.z.ms250.interval(:,:,ii);
        inhSus.fire.z.ms100.interval(:,:,ii) = inh.fire.z.ms100.interval(:,:,ii);
    
   else % Assign nan values to units not excited to either cue100 or cueSPR shock delivery
    
        inhSus.tag(:,:,ii) = nan(32,2);
        inhSus.wave(:,:,ii) = nan(32,1);
        inhSus.poke.base(:,:,ii) = nan(32,1);
        inhSus.poke.cue(:,:,ii) = nan(32,1);
        inhSus.poke.s1.interval(:,:,ii) = nan(32,50);
        inhSus.poke.ms500.interval(:,:,ii) = nan(32,100);
        inhSus.poke.ms250.interval(:,:,ii) = nan(32,200);
        inhSus.poke.ms100.interval(:,:,ii) = nan(32,500);
        inhSus.cer.cue(:,:,ii) = nan(32,1);
        inhSus.cer.s1.interval(:,:,ii) = nan(32,50);
        inhSus.cer.ms500.interval(:,:,ii) = nan(32,100);
        inhSus.cer.ms250.interval(:,:,ii) = nan(32,200);
        inhSus.cer.ms100.interval(:,:,ii) = nan(32,500);
        inhSus.fire.raw.base10(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.shock(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.cueOnset(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.cueOffset(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.cueEntire(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.cueFirstFive(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.cueLastFive(:,:,ii) = nan(32,1);
        inhSus.fire.raw.select.dirSig(:,:,ii) = nan(1,9);
        inhSus.fire.raw.s1.interval(:,:,ii) = nan(32,50);
        inhSus.fire.raw.ms500.interval(:,:,ii) = nan(32,100);
        inhSus.fire.raw.ms250.interval(:,:,ii) = nan(32,200);
        inhSus.fire.raw.ms100.interval(:,:,ii) = nan(32,500);
        inhSus.fire.diff.s1.interval(:,:,ii) = nan(32,50);
        inhSus.fire.diff.ms500.interval(:,:,ii) = nan(32,100);
        inhSus.fire.diff.ms250.interval(:,:,ii) = nan(32,200);
        inhSus.fire.diff.ms100.interval(:,:,ii) = nan(32,500);
        inhSus.fire.z.s1.interval(:,:,ii) = nan(32,50);
        inhSus.fire.z.ms500.interval(:,:,ii) = nan(32,100);
        inhSus.fire.z.ms250.interval(:,:,ii) = nan(32,200);
        inhSus.fire.z.ms100.interval(:,:,ii) = nan(32,500);
    
   end % Identify the nan matrix slices
    
        deleteThisSliceS(ii) = any(all(isnan(inhSus.tag(32,1,ii)), 1));  %#ok<*SAGROW>
   
   if  ((inh.clusterDanger(ii,1) == 2) && ...
       (strcmp(inh.name(:,:,ii),'dr02091716epr38aSPK16a') == 0) && ...
       (strcmp(inh.name(:,:,ii),'rf03102716epr38bSPK05a') == 0) && ...
       (strcmp(inh.name(:,:,ii),'rf03091816epr38bSPK16a') == 0) && ...
       (strcmp(inh.name(:,:,ii),'rf03110916epr38bSPK07a') == 0))
      
        inhFlp.tag(:,:,ii) = inh.tag(:,:,ii);
        inhFlp.wave(:,:,ii) = inh.wave(:,:,ii);
        inhFlp.name(:,:,ii) = inh.name(:,:,ii);
        inhFlp.poke.base(:,:,ii) = inh.poke.base(:,:,ii);
        inhFlp.poke.cue(:,:,ii) = inh.poke.cue(:,:,ii);
        inhFlp.poke.s1.interval(:,:,ii) = inh.poke.s1.interval(:,:,ii);
        inhFlp.poke.ms500.interval(:,:,ii) = inh.poke.ms500.interval(:,:,ii);
        inhFlp.cer.cue(:,:,ii) = inh.cer.cue(:,:,ii);
        inhFlp.cer.s1.interval(:,:,ii) = inh.cer.s1.interval(:,:,ii);
        inhFlp.cer.ms500.interval(:,:,ii) = inh.cer.ms500.interval(:,:,ii);
        inhFlp.fire.raw.base10(:,:,ii) = inh.fire.raw.base10(:,:,ii);
        inhFlp.fire.raw.select.shock(:,:,ii) = inh.fire.raw.select.shock(:,:,ii);
        inhFlp.fire.raw.select.cueOnset(:,:,ii) = inh.fire.raw.select.cueOnset(:,:,ii);
        inhFlp.fire.raw.select.cueOffset(:,:,ii) = inh.fire.raw.select.cueOffset(:,:,ii);
        inhFlp.fire.raw.select.cueEntire(:,:,ii) = inh.fire.raw.select.cueEntire(:,:,ii);
        inhFlp.fire.raw.select.cueFirstFive(:,:,ii) = inh.fire.raw.select.cueFirstFive(:,:,ii);
        inhFlp.fire.raw.select.cueLastFive(:,:,ii) = inh.fire.raw.select.cueLastFive(:,:,ii);
        inhFlp.fire.raw.select.dirSig(:,:,ii) = inh.fire.raw.select.dirSig(:,:,ii);
        inhFlp.fire.raw.s1.interval(:,:,ii) = inh.fire.raw.s1.interval(:,:,ii);
        inhFlp.fire.raw.ms500.interval(:,:,ii) = inh.fire.raw.ms500.interval(:,:,ii);
        inhFlp.fire.raw.ms250.interval(:,:,ii) = inh.fire.raw.ms250.interval(:,:,ii);
        inhFlp.fire.raw.ms100.interval(:,:,ii) = inh.fire.raw.ms100.interval(:,:,ii);
        inhFlp.fire.diff.s1.interval(:,:,ii) = inh.fire.diff.s1.interval(:,:,ii);
        inhFlp.fire.diff.ms500.interval(:,:,ii) = inh.fire.diff.ms500.interval(:,:,ii);
        inhFlp.fire.diff.ms250.interval(:,:,ii) = inh.fire.diff.ms250.interval(:,:,ii);
        inhFlp.fire.diff.ms100.interval(:,:,ii) = inh.fire.diff.ms100.interval(:,:,ii);
        inhFlp.fire.z.s1.interval(:,:,ii) = inh.fire.z.s1.interval(:,:,ii);
        inhFlp.fire.z.ms500.interval(:,:,ii) = inh.fire.z.ms500.interval(:,:,ii);
        inhFlp.fire.z.ms250.interval(:,:,ii) = inh.fire.z.ms250.interval(:,:,ii);
        inhFlp.fire.z.ms100.interval(:,:,ii) = inh.fire.z.ms100.interval(:,:,ii);
    
   else % Assign nan values to units not excited to either cue100 or cueSPR shock delivery
    
        inhFlp.tag(:,:,ii) = nan(32,2);
        inhFlp.wave(:,:,ii) = nan(32,1);
        inhFlp.poke.base(:,:,ii) = nan(32,1);
        inhFlp.poke.cue(:,:,ii) = nan(32,1);
        inhFlp.poke.s1.interval(:,:,ii) = nan(32,50);
        inhFlp.poke.ms500.interval(:,:,ii) = nan(32,100);
        inhFlp.poke.ms250.interval(:,:,ii) = nan(32,200);
        inhFlp.poke.ms100.interval(:,:,ii) = nan(32,500);
        inhFlp.cer.cue(:,:,ii) = nan(32,1);
        inhFlp.cer.s1.interval(:,:,ii) = nan(32,50);
        inhFlp.cer.ms500.interval(:,:,ii) = nan(32,100);
        inhFlp.cer.ms250.interval(:,:,ii) = nan(32,200);
        inhFlp.cer.ms100.interval(:,:,ii) = nan(32,500);
        inhFlp.fire.raw.base10(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.shock(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.cueOnset(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.cueOffset(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.cueEntire(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.cueFirstFive(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.cueLastFive(:,:,ii) = nan(32,1);
        inhFlp.fire.raw.select.dirSig(:,:,ii) = nan(1,9);
        inhFlp.fire.raw.s1.interval(:,:,ii) = nan(32,50);
        inhFlp.fire.raw.ms500.interval(:,:,ii) = nan(32,100);
        inhFlp.fire.raw.ms250.interval(:,:,ii) = nan(32,200);
        inhFlp.fire.raw.ms100.interval(:,:,ii) = nan(32,500);
        inhFlp.fire.diff.s1.interval(:,:,ii) = nan(32,50);
        inhFlp.fire.diff.ms500.interval(:,:,ii) = nan(32,100);
        inhFlp.fire.diff.ms250.interval(:,:,ii) = nan(32,200);
        inhFlp.fire.diff.ms100.interval(:,:,ii) = nan(32,500);
        inhFlp.fire.z.s1.interval(:,:,ii) = nan(32,50);
        inhFlp.fire.z.ms500.interval(:,:,ii) = nan(32,100);
        inhFlp.fire.z.ms250.interval(:,:,ii) = nan(32,200);
        inhFlp.fire.z.ms100.interval(:,:,ii) = nan(32,500);
    
   end % Identify the nan matrix slices
    
        deleteThisSliceF(ii) = any(all(isnan(inhFlp.tag(32,1,ii)), 1));  %#ok<*SAGROW>     
        
end

% Excise the nan slices, creating 3D matrix of only shock-responsive units

inhSus.tag = inhSus.tag(:,:,~deleteThisSliceS);
inhSus.wave = inhSus.wave(:,:,~deleteThisSliceS);
inhSus.name = inhSus.name(:,:,~deleteThisSliceS);
inhSus.poke.base = inhSus.poke.base(:,:,~deleteThisSliceS);
inhSus.poke.cue = inhSus.poke.cue(:,:,~deleteThisSliceS);
inhSus.poke.s1.interval = inhSus.poke.s1.interval(:,:,~deleteThisSliceS);
inhSus.poke.ms500.interval = inhSus.poke.ms500.interval(:,:,~deleteThisSliceS);
inhSus.cer.cue = inhSus.cer.cue(:,:,~deleteThisSliceS);
inhSus.cer.s1.interval = inhSus.cer.s1.interval(:,:,~deleteThisSliceS);
inhSus.cer.ms500.interval = inhSus.cer.ms500.interval(:,:,~deleteThisSliceS);
inhSus.fire.raw.base10 = inhSus.fire.raw.base10(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.shock = inhSus.fire.raw.select.shock(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.cueOnset = inhSus.fire.raw.select.cueOnset(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.cueOffset = inhSus.fire.raw.select.cueOffset(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.cueEntire = inhSus.fire.raw.select.cueEntire(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.cueFirstFive = inhSus.fire.raw.select.cueFirstFive(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.cueLastFive = inhSus.fire.raw.select.cueLastFive(:,:,~deleteThisSliceS);
inhSus.fire.raw.select.dirSig = inhSus.fire.raw.select.dirSig(:,:,~deleteThisSliceS);
inhSus.fire.raw.s1.interval = inhSus.fire.raw.s1.interval(:,:,~deleteThisSliceS);
inhSus.fire.raw.ms500.interval = inhSus.fire.raw.ms500.interval(:,:,~deleteThisSliceS);
inhSus.fire.raw.ms250.interval = inhSus.fire.raw.ms250.interval(:,:,~deleteThisSliceS);
inhSus.fire.raw.ms100.interval = inhSus.fire.raw.ms100.interval(:,:,~deleteThisSliceS);
inhSus.fire.diff.s1.interval = inhSus.fire.diff.s1.interval(:,:,~deleteThisSliceS);
inhSus.fire.diff.ms500.interval = inhSus.fire.diff.ms500.interval(:,:,~deleteThisSliceS);
inhSus.fire.diff.ms250.interval = inhSus.fire.diff.ms250.interval(:,:,~deleteThisSliceS);
inhSus.fire.diff.ms100.interval = inhSus.fire.diff.ms100.interval(:,:,~deleteThisSliceS);
inhSus.fire.z.s1.interval = inhSus.fire.z.s1.interval(:,:,~deleteThisSliceS);
inhSus.fire.z.ms500.interval = inhSus.fire.z.ms500.interval(:,:,~deleteThisSliceS);
inhSus.fire.z.ms250.interval = inhSus.fire.z.ms250.interval(:,:,~deleteThisSliceS);
inhSus.fire.z.ms100.interval = inhSus.fire.z.ms100.interval(:,:,~deleteThisSliceS);

inhFlp.tag = inhFlp.tag(:,:,~deleteThisSliceF);
inhFlp.wave = inhFlp.wave(:,:,~deleteThisSliceF);
inhFlp.name = inhFlp.name(:,:,~deleteThisSliceF);
inhFlp.poke.base = inhFlp.poke.base(:,:,~deleteThisSliceF);
inhFlp.poke.cue = inhFlp.poke.cue(:,:,~deleteThisSliceF);
inhFlp.poke.s1.interval = inhFlp.poke.s1.interval(:,:,~deleteThisSliceF);
inhFlp.poke.ms500.interval = inhFlp.poke.ms500.interval(:,:,~deleteThisSliceF);
inhFlp.poke.ms250.interval = inhFlp.poke.ms250.interval(:,:,~deleteThisSliceF);
inhFlp.poke.ms100.interval = inhFlp.poke.ms100.interval(:,:,~deleteThisSliceF);
inhFlp.cer.cue = inhFlp.cer.cue(:,:,~deleteThisSliceF);
inhFlp.cer.s1.interval = inhFlp.cer.s1.interval(:,:,~deleteThisSliceF);
inhFlp.cer.ms500.interval = inhFlp.cer.ms500.interval(:,:,~deleteThisSliceF);
inhFlp.cer.ms250.interval = inhFlp.cer.ms250.interval(:,:,~deleteThisSliceF);
inhFlp.cer.ms100.interval = inhFlp.cer.ms100.interval(:,:,~deleteThisSliceF);
inhFlp.fire.raw.base10 = inhFlp.fire.raw.base10(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.shock = inhFlp.fire.raw.select.shock(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.cueOnset = inhFlp.fire.raw.select.cueOnset(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.cueOffset = inhFlp.fire.raw.select.cueOffset(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.cueEntire = inhFlp.fire.raw.select.cueEntire(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.cueFirstFive = inhFlp.fire.raw.select.cueFirstFive(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.cueLastFive = inhFlp.fire.raw.select.cueLastFive(:,:,~deleteThisSliceF);
inhFlp.fire.raw.select.dirSig = inhFlp.fire.raw.select.dirSig(:,:,~deleteThisSliceF);
inhFlp.fire.raw.s1.interval = inhFlp.fire.raw.s1.interval(:,:,~deleteThisSliceF);
inhFlp.fire.raw.ms500.interval = inhFlp.fire.raw.ms500.interval(:,:,~deleteThisSliceF);
inhFlp.fire.raw.ms250.interval = inhFlp.fire.raw.ms250.interval(:,:,~deleteThisSliceF);
inhFlp.fire.raw.ms100.interval = inhFlp.fire.raw.ms100.interval(:,:,~deleteThisSliceF);
inhFlp.fire.diff.s1.interval = inhFlp.fire.diff.s1.interval(:,:,~deleteThisSliceF);
inhFlp.fire.diff.ms500.interval = inhFlp.fire.diff.ms500.interval(:,:,~deleteThisSliceF);
inhFlp.fire.diff.ms250.interval = inhFlp.fire.diff.ms250.interval(:,:,~deleteThisSliceF);
inhFlp.fire.diff.ms100.interval = inhFlp.fire.diff.ms100.interval(:,:,~deleteThisSliceF);
inhFlp.fire.z.s1.interval = inhFlp.fire.z.s1.interval(:,:,~deleteThisSliceF);
inhFlp.fire.z.ms500.interval = inhFlp.fire.z.ms500.interval(:,:,~deleteThisSliceF);
inhFlp.fire.z.ms250.interval = inhFlp.fire.z.ms250.interval(:,:,~deleteThisSliceF);
inhFlp.fire.z.ms100.interval = inhFlp.fire.z.ms100.interval(:,:,~deleteThisSliceF);

clear ii deleteThisSliceS deleteThisSliceF;

% Replace Nan cer values with 1

inhSus.cer.cue(isnan(inhSus.cer.cue))=1;
inhSus.cer.s1.interval(isnan(inhSus.cer.s1.interval))=1;
inhSus.cer.ms500.interval(isnan(inhSus.cer.ms500.interval))=1;
inhSus.cer.ms250.interval(isnan(inhSus.cer.ms250.interval))=1;
inhSus.cer.ms100.interval(isnan(inhSus.cer.ms100.interval))=1;

inhFlp.cer.cue(isnan(inhFlp.cer.cue))=1;
inhFlp.cer.s1.interval(isnan(inhFlp.cer.s1.interval))=1;
inhFlp.cer.ms500.interval(isnan(inhFlp.cer.ms500.interval))=1;
inhFlp.cer.ms250.interval(isnan(inhFlp.cer.ms250.interval))=1;
inhFlp.cer.ms100.interval(isnan(inhFlp.cer.ms100.interval))=1;

% Find single unit mean firing for each trial type

for ii = 1:size(inh.tag,3)
    
    inh.cer.cue100(ii,:) = mean(inh.cer.cue(1:6,:,ii));
    inh.cer.cueSPR(ii,:) = mean(inh.cer.cue(7:12,:,ii));
    inh.cer.cueNsPR(ii,:) = mean(inh.cer.cue(13:22,:,ii));
    inh.cer.cuePR(ii,:) = mean(inh.cer.cue(7:22,:,ii));
    inh.cer.cue0(ii,:) = mean(inh.cer.cue(23:32,:,ii));
    
    inh.cer.s1.cue100(ii,:) = mean(inh.cer.s1.interval(1:6,:,ii));
    inh.cer.s1.cueSPR(ii,:) = mean(inh.cer.s1.interval(7:12,:,ii));
    inh.cer.s1.cueNsPR(ii,:) = mean(inh.cer.s1.interval(13:22,:,ii));
    inh.cer.s1.cuePR(ii,:) = mean(inh.cer.s1.interval(7:22,:,ii));
    inh.cer.s1.cue0(ii,:) = mean(inh.cer.s1.interval(23:32,:,ii));
    
    inh.cer.ms500.cue100(ii,:) = mean(inh.cer.ms500.interval(1:6,:,ii));
    inh.cer.ms500.cueSPR(ii,:) = mean(inh.cer.ms500.interval(7:12,:,ii));
    inh.cer.ms500.cueNsPR(ii,:) = mean(inh.cer.ms500.interval(13:22,:,ii));
    inh.cer.ms500.cuePR(ii,:) = mean(inh.cer.ms500.interval(7:22,:,ii));
    inh.cer.ms500.cue0(ii,:) = mean(inh.cer.ms500.interval(23:32,:,ii));
    
    inh.fire.raw.s1.cue100(ii,:) = mean(inh.fire.raw.s1.interval(1:6,:,ii));
    inh.fire.raw.s1.cueSPR(ii,:) = mean(inh.fire.raw.s1.interval(7:12,:,ii));
    inh.fire.raw.s1.cueNsPR(ii,:) = mean(inh.fire.raw.s1.interval(13:22,:,ii));
    inh.fire.raw.s1.cuePR(ii,:) = mean(inh.fire.raw.s1.interval(7:22,:,ii));
    inh.fire.raw.s1.cue0(ii,:) = mean(inh.fire.raw.s1.interval(23:32,:,ii));
    
    inh.fire.raw.ms500.cue100(ii,:) = mean(inh.fire.raw.ms500.interval(1:6,:,ii));
    inh.fire.raw.ms500.cueSPR(ii,:) = mean(inh.fire.raw.ms500.interval(7:12,:,ii));
    inh.fire.raw.ms500.cueNsPR(ii,:) = mean(inh.fire.raw.ms500.interval(13:22,:,ii));
    inh.fire.raw.ms500.cuePR(ii,:) = mean(inh.fire.raw.ms500.interval(7:22,:,ii));
    inh.fire.raw.ms500.cue0(ii,:) = mean(inh.fire.raw.ms500.interval(23:32,:,ii));
    
    inh.fire.raw.ms250.cue100(ii,:) = mean(inh.fire.raw.ms250.interval(1:6,:,ii));
    inh.fire.raw.ms250.cueSPR(ii,:) = mean(inh.fire.raw.ms250.interval(7:12,:,ii));
    inh.fire.raw.ms250.cueNsPR(ii,:) = mean(inh.fire.raw.ms250.interval(13:22,:,ii));
    inh.fire.raw.ms250.cuePR(ii,:) = mean(inh.fire.raw.ms250.interval(7:22,:,ii));
    inh.fire.raw.ms250.cue0(ii,:) = mean(inh.fire.raw.ms250.interval(23:32,:,ii));
    
    inh.fire.raw.ms100.cue100(ii,:) = mean(inh.fire.raw.ms100.interval(1:6,:,ii));
    inh.fire.raw.ms100.cueSPR(ii,:) = mean(inh.fire.raw.ms100.interval(7:12,:,ii));
    inh.fire.raw.ms100.cueNsPR(ii,:) = mean(inh.fire.raw.ms100.interval(13:22,:,ii));
    inh.fire.raw.ms100.cuePR(ii,:) = mean(inh.fire.raw.ms100.interval(7:22,:,ii));
    inh.fire.raw.ms100.cue0(ii,:) = mean(inh.fire.raw.ms100.interval(23:32,:,ii));
    
    inh.fire.diff.s1.cue100(ii,:) = mean(inh.fire.diff.s1.interval(1:6,:,ii));
    inh.fire.diff.s1.cueSPR(ii,:) = mean(inh.fire.diff.s1.interval(7:12,:,ii));
    inh.fire.diff.s1.cueNsPR(ii,:) = mean(inh.fire.diff.s1.interval(13:22,:,ii));
    inh.fire.diff.s1.cuePR(ii,:) = mean(inh.fire.diff.s1.interval(7:22,:,ii));
    inh.fire.diff.s1.cue0(ii,:) = mean(inh.fire.diff.s1.interval(23:32,:,ii));
    
    inh.fire.diff.ms500.cue100(ii,:) = mean(inh.fire.diff.ms500.interval(1:6,:,ii));
    inh.fire.diff.ms500.cueSPR(ii,:) = mean(inh.fire.diff.ms500.interval(7:12,:,ii));
    inh.fire.diff.ms500.cueNsPR(ii,:) = mean(inh.fire.diff.ms500.interval(13:22,:,ii));
    inh.fire.diff.ms500.cuePR(ii,:) = mean(inh.fire.diff.ms500.interval(7:22,:,ii));
    inh.fire.diff.ms500.cue0(ii,:) = mean(inh.fire.diff.ms500.interval(23:32,:,ii));
    
    inh.fire.diff.ms250.cue100(ii,:) = mean(inh.fire.diff.ms250.interval(1:6,:,ii));
    inh.fire.diff.ms250.cueSPR(ii,:) = mean(inh.fire.diff.ms250.interval(7:12,:,ii));
    inh.fire.diff.ms250.cueNsPR(ii,:) = mean(inh.fire.diff.ms250.interval(13:22,:,ii));
    inh.fire.diff.ms250.cuePR(ii,:) = mean(inh.fire.diff.ms250.interval(7:22,:,ii));
    inh.fire.diff.ms250.cue0(ii,:) = mean(inh.fire.diff.ms250.interval(23:32,:,ii));
    
    inh.fire.diff.ms100.cue100(ii,:) = mean(inh.fire.diff.ms100.interval(1:6,:,ii));
    inh.fire.diff.ms100.cueSPR(ii,:) = mean(inh.fire.diff.ms100.interval(7:12,:,ii));
    inh.fire.diff.ms100.cueNsPR(ii,:) = mean(inh.fire.diff.ms100.interval(13:22,:,ii));
    inh.fire.diff.ms100.cuePR(ii,:) = mean(inh.fire.diff.ms100.interval(7:22,:,ii));
    inh.fire.diff.ms100.cue0(ii,:) = mean(inh.fire.diff.ms100.interval(23:32,:,ii));
    
    inh.fire.z.s1.cue100(ii,:) = mean(inh.fire.z.s1.interval(1:6,:,ii));
    inh.fire.z.s1.cueSPR(ii,:) = mean(inh.fire.z.s1.interval(7:12,:,ii));
    inh.fire.z.s1.cueNsPR(ii,:) = mean(inh.fire.z.s1.interval(13:22,:,ii));
    inh.fire.z.s1.cuePR(ii,:) = mean(inh.fire.z.s1.interval(7:22,:,ii));
    inh.fire.z.s1.cue0(ii,:) = mean(inh.fire.z.s1.interval(23:32,:,ii));
    
    inh.fire.z.s1.firstFive.cue100 = mean(inh.fire.z.s1.cue100(:,21:25),2); %NEW
    inh.fire.z.s1.firstFive.cueSPR = mean(inh.fire.z.s1.cueSPR(:,21:25),2); %NEW
    inh.fire.z.s1.firstFive.cueNsPR = mean(inh.fire.z.s1.cueNsPR(:,21:25),2); %NEW
    inh.fire.z.s1.firstFive.cuePR = mean(inh.fire.z.s1.cuePR(:,21:25),2); %NEW
    inh.fire.z.s1.firstFive.cue0 = mean(inh.fire.z.s1.cue0(:,21:25),2); %NEW

    inh.fire.z.s1.lastFive.cue100 = mean(inh.fire.z.s1.cue100(:,26:30),2); %NEW
    inh.fire.z.s1.lastFive.cueSPR = mean(inh.fire.z.s1.cueSPR(:,26:30),2); %NEW
    inh.fire.z.s1.lastFive.cueNsPR = mean(inh.fire.z.s1.cueNsPR(:,26:30),2); %NEW
    inh.fire.z.s1.lastFive.cuePR = mean(inh.fire.z.s1.cuePR(:,26:30),2); %NEW
    inh.fire.z.s1.lastFive.cue0 = mean(inh.fire.z.s1.cue0(:,26:30),2); %NEW
    
    inh.fire.z.s1.cueEntire.cue100 = mean(inh.fire.z.s1.cue100(:,21:30),2); %NEW
    inh.fire.z.s1.cueEntire.cueSPR = mean(inh.fire.z.s1.cueSPR(:,21:30),2); %NEW
    inh.fire.z.s1.cueEntire.cueNsPR = mean(inh.fire.z.s1.cueNsPR(:,21:30),2); %NEW
    inh.fire.z.s1.cueEntire.cuePR = mean(inh.fire.z.s1.cuePR(:,21:30),2); %NEW
    inh.fire.z.s1.cueEntire.cue0 = mean(inh.fire.z.s1.cue0(:,21:30),2); %NEW
    
    inh.fire.z.ms500.cue100(ii,:) = mean(inh.fire.z.ms500.interval(1:6,:,ii));
    inh.fire.z.ms500.cueSPR(ii,:) = mean(inh.fire.z.ms500.interval(7:12,:,ii));
    inh.fire.z.ms500.cueNsPR(ii,:) = mean(inh.fire.z.ms500.interval(13:22,:,ii));
    inh.fire.z.ms500.cuePR(ii,:) = mean(inh.fire.z.ms500.interval(7:22,:,ii));
    inh.fire.z.ms500.cue0(ii,:) = mean(inh.fire.z.ms500.interval(23:32,:,ii));
    
    inh.fire.z.ms500.firstFive.cue100 = mean(inh.fire.z.ms500.cue100(:,41:50),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.firstFive.cueSPR = mean(inh.fire.z.ms500.cueSPR(:,41:50),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.firstFive.cueNsPR = mean(inh.fire.z.ms500.cueNsPR(:,41:50),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.firstFive.cuePR = mean(inh.fire.z.ms500.cuePR(:,41:50),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.firstFive.cue0 = mean(inh.fire.z.ms500.cue0(:,41:50),2); %NEW CHECK w MIKE

    inh.fire.z.ms500.lastFive.cue100 = mean(inh.fire.z.ms500.cue100(:,51:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.lastFive.cueSPR = mean(inh.fire.z.ms500.cueSPR(:,51:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.lastFive.cueNsPR = mean(inh.fire.z.ms500.cueNsPR(:,51:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.lastFive.cuePR = mean(inh.fire.z.ms500.cuePR(:,51:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.lastFive.cue0 = mean(inh.fire.z.ms500.cue0(:,51:60),2); %NEW CHECK w MIKE
    
    inh.fire.z.ms500.cueEntire.cue100 = mean(inh.fire.z.ms500.cue100(:,41:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.cueEntire.cueSPR = mean(inh.fire.z.ms500.cueSPR(:,41:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.cueEntire.cueNsPR = mean(inh.fire.z.ms500.cueNsPR(:,41:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.cueEntire.cuePR = mean(inh.fire.z.ms500.cuePR(:,41:60),2); %NEW CHECK w MIKE
    inh.fire.z.ms500.cueEntire.cue0 = mean(inh.fire.z.ms500.cue0(:,41:60),2); %NEW CHECK w MIKE
    
    inh.fire.z.ms250.cue100(ii,:) = mean(inh.fire.z.ms250.interval(1:6,:,ii));
    inh.fire.z.ms250.cueSPR(ii,:) = mean(inh.fire.z.ms250.interval(7:12,:,ii));
    inh.fire.z.ms250.cueNsPR(ii,:) = mean(inh.fire.z.ms250.interval(13:22,:,ii));
    inh.fire.z.ms250.cuePR(ii,:) = mean(inh.fire.z.ms250.interval(7:22,:,ii));
    inh.fire.z.ms250.cue0(ii,:) = mean(inh.fire.z.ms250.interval(23:32,:,ii));
    
    inh.fire.z.ms250.firstFive.cue100 = mean(inh.fire.z.ms250.cue100(:,81:100),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.firstFive.cueSPR = mean(inh.fire.z.ms250.cueSPR(:,81:100),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.firstFive.cueNsPR = mean(inh.fire.z.ms250.cueNsPR(:,81:100),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.firstFive.cuePR = mean(inh.fire.z.ms250.cuePR(:,81:100),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.firstFive.cue0 = mean(inh.fire.z.ms250.cue0(:,81:100),2); %NEW CHECK w MIKE

    inh.fire.z.ms250.lastFive.cue100 = mean(inh.fire.z.ms250.cue100(:,101:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.lastFive.cueSPR = mean(inh.fire.z.ms250.cueSPR(:,101:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.lastFive.cueNsPR = mean(inh.fire.z.ms250.cueNsPR(:,101:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.lastFive.cuePR = mean(inh.fire.z.ms250.cuePR(:,101:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.lastFive.cue0 = mean(inh.fire.z.ms250.cue0(:,101:120),2); %NEW CHECK w MIKE
    
    inh.fire.z.ms250.cueEntire.cue100 = mean(inh.fire.z.ms250.cue100(:,81:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.cueEntire.cueSPR = mean(inh.fire.z.ms250.cueSPR(:,81:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.cueEntire.cueNsPR = mean(inh.fire.z.ms250.cueNsPR(:,81:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.cueEntire.cuePR = mean(inh.fire.z.ms250.cuePR(:,81:120),2); %NEW CHECK w MIKE
    inh.fire.z.ms250.cueEntire.cue0 = mean(inh.fire.z.ms250.cue0(:,81:120),2); %NEW CHECK w MIKE
    
    inh.fire.z.ms100.cue100(ii,:) = mean(inh.fire.z.ms100.interval(1:6,:,ii));
    inh.fire.z.ms100.cueSPR(ii,:) = mean(inh.fire.z.ms100.interval(7:12,:,ii));
    inh.fire.z.ms100.cueNsPR(ii,:) = mean(inh.fire.z.ms100.interval(13:22,:,ii));
    inh.fire.z.ms100.cuePR(ii,:) = mean(inh.fire.z.ms100.interval(7:22,:,ii));
    inh.fire.z.ms100.cue0(ii,:) = mean(inh.fire.z.ms100.interval(23:32,:,ii));
    
    inh.fire.z.ms100.firstFive.cue100 = mean(inh.fire.z.ms100.cue100(:,201:250),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.firstFive.cueSPR = mean(inh.fire.z.ms100.cueSPR(:,201:250),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.firstFive.cueNsPR = mean(inh.fire.z.ms100.cueNsPR(:,201:250),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.firstFive.cuePR = mean(inh.fire.z.ms100.cuePR(:,201:250),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.firstFive.cue0 = mean(inh.fire.z.ms100.cue0(:,201:250),2); %NEW CHECK w MIKE

    inh.fire.z.ms100.lastFive.cue100 = mean(inh.fire.z.ms100.cue100(:,251:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.lastFive.cueSPR = mean(inh.fire.z.ms100.cueSPR(:,251:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.lastFive.cueNsPR = mean(inh.fire.z.ms100.cueNsPR(:,251:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.lastFive.cuePR = mean(inh.fire.z.ms100.cuePR(:,251:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.lastFive.cue0 = mean(inh.fire.z.ms100.cue0(:,251:300),2); %NEW CHECK w MIKE
    
    inh.fire.z.ms100.cueEntire.cue100 = mean(inh.fire.z.ms100.cue100(:,201:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.cueEntire.cueSPR = mean(inh.fire.z.ms100.cueSPR(:,201:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.cueEntire.cueNsPR = mean(inh.fire.z.ms100.cueNsPR(:,201:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.cueEntire.cuePR = mean(inh.fire.z.ms100.cuePR(:,201:300),2); %NEW CHECK w MIKE
    inh.fire.z.ms100.cueEntire.cue0 = mean(inh.fire.z.ms100.cue0(:,201:300),2); %NEW CHECK w MIKE
    
end

clear ii;

inh.cer.cue100mean = mean(inh.cer.cue100);
inh.cer.cueSPRmean = mean(inh.cer.cueSPR);
inh.cer.cueNsPRmean = mean(inh.cer.cueNsPR);
inh.cer.cuePRmean = mean(inh.cer.cuePR);
inh.cer.cue0mean = mean(inh.cer.cue0);

inh.cer.cue100SEM = (std(inh.cer.cue100))/(sqrt((size(inh.tag,3))-1));
inh.cer.cueSPRSEM = (std(inh.cer.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.cer.cueNsPRSEM = (std(inh.cer.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.cer.cuePRSEM = (std(inh.cer.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.cer.cue0SEM = (std(inh.cer.cue0))/(sqrt((size(inh.tag,3))-1));

inh.cer.s1.cue100mean = mean(inh.cer.s1.cue100);
inh.cer.s1.cueSPRmean = mean(inh.cer.s1.cueSPR);
inh.cer.s1.cueNsPRmean = mean(inh.cer.s1.cueNsPR);
inh.cer.s1.cuePRmean = mean(inh.cer.s1.cuePR);
inh.cer.s1.cue0mean = mean(inh.cer.s1.cue0);

inh.cer.ms500.cue100mean = mean(inh.cer.ms500.cue100);
inh.cer.ms500.cueSPRmean = mean(inh.cer.ms500.cueSPR);
inh.cer.ms500.cueNsPRmean = mean(inh.cer.ms500.cueNsPR);
inh.cer.ms500.cuePRmean = mean(inh.cer.ms500.cuePR);
inh.cer.ms500.cue0mean = mean(inh.cer.ms500.cue0);

% Find Find single unit mean firing for each trial type -- inhSus pop.

for ii = 1:size(inhSus.tag,3)
    
    inhSus.cer.cue100(ii,:) = mean(inhSus.cer.cue(1:6,:,ii));
    inhSus.cer.cueSPR(ii,:) = mean(inhSus.cer.cue(7:12,:,ii));
    inhSus.cer.cueNsPR(ii,:) = mean(inhSus.cer.cue(13:22,:,ii));
    inhSus.cer.cuePR(ii,:) = mean(inhSus.cer.cue(7:22,:,ii));
    inhSus.cer.cue0(ii,:) = mean(inhSus.cer.cue(23:32,:,ii));
    
    inhSus.cer.s1.cue100(ii,:) = mean(inhSus.cer.s1.interval(1:6,:,ii));
    inhSus.cer.s1.cueSPR(ii,:) = mean(inhSus.cer.s1.interval(7:12,:,ii));
    inhSus.cer.s1.cueNsPR(ii,:) = mean(inhSus.cer.s1.interval(13:22,:,ii));
    inhSus.cer.s1.cuePR(ii,:) = mean(inhSus.cer.s1.interval(7:22,:,ii));
    inhSus.cer.s1.cue0(ii,:) = mean(inhSus.cer.s1.interval(23:32,:,ii));
    
    inhSus.cer.ms500.cue100(ii,:) = mean(inhSus.cer.ms500.interval(1:6,:,ii));
    inhSus.cer.ms500.cueSPR(ii,:) = mean(inhSus.cer.ms500.interval(7:12,:,ii));
    inhSus.cer.ms500.cueNsPR(ii,:) = mean(inhSus.cer.ms500.interval(13:22,:,ii));
    inhSus.cer.ms500.cuePR(ii,:) = mean(inhSus.cer.ms500.interval(7:22,:,ii));
    inhSus.cer.ms500.cue0(ii,:) = mean(inhSus.cer.ms500.interval(23:32,:,ii));
    
    inhSus.cer.ms250.cue100(ii,:) = mean(inhSus.cer.ms250.interval(1:6,:,ii));
    inhSus.cer.ms250.cueSPR(ii,:) = mean(inhSus.cer.ms250.interval(7:12,:,ii));
    inhSus.cer.ms250.cueNsPR(ii,:) = mean(inhSus.cer.ms250.interval(13:22,:,ii));
    inhSus.cer.ms250.cuePR(ii,:) = mean(inhSus.cer.ms250.interval(7:22,:,ii));
    inhSus.cer.ms250.cue0(ii,:) = mean(inhSus.cer.ms250.interval(23:32,:,ii));
    
    inhSus.cer.ms100.cue100(ii,:) = mean(inhSus.cer.ms100.interval(1:6,:,ii));
    inhSus.cer.ms100.cueSPR(ii,:) = mean(inhSus.cer.ms100.interval(7:12,:,ii));
    inhSus.cer.ms100.cueNsPR(ii,:) = mean(inhSus.cer.ms100.interval(13:22,:,ii));
    inhSus.cer.ms100.cuePR(ii,:) = mean(inhSus.cer.ms100.interval(7:22,:,ii));
    inhSus.cer.ms100.cue0(ii,:) = mean(inhSus.cer.ms100.interval(23:32,:,ii));
    
    inhSus.fire.raw.s1.cue100(ii,:) = mean(inhSus.fire.raw.s1.interval(1:6,:,ii));
    inhSus.fire.raw.s1.cueSPR(ii,:) = mean(inhSus.fire.raw.s1.interval(7:12,:,ii));
    inhSus.fire.raw.s1.cueNsPR(ii,:) = mean(inhSus.fire.raw.s1.interval(13:22,:,ii));
    inhSus.fire.raw.s1.cuePR(ii,:) = mean(inhSus.fire.raw.s1.interval(7:22,:,ii));
    inhSus.fire.raw.s1.cue0(ii,:) = mean(inhSus.fire.raw.s1.interval(23:32,:,ii));
    
    inhSus.fire.raw.ms500.cue100(ii,:) = mean(inhSus.fire.raw.ms500.interval(1:6,:,ii));
    inhSus.fire.raw.ms500.cueSPR(ii,:) = mean(inhSus.fire.raw.ms500.interval(7:12,:,ii));
    inhSus.fire.raw.ms500.cueNsPR(ii,:) = mean(inhSus.fire.raw.ms500.interval(13:22,:,ii));
    inhSus.fire.raw.ms500.cuePR(ii,:) = mean(inhSus.fire.raw.ms500.interval(7:22,:,ii));
    inhSus.fire.raw.ms500.cue0(ii,:) = mean(inhSus.fire.raw.ms500.interval(23:32,:,ii));
    
    inhSus.fire.raw.ms250.cue100(ii,:) = mean(inhSus.fire.raw.ms250.interval(1:6,:,ii));
    inhSus.fire.raw.ms250.cueSPR(ii,:) = mean(inhSus.fire.raw.ms250.interval(7:12,:,ii));
    inhSus.fire.raw.ms250.cueNsPR(ii,:) = mean(inhSus.fire.raw.ms250.interval(13:22,:,ii));
    inhSus.fire.raw.ms250.cuePR(ii,:) = mean(inhSus.fire.raw.ms250.interval(7:22,:,ii));
    inhSus.fire.raw.ms250.cue0(ii,:) = mean(inhSus.fire.raw.ms250.interval(23:32,:,ii));
    
    inhSus.fire.raw.ms100.cue100(ii,:) = mean(inhSus.fire.raw.ms100.interval(1:6,:,ii));
    inhSus.fire.raw.ms100.cueSPR(ii,:) = mean(inhSus.fire.raw.ms100.interval(7:12,:,ii));
    inhSus.fire.raw.ms100.cueNsPR(ii,:) = mean(inhSus.fire.raw.ms100.interval(13:22,:,ii));
    inhSus.fire.raw.ms100.cuePR(ii,:) = mean(inhSus.fire.raw.ms100.interval(7:22,:,ii));
    inhSus.fire.raw.ms100.cue0(ii,:) = mean(inhSus.fire.raw.ms100.interval(23:32,:,ii));
    
    inhSus.fire.diff.s1.cue100(ii,:) = mean(inhSus.fire.diff.s1.interval(1:6,:,ii));
    inhSus.fire.diff.s1.cueSPR(ii,:) = mean(inhSus.fire.diff.s1.interval(7:12,:,ii));
    inhSus.fire.diff.s1.cueNsPR(ii,:) = mean(inhSus.fire.diff.s1.interval(13:22,:,ii));
    inhSus.fire.diff.s1.cuePR(ii,:) = mean(inhSus.fire.diff.s1.interval(7:22,:,ii));
    inhSus.fire.diff.s1.cue0(ii,:) = mean(inhSus.fire.diff.s1.interval(23:32,:,ii));
    
    inhSus.fire.diff.ms500.cue100(ii,:) = mean(inhSus.fire.diff.ms500.interval(1:6,:,ii));
    inhSus.fire.diff.ms500.cueSPR(ii,:) = mean(inhSus.fire.diff.ms500.interval(7:12,:,ii));
    inhSus.fire.diff.ms500.cueNsPR(ii,:) = mean(inhSus.fire.diff.ms500.interval(13:22,:,ii));
    inhSus.fire.diff.ms500.cuePR(ii,:) = mean(inhSus.fire.diff.ms500.interval(7:22,:,ii));
    inhSus.fire.diff.ms500.cue0(ii,:) = mean(inhSus.fire.diff.ms500.interval(23:32,:,ii));
    
    inhSus.fire.diff.ms250.cue100(ii,:) = mean(inhSus.fire.diff.ms250.interval(1:6,:,ii));
    inhSus.fire.diff.ms250.cueSPR(ii,:) = mean(inhSus.fire.diff.ms250.interval(7:12,:,ii));
    inhSus.fire.diff.ms250.cueNsPR(ii,:) = mean(inhSus.fire.diff.ms250.interval(13:22,:,ii));
    inhSus.fire.diff.ms250.cuePR(ii,:) = mean(inhSus.fire.diff.ms250.interval(7:22,:,ii));
    inhSus.fire.diff.ms250.cue0(ii,:) = mean(inhSus.fire.diff.ms250.interval(23:32,:,ii));
    
    inhSus.fire.diff.ms100.cue100(ii,:) = mean(inhSus.fire.diff.ms100.interval(1:6,:,ii));
    inhSus.fire.diff.ms100.cueSPR(ii,:) = mean(inhSus.fire.diff.ms100.interval(7:12,:,ii));
    inhSus.fire.diff.ms100.cueNsPR(ii,:) = mean(inhSus.fire.diff.ms100.interval(13:22,:,ii));
    inhSus.fire.diff.ms100.cuePR(ii,:) = mean(inhSus.fire.diff.ms100.interval(7:22,:,ii));
    inhSus.fire.diff.ms100.cue0(ii,:) = mean(inhSus.fire.diff.ms100.interval(23:32,:,ii));
    
    inhSus.fire.z.s1.cue100(ii,:) = mean(inhSus.fire.z.s1.interval(1:6,:,ii));
    inhSus.fire.z.s1.cueSPR(ii,:) = mean(inhSus.fire.z.s1.interval(7:12,:,ii));
    inhSus.fire.z.s1.cueNsPR(ii,:) = mean(inhSus.fire.z.s1.interval(13:22,:,ii));
    inhSus.fire.z.s1.cuePR(ii,:) = mean(inhSus.fire.z.s1.interval(7:22,:,ii));
    inhSus.fire.z.s1.cue0(ii,:) = mean(inhSus.fire.z.s1.interval(23:32,:,ii));
    
    inhSus.fire.z.s1.firstFive.cue100 = mean(inhSus.fire.z.s1.cue100(:,21:25),2); %NEW
    inhSus.fire.z.s1.firstFive.cueSPR = mean(inhSus.fire.z.s1.cueSPR(:,21:25),2); %NEW
    inhSus.fire.z.s1.firstFive.cueNsPR = mean(inhSus.fire.z.s1.cueNsPR(:,21:25),2); %NEW
    inhSus.fire.z.s1.firstFive.cuePR = mean(inhSus.fire.z.s1.cuePR(:,21:25),2); %NEW
    inhSus.fire.z.s1.firstFive.cue0 = mean(inhSus.fire.z.s1.cue0(:,21:25),2); %NEW

    inhSus.fire.z.s1.firstFive.cue100mean = mean(inhSus.fire.z.s1.firstFive.cue100); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.firstFive.cueSPRmean = mean(inhSus.fire.z.s1.firstFive.cueSPR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.firstFive.cueNsPRmean = mean(inhSus.fire.z.s1.firstFive.cueNsPR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.firstFive.cuePRmean = mean(inhSus.fire.z.s1.firstFive.cuePR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.firstFive.cue0mean = mean(inhSus.fire.z.s1.firstFive.cue0); %NEW MEAN FOR BAR
    
    inhSus.fire.z.s1.firstFive.cue100SEM = std(inhSus.fire.z.s1.firstFive.cue100)/sqrt((length(inhSus.fire.z.s1.firstFive.cue100)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.firstFive.cueSPRSEM = std(inhSus.fire.z.s1.firstFive.cueSPR)/sqrt((length(inhSus.fire.z.s1.firstFive.cueSPR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.firstFive.cueNsPRSEM = std(inhSus.fire.z.s1.firstFive.cueNsPR)/sqrt((length(inhSus.fire.z.s1.firstFive.cueNsPR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.firstFive.cuePRSEM = std(inhSus.fire.z.s1.firstFive.cuePR)/sqrt((length(inhSus.fire.z.s1.firstFive.cuePR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.firstFive.cue0SEM = std(inhSus.fire.z.s1.firstFive.cue0)/sqrt((length(inhSus.fire.z.s1.firstFive.cue0)-1)); %NEW SEM FOR BAR
    
    inhSus.fire.z.s1.lastFive.cue100 = mean(inhSus.fire.z.s1.cue100(:,26:30),2); %NEW
    inhSus.fire.z.s1.lastFive.cueSPR = mean(inhSus.fire.z.s1.cueSPR(:,26:30),2); %NEW
    inhSus.fire.z.s1.lastFive.cueNsPR = mean(inhSus.fire.z.s1.cueNsPR(:,26:30),2); %NEW
    inhSus.fire.z.s1.lastFive.cuePR = mean(inhSus.fire.z.s1.cuePR(:,26:30),2); %NEW
    inhSus.fire.z.s1.lastFive.cue0 = mean(inhSus.fire.z.s1.cue0(:,26:30),2); %NEW
    
    inhSus.fire.z.s1.lastFive.cue100mean = mean(inhSus.fire.z.s1.lastFive.cue100); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.lastFive.cueSPRmean = mean(inhSus.fire.z.s1.lastFive.cueSPR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.lastFive.cueNsPRmean = mean(inhSus.fire.z.s1.lastFive.cueNsPR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.lastFive.cuePRmean = mean(inhSus.fire.z.s1.lastFive.cuePR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.lastFive.cue0mean = mean(inhSus.fire.z.s1.lastFive.cue0); %NEW MEAN FOR BAR
    
    inhSus.fire.z.s1.lastFive.cue100SEM = std(inhSus.fire.z.s1.lastFive.cue100)/sqrt((length(inhSus.fire.z.s1.lastFive.cue100)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.lastFive.cueSPRSEM = std(inhSus.fire.z.s1.lastFive.cueSPR)/sqrt((length(inhSus.fire.z.s1.lastFive.cueSPR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.lastFive.cueNsPRSEM = std(inhSus.fire.z.s1.lastFive.cueNsPR)/sqrt((length(inhSus.fire.z.s1.lastFive.cueNsPR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.lastFive.cuePRSEM = std(inhSus.fire.z.s1.lastFive.cuePR)/sqrt((length(inhSus.fire.z.s1.lastFive.cuePR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.lastFive.cue0SEM = std(inhSus.fire.z.s1.lastFive.cue0)/sqrt((length(inhSus.fire.z.s1.lastFive.cue0)-1)); %NEW SEM FOR BAR
    
    inhSus.fire.z.s1.cueEntire.cue100 = mean(inhSus.fire.z.s1.cue100(:,21:30),2); %NEW
    inhSus.fire.z.s1.cueEntire.cueSPR = mean(inhSus.fire.z.s1.cueSPR(:,21:30),2); %NEW
    inhSus.fire.z.s1.cueEntire.cueNsPR = mean(inhSus.fire.z.s1.cueNsPR(:,21:30),2); %NEW
    inhSus.fire.z.s1.cueEntire.cuePR = mean(inhSus.fire.z.s1.cuePR(:,21:30),2); %NEW
    inhSus.fire.z.s1.cueEntire.cue0 = mean(inhSus.fire.z.s1.cue0(:,21:30),2); %NEW
    
    inhSus.fire.z.s1.cueEntire.cue100mean = mean(inhSus.fire.z.s1.cueEntire.cue100); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.cueEntire.cueSPRmean = mean(inhSus.fire.z.s1.cueEntire.cueSPR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.cueEntire.cueNsPRmean = mean(inhSus.fire.z.s1.cueEntire.cueNsPR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.cueEntire.cuePRmean = mean(inhSus.fire.z.s1.cueEntire.cuePR); %NEW MEAN FOR BAR
    inhSus.fire.z.s1.cueEntire.cue0mean = mean(inhSus.fire.z.s1.cueEntire.cue0); %NEW MEAN FOR BAR
    
    inhSus.fire.z.s1.cueEntire.cue100SEM = std(inhSus.fire.z.s1.cueEntire.cue100)/sqrt((length(inhSus.fire.z.s1.cueEntire.cue100)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.cueEntire.cueSPRSEM = std(inhSus.fire.z.s1.cueEntire.cueSPR)/sqrt((length(inhSus.fire.z.s1.cueEntire.cueSPR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.cueEntire.cueNsPRSEM = std(inhSus.fire.z.s1.cueEntire.cueNsPR)/sqrt((length(inhSus.fire.z.s1.cueEntire.cueNsPR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.cueEntire.cuePRSEM = std(inhSus.fire.z.s1.cueEntire.cuePR)/sqrt((length(inhSus.fire.z.s1.cueEntire.cuePR)-1)); %NEW SEM FOR BAR
    inhSus.fire.z.s1.cueEntire.cue0SEM = std(inhSus.fire.z.s1.cueEntire.cue0)/sqrt((length(inhSus.fire.z.s1.cueEntire.cue0)-1)); %NEW SEM FOR BAR
    
    inhSus.fire.z.ms500.cue100(ii,:) = mean(inhSus.fire.z.ms500.interval(1:6,:,ii));
    inhSus.fire.z.ms500.cueSPR(ii,:) = mean(inhSus.fire.z.ms500.interval(7:12,:,ii));
    inhSus.fire.z.ms500.cueNsPR(ii,:) = mean(inhSus.fire.z.ms500.interval(13:22,:,ii));
    inhSus.fire.z.ms500.cuePR(ii,:) = mean(inhSus.fire.z.ms500.interval(7:22,:,ii));
    inhSus.fire.z.ms500.cue0(ii,:) = mean(inhSus.fire.z.ms500.interval(23:32,:,ii));
    
    inhSus.fire.z.ms500.firstFive.cue100 = mean(inhSus.fire.z.ms500.cue100(:,41:50),2); %ROW MEANS firstFive
    inhSus.fire.z.ms500.firstFive.cueSPR = mean(inhSus.fire.z.ms500.cueSPR(:,41:50),2); %ROW MEANS firstFive
    inhSus.fire.z.ms500.firstFive.cueNsPR = mean(inhSus.fire.z.ms500.cueNsPR(:,41:50),2); %ROW MEANS firstFive
    inhSus.fire.z.ms500.firstFive.cuePR = mean(inhSus.fire.z.ms500.cuePR(:,41:50),2); %ROW MEANS firstFive
    inhSus.fire.z.ms500.firstFive.cue0 = mean(inhSus.fire.z.ms500.cue0(:,41:50),2); %ROW MEANS firstFive

    inhSus.fire.z.ms500.firstFive.cue100mean = mean(inhSus.fire.z.ms500.firstFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.firstFive.cueSPRmean = mean(inhSus.fire.z.ms500.firstFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.firstFive.cueNsPRmean = mean(inhSus.fire.z.ms500.firstFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.firstFive.cuePRmean = mean(inhSus.fire.z.ms500.firstFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.firstFive.cue0mean = mean(inhSus.fire.z.ms500.firstFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms500.firstFive.cue100SEM = std(inhSus.fire.z.ms500.firstFive.cue100)/sqrt((length(inhSus.fire.z.ms500.firstFive.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.firstFive.cueSPRSEM = std(inhSus.fire.z.ms500.firstFive.cueSPR)/sqrt((length(inhSus.fire.z.ms500.firstFive.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.firstFive.cueNsPRSEM = std(inhSus.fire.z.ms500.firstFive.cueNsPR)/sqrt((length(inhSus.fire.z.ms500.firstFive.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.firstFive.cuePRSEM = std(inhSus.fire.z.ms500.firstFive.cuePR)/sqrt((length(inhSus.fire.z.ms500.firstFive.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.firstFive.cue0SEM = std(inhSus.fire.z.ms500.firstFive.cue0)/sqrt((length(inhSus.fire.z.ms500.firstFive.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms500.lastFive.cue100 = mean(inhSus.fire.z.ms500.cue100(:,51:60),2); %ROW MEANS lastFive
    inhSus.fire.z.ms500.lastFive.cueSPR = mean(inhSus.fire.z.ms500.cueSPR(:,51:60),2); %ROW MEANS lastFive
    inhSus.fire.z.ms500.lastFive.cueNsPR = mean(inhSus.fire.z.ms500.cueNsPR(:,51:60),2); %ROW MEANS lastFive
    inhSus.fire.z.ms500.lastFive.cuePR = mean(inhSus.fire.z.ms500.cuePR(:,51:60),2); %ROW MEANS lastFive
    inhSus.fire.z.ms500.lastFive.cue0 = mean(inhSus.fire.z.ms500.cue0(:,51:60),2); %ROW MEANS lastFive
    
    inhSus.fire.z.ms500.lastFive.cue100mean = mean(inhSus.fire.z.ms500.lastFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.lastFive.cueSPRmean = mean(inhSus.fire.z.ms500.lastFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.lastFive.cueNsPRmean = mean(inhSus.fire.z.ms500.lastFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.lastFive.cuePRmean = mean(inhSus.fire.z.ms500.lastFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.lastFive.cue0mean = mean(inhSus.fire.z.ms500.lastFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms500.lastFive.cue100SEM = std(inhSus.fire.z.ms500.lastFive.cue100)/sqrt((length(inhSus.fire.z.ms500.lastFive.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.lastFive.cueSPRSEM = std(inhSus.fire.z.ms500.lastFive.cueSPR)/sqrt((length(inhSus.fire.z.ms500.lastFive.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.lastFive.cueNsPRSEM = std(inhSus.fire.z.ms500.lastFive.cueNsPR)/sqrt((length(inhSus.fire.z.ms500.lastFive.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.lastFive.cuePRSEM = std(inhSus.fire.z.ms500.lastFive.cuePR)/sqrt((length(inhSus.fire.z.ms500.lastFive.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.lastFive.cue0SEM = std(inhSus.fire.z.ms500.lastFive.cue0)/sqrt((length(inhSus.fire.z.ms500.lastFive.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms500.cueEntire.cue100 = mean(inhSus.fire.z.ms500.cue100(:,41:60),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms500.cueEntire.cueSPR = mean(inhSus.fire.z.ms500.cueSPR(:,41:60),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms500.cueEntire.cueNsPR = mean(inhSus.fire.z.ms500.cueNsPR(:,41:60),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms500.cueEntire.cuePR = mean(inhSus.fire.z.ms500.cuePR(:,41:60),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms500.cueEntire.cue0 = mean(inhSus.fire.z.ms500.cue0(:,41:60),2); %ROW MEANS cueEntire

    inhSus.fire.z.ms500.cueEntire.cue100mean = mean(inhSus.fire.z.ms500.cueEntire.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.cueEntire.cueSPRmean = mean(inhSus.fire.z.ms500.cueEntire.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.cueEntire.cueNsPRmean = mean(inhSus.fire.z.ms500.cueEntire.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.cueEntire.cuePRmean = mean(inhSus.fire.z.ms500.cueEntire.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms500.cueEntire.cue0mean = mean(inhSus.fire.z.ms500.cueEntire.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms500.cueEntire.cue100SEM = std(inhSus.fire.z.ms500.cueEntire.cue100)/sqrt((length(inhSus.fire.z.ms500.cueEntire.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.cueEntire.cueSPRSEM = std(inhSus.fire.z.ms500.cueEntire.cueSPR)/sqrt((length(inhSus.fire.z.ms500.cueEntire.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.cueEntire.cueNsPRSEM = std(inhSus.fire.z.ms500.cueEntire.cueNsPR)/sqrt((length(inhSus.fire.z.ms500.cueEntire.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.cueEntire.cuePRSEM = std(inhSus.fire.z.ms500.cueEntire.cuePR)/sqrt((length(inhSus.fire.z.ms500.cueEntire.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms500.cueEntire.cue0SEM = std(inhSus.fire.z.ms500.cueEntire.cue0)/sqrt((length(inhSus.fire.z.ms500.cueEntire.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms250.cue100(ii,:) = mean(inhSus.fire.z.ms250.interval(1:6,:,ii));
    inhSus.fire.z.ms250.cueSPR(ii,:) = mean(inhSus.fire.z.ms250.interval(7:12,:,ii));
    inhSus.fire.z.ms250.cueNsPR(ii,:) = mean(inhSus.fire.z.ms250.interval(13:22,:,ii));
    inhSus.fire.z.ms250.cuePR(ii,:) = mean(inhSus.fire.z.ms250.interval(7:22,:,ii));
    inhSus.fire.z.ms250.cue0(ii,:) = mean(inhSus.fire.z.ms250.interval(23:32,:,ii));
    
    inhSus.fire.z.ms250.firstFive.cue100 = mean(inhSus.fire.z.ms250.cue100(:,81:100),2); %ROW MEANS firstFive
    inhSus.fire.z.ms250.firstFive.cueSPR = mean(inhSus.fire.z.ms250.cueSPR(:,81:100),2); %ROW MEANS firstFive
    inhSus.fire.z.ms250.firstFive.cueNsPR = mean(inhSus.fire.z.ms250.cueNsPR(:,81:100),2); %ROW MEANS firstFive
    inhSus.fire.z.ms250.firstFive.cuePR = mean(inhSus.fire.z.ms250.cuePR(:,81:100),2); %ROW MEANS firstFive
    inhSus.fire.z.ms250.firstFive.cue0 = mean(inhSus.fire.z.ms250.cue0(:,81:100),2); %ROW MEANS firstFive

    inhSus.fire.z.ms250.firstFive.cue100mean = mean(inhSus.fire.z.ms250.firstFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.firstFive.cueSPRmean = mean(inhSus.fire.z.ms250.firstFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.firstFive.cueNsPRmean = mean(inhSus.fire.z.ms250.firstFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.firstFive.cuePRmean = mean(inhSus.fire.z.ms250.firstFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.firstFive.cue0mean = mean(inhSus.fire.z.ms250.firstFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms250.firstFive.cue100SEM = std(inhSus.fire.z.ms250.firstFive.cue100)/sqrt((length(inhSus.fire.z.ms250.firstFive.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.firstFive.cueSPRSEM = std(inhSus.fire.z.ms250.firstFive.cueSPR)/sqrt((length(inhSus.fire.z.ms250.firstFive.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.firstFive.cueNsPRSEM = std(inhSus.fire.z.ms250.firstFive.cueNsPR)/sqrt((length(inhSus.fire.z.ms250.firstFive.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.firstFive.cuePRSEM = std(inhSus.fire.z.ms250.firstFive.cuePR)/sqrt((length(inhSus.fire.z.ms250.firstFive.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.firstFive.cue0SEM = std(inhSus.fire.z.ms250.firstFive.cue0)/sqrt((length(inhSus.fire.z.ms250.firstFive.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms250.lastFive.cue100 = mean(inhSus.fire.z.ms250.cue100(:,101:120),2); %ROW MEANS lastFive
    inhSus.fire.z.ms250.lastFive.cueSPR = mean(inhSus.fire.z.ms250.cueSPR(:,101:120),2); %ROW MEANS lastFive
    inhSus.fire.z.ms250.lastFive.cueNsPR = mean(inhSus.fire.z.ms250.cueNsPR(:,101:120),2); %ROW MEANS lastFive
    inhSus.fire.z.ms250.lastFive.cuePR = mean(inhSus.fire.z.ms250.cuePR(:,101:120),2); %ROW MEANS lastFive
    inhSus.fire.z.ms250.lastFive.cue0 = mean(inhSus.fire.z.ms250.cue0(:,101:120),2); %ROW MEANS lastFive
    
    inhSus.fire.z.ms250.lastFive.cue100mean = mean(inhSus.fire.z.ms250.lastFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.lastFive.cueSPRmean = mean(inhSus.fire.z.ms250.lastFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.lastFive.cueNsPRmean = mean(inhSus.fire.z.ms250.lastFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.lastFive.cuePRmean = mean(inhSus.fire.z.ms250.lastFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.lastFive.cue0mean = mean(inhSus.fire.z.ms250.lastFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms250.lastFive.cue100SEM = std(inhSus.fire.z.ms250.lastFive.cue100)/sqrt((length(inhSus.fire.z.ms250.lastFive.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.lastFive.cueSPRSEM = std(inhSus.fire.z.ms250.lastFive.cueSPR)/sqrt((length(inhSus.fire.z.ms250.lastFive.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.lastFive.cueNsPRSEM = std(inhSus.fire.z.ms250.lastFive.cueNsPR)/sqrt((length(inhSus.fire.z.ms250.lastFive.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.lastFive.cuePRSEM = std(inhSus.fire.z.ms250.lastFive.cuePR)/sqrt((length(inhSus.fire.z.ms250.lastFive.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.lastFive.cue0SEM = std(inhSus.fire.z.ms250.lastFive.cue0)/sqrt((length(inhSus.fire.z.ms250.lastFive.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms250.cueEntire.cue100 = mean(inhSus.fire.z.ms250.cue100(:,81:120),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms250.cueEntire.cueSPR = mean(inhSus.fire.z.ms250.cueSPR(:,81:120),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms250.cueEntire.cueNsPR = mean(inhSus.fire.z.ms250.cueNsPR(:,81:120),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms250.cueEntire.cuePR = mean(inhSus.fire.z.ms250.cuePR(:,81:120),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms250.cueEntire.cue0 = mean(inhSus.fire.z.ms250.cue0(:,81:120),2); %ROW MEANS cueEntire

    inhSus.fire.z.ms250.cueEntire.cue100mean = mean(inhSus.fire.z.ms250.cueEntire.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.cueEntire.cueSPRmean = mean(inhSus.fire.z.ms250.cueEntire.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.cueEntire.cueNsPRmean = mean(inhSus.fire.z.ms250.cueEntire.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.cueEntire.cuePRmean = mean(inhSus.fire.z.ms250.cueEntire.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms250.cueEntire.cue0mean = mean(inhSus.fire.z.ms250.cueEntire.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms250.cueEntire.cue100SEM = std(inhSus.fire.z.ms250.cueEntire.cue100)/sqrt((length(inhSus.fire.z.ms250.cueEntire.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.cueEntire.cueSPRSEM = std(inhSus.fire.z.ms250.cueEntire.cueSPR)/sqrt((length(inhSus.fire.z.ms250.cueEntire.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.cueEntire.cueNsPRSEM = std(inhSus.fire.z.ms250.cueEntire.cueNsPR)/sqrt((length(inhSus.fire.z.ms250.cueEntire.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.cueEntire.cuePRSEM = std(inhSus.fire.z.ms250.cueEntire.cuePR)/sqrt((length(inhSus.fire.z.ms250.cueEntire.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms250.cueEntire.cue0SEM = std(inhSus.fire.z.ms250.cueEntire.cue0)/sqrt((length(inhSus.fire.z.ms250.cueEntire.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms100.cue100(ii,:) = mean(inhSus.fire.z.ms100.interval(1:6,:,ii));
    inhSus.fire.z.ms100.cueSPR(ii,:) = mean(inhSus.fire.z.ms100.interval(7:12,:,ii));
    inhSus.fire.z.ms100.cueNsPR(ii,:) = mean(inhSus.fire.z.ms100.interval(13:22,:,ii));
    inhSus.fire.z.ms100.cuePR(ii,:) = mean(inhSus.fire.z.ms100.interval(7:22,:,ii));
    inhSus.fire.z.ms100.cue0(ii,:) = mean(inhSus.fire.z.ms100.interval(23:32,:,ii));
    
    inhSus.fire.z.ms100.firstFive.cue100 = mean(inhSus.fire.z.ms100.cue100(:,201:250),2); %ROW MEANS firstFive
    inhSus.fire.z.ms100.firstFive.cueSPR = mean(inhSus.fire.z.ms100.cueSPR(:,201:250),2); %ROW MEANS firstFive
    inhSus.fire.z.ms100.firstFive.cueNsPR = mean(inhSus.fire.z.ms100.cueNsPR(:,201:250),2); %ROW MEANS firstFive
    inhSus.fire.z.ms100.firstFive.cuePR = mean(inhSus.fire.z.ms100.cuePR(:,201:250),2); %ROW MEANS firstFive
    inhSus.fire.z.ms100.firstFive.cue0 = mean(inhSus.fire.z.ms100.cue0(:,201:250),2); %ROW MEANS firstFive

    inhSus.fire.z.ms100.firstFive.cue100mean = mean(inhSus.fire.z.ms100.firstFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.firstFive.cueSPRmean = mean(inhSus.fire.z.ms100.firstFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.firstFive.cueNsPRmean = mean(inhSus.fire.z.ms100.firstFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.firstFive.cuePRmean = mean(inhSus.fire.z.ms100.firstFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.firstFive.cue0mean = mean(inhSus.fire.z.ms100.firstFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms100.firstFive.cue100SEM = std(inhSus.fire.z.ms100.firstFive.cue100)/sqrt((length(inhSus.fire.z.ms100.firstFive.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.firstFive.cueSPRSEM = std(inhSus.fire.z.ms100.firstFive.cueSPR)/sqrt((length(inhSus.fire.z.ms100.firstFive.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.firstFive.cueNsPRSEM = std(inhSus.fire.z.ms100.firstFive.cueNsPR)/sqrt((length(inhSus.fire.z.ms100.firstFive.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.firstFive.cuePRSEM = std(inhSus.fire.z.ms100.firstFive.cuePR)/sqrt((length(inhSus.fire.z.ms100.firstFive.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.firstFive.cue0SEM = std(inhSus.fire.z.ms100.firstFive.cue0)/sqrt((length(inhSus.fire.z.ms100.firstFive.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms100.lastFive.cue100 = mean(inhSus.fire.z.ms100.cue100(:,251:300),2); %ROW MEANS lastFive
    inhSus.fire.z.ms100.lastFive.cueSPR = mean(inhSus.fire.z.ms100.cueSPR(:,251:300),2); %ROW MEANS lastFive
    inhSus.fire.z.ms100.lastFive.cueNsPR = mean(inhSus.fire.z.ms100.cueNsPR(:,251:300),2); %ROW MEANS lastFive
    inhSus.fire.z.ms100.lastFive.cuePR = mean(inhSus.fire.z.ms100.cuePR(:,251:300),2); %ROW MEANS lastFive
    inhSus.fire.z.ms100.lastFive.cue0 = mean(inhSus.fire.z.ms100.cue0(:,251:300),2); %ROW MEANS lastFive
    
    inhSus.fire.z.ms100.lastFive.cue100mean = mean(inhSus.fire.z.ms100.lastFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.lastFive.cueSPRmean = mean(inhSus.fire.z.ms100.lastFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.lastFive.cueNsPRmean = mean(inhSus.fire.z.ms100.lastFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.lastFive.cuePRmean = mean(inhSus.fire.z.ms100.lastFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.lastFive.cue0mean = mean(inhSus.fire.z.ms100.lastFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms100.lastFive.cue100SEM = std(inhSus.fire.z.ms100.lastFive.cue100)/sqrt((length(inhSus.fire.z.ms100.lastFive.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.lastFive.cueSPRSEM = std(inhSus.fire.z.ms100.lastFive.cueSPR)/sqrt((length(inhSus.fire.z.ms100.lastFive.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.lastFive.cueNsPRSEM = std(inhSus.fire.z.ms100.lastFive.cueNsPR)/sqrt((length(inhSus.fire.z.ms100.lastFive.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.lastFive.cuePRSEM = std(inhSus.fire.z.ms100.lastFive.cuePR)/sqrt((length(inhSus.fire.z.ms100.lastFive.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.lastFive.cue0SEM = std(inhSus.fire.z.ms100.lastFive.cue0)/sqrt((length(inhSus.fire.z.ms100.lastFive.cue0)-1)); %SEM FOR BAR
    
    inhSus.fire.z.ms100.cueEntire.cue100 = mean(inhSus.fire.z.ms100.cue100(:,201:300),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms100.cueEntire.cueSPR = mean(inhSus.fire.z.ms100.cueSPR(:,201:300),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms100.cueEntire.cueNsPR = mean(inhSus.fire.z.ms100.cueNsPR(:,201:300),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms100.cueEntire.cuePR = mean(inhSus.fire.z.ms100.cuePR(:,201:300),2); %ROW MEANS cueEntire
    inhSus.fire.z.ms100.cueEntire.cue0 = mean(inhSus.fire.z.ms100.cue0(:,201:300),2); %ROW MEANS cueEntire

    inhSus.fire.z.ms100.cueEntire.cue100mean = mean(inhSus.fire.z.ms100.cueEntire.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.cueEntire.cueSPRmean = mean(inhSus.fire.z.ms100.cueEntire.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.cueEntire.cueNsPRmean = mean(inhSus.fire.z.ms100.cueEntire.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.cueEntire.cuePRmean = mean(inhSus.fire.z.ms100.cueEntire.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhSus.fire.z.ms100.cueEntire.cue0mean = mean(inhSus.fire.z.ms100.cueEntire.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhSus.fire.z.ms100.cueEntire.cue100SEM = std(inhSus.fire.z.ms100.cueEntire.cue100)/sqrt((length(inhSus.fire.z.ms100.cueEntire.cue100)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.cueEntire.cueSPRSEM = std(inhSus.fire.z.ms100.cueEntire.cueSPR)/sqrt((length(inhSus.fire.z.ms100.cueEntire.cueSPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.cueEntire.cueNsPRSEM = std(inhSus.fire.z.ms100.cueEntire.cueNsPR)/sqrt((length(inhSus.fire.z.ms100.cueEntire.cueNsPR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.cueEntire.cuePRSEM = std(inhSus.fire.z.ms100.cueEntire.cuePR)/sqrt((length(inhSus.fire.z.ms100.cueEntire.cuePR)-1)); %SEM FOR BAR
    inhSus.fire.z.ms100.cueEntire.cue0SEM = std(inhSus.fire.z.ms100.cueEntire.cue0)/sqrt((length(inhSus.fire.z.ms100.cueEntire.cue0)-1)); %SEM FOR BAR
  
end

clear ii;

inhSus.cer.cue100mean = mean(inhSus.cer.cue100);
inhSus.cer.cueSPRmean = mean(inhSus.cer.cueSPR);
inhSus.cer.cueNsPRmean = mean(inhSus.cer.cueNsPR);
inhSus.cer.cuePRmean = mean(inhSus.cer.cuePR);
inhSus.cer.cue0mean = mean(inhSus.cer.cue0);

inhSus.cer.cue100SEM = (std(inhSus.cer.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.cer.cueSPRSEM = (std(inhSus.cer.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.cer.cueNsPRSEM = (std(inhSus.cer.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.cer.cuePRSEM = (std(inhSus.cer.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.cer.cue0SEM = (std(inhSus.cer.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.cer.s1.cue100mean = mean(inhSus.cer.s1.cue100);
inhSus.cer.s1.cueSPRmean = mean(inhSus.cer.s1.cueSPR);
inhSus.cer.s1.cueNsPRmean = mean(inhSus.cer.s1.cueNsPR);
inhSus.cer.s1.cuePRmean = mean(inhSus.cer.s1.cuePR);
inhSus.cer.s1.cue0mean = mean(inhSus.cer.s1.cue0);

inhSus.cer.ms500.cue100mean = mean(inhSus.cer.ms500.cue100);
inhSus.cer.ms500.cueSPRmean = mean(inhSus.cer.ms500.cueSPR);
inhSus.cer.ms500.cueNsPRmean = mean(inhSus.cer.ms500.cueNsPR);
inhSus.cer.ms500.cuePRmean = mean(inhSus.cer.ms500.cuePR);
inhSus.cer.ms500.cue0mean = mean(inhSus.cer.ms500.cue0);

inhSus.cer.ms250.cue100mean = mean(inhSus.cer.ms250.cue100);
inhSus.cer.ms250.cueSPRmean = mean(inhSus.cer.ms250.cueSPR);
inhSus.cer.ms250.cueNsPRmean = mean(inhSus.cer.ms250.cueNsPR);
inhSus.cer.ms250.cuePRmean = mean(inhSus.cer.ms250.cuePR);
inhSus.cer.ms250.cue0mean = mean(inhSus.cer.ms250.cue0);

inhSus.cer.ms100.cue100mean = mean(inhSus.cer.ms100.cue100);
inhSus.cer.ms100.cueSPRmean = mean(inhSus.cer.ms100.cueSPR);
inhSus.cer.ms100.cueNsPRmean = mean(inhSus.cer.ms100.cueNsPR);
inhSus.cer.ms100.cuePRmean = mean(inhSus.cer.ms100.cuePR);
inhSus.cer.ms100.cue0mean = mean(inhSus.cer.ms100.cue0);

% Find Find single unit mean firing for each trial type -- inhFlp pop.

for ii = 1:size(inhFlp.tag,3)
    
    inhFlp.cer.cue100(ii,:) = mean(inhFlp.cer.cue(1:6,:,ii));
    inhFlp.cer.cueSPR(ii,:) = mean(inhFlp.cer.cue(7:12,:,ii));
    inhFlp.cer.cueNsPR(ii,:) = mean(inhFlp.cer.cue(13:22,:,ii));
    inhFlp.cer.cuePR(ii,:) = mean(inhFlp.cer.cue(7:22,:,ii));
    inhFlp.cer.cue0(ii,:) = mean(inhFlp.cer.cue(23:32,:,ii));
    
    inhFlp.cer.s1.cue100(ii,:) = mean(inhFlp.cer.s1.interval(1:6,:,ii));
    inhFlp.cer.s1.cueSPR(ii,:) = mean(inhFlp.cer.s1.interval(7:12,:,ii));
    inhFlp.cer.s1.cueNsPR(ii,:) = mean(inhFlp.cer.s1.interval(13:22,:,ii));
    inhFlp.cer.s1.cuePR(ii,:) = mean(inhFlp.cer.s1.interval(7:22,:,ii));
    inhFlp.cer.s1.cue0(ii,:) = mean(inhFlp.cer.s1.interval(23:32,:,ii));
    
    inhFlp.cer.ms500.cue100(ii,:) = mean(inhFlp.cer.ms500.interval(1:6,:,ii));
    inhFlp.cer.ms500.cueSPR(ii,:) = mean(inhFlp.cer.ms500.interval(7:12,:,ii));
    inhFlp.cer.ms500.cueNsPR(ii,:) = mean(inhFlp.cer.ms500.interval(13:22,:,ii));
    inhFlp.cer.ms500.cuePR(ii,:) = mean(inhFlp.cer.ms500.interval(7:22,:,ii));
    inhFlp.cer.ms500.cue0(ii,:) = mean(inhFlp.cer.ms500.interval(23:32,:,ii));
    
    inhFlp.cer.ms250.cue100(ii,:) = mean(inhFlp.cer.ms250.interval(1:6,:,ii));
    inhFlp.cer.ms250.cueSPR(ii,:) = mean(inhFlp.cer.ms250.interval(7:12,:,ii));
    inhFlp.cer.ms250.cueNsPR(ii,:) = mean(inhFlp.cer.ms250.interval(13:22,:,ii));
    inhFlp.cer.ms250.cuePR(ii,:) = mean(inhFlp.cer.ms250.interval(7:22,:,ii));
    inhFlp.cer.ms250.cue0(ii,:) = mean(inhFlp.cer.ms250.interval(23:32,:,ii));
    
    inhFlp.cer.ms100.cue100(ii,:) = mean(inhFlp.cer.ms100.interval(1:6,:,ii));
    inhFlp.cer.ms100.cueSPR(ii,:) = mean(inhFlp.cer.ms100.interval(7:12,:,ii));
    inhFlp.cer.ms100.cueNsPR(ii,:) = mean(inhFlp.cer.ms100.interval(13:22,:,ii));
    inhFlp.cer.ms100.cuePR(ii,:) = mean(inhFlp.cer.ms100.interval(7:22,:,ii));
    inhFlp.cer.ms100.cue0(ii,:) = mean(inhFlp.cer.ms100.interval(23:32,:,ii));
    
    inhFlp.fire.raw.s1.cue100(ii,:) = mean(inhFlp.fire.raw.s1.interval(1:6,:,ii));
    inhFlp.fire.raw.s1.cueSPR(ii,:) = mean(inhFlp.fire.raw.s1.interval(7:12,:,ii));
    inhFlp.fire.raw.s1.cueNsPR(ii,:) = mean(inhFlp.fire.raw.s1.interval(13:22,:,ii));
    inhFlp.fire.raw.s1.cuePR(ii,:) = mean(inhFlp.fire.raw.s1.interval(7:22,:,ii));
    inhFlp.fire.raw.s1.cue0(ii,:) = mean(inhFlp.fire.raw.s1.interval(23:32,:,ii));
    
    inhFlp.fire.raw.ms500.cue100(ii,:) = mean(inhFlp.fire.raw.ms500.interval(1:6,:,ii));
    inhFlp.fire.raw.ms500.cueSPR(ii,:) = mean(inhFlp.fire.raw.ms500.interval(7:12,:,ii));
    inhFlp.fire.raw.ms500.cueNsPR(ii,:) = mean(inhFlp.fire.raw.ms500.interval(13:22,:,ii));
    inhFlp.fire.raw.ms500.cuePR(ii,:) = mean(inhFlp.fire.raw.ms500.interval(7:22,:,ii));
    inhFlp.fire.raw.ms500.cue0(ii,:) = mean(inhFlp.fire.raw.ms500.interval(23:32,:,ii));
    
    inhFlp.fire.raw.ms250.cue100(ii,:) = mean(inhFlp.fire.raw.ms250.interval(1:6,:,ii));
    inhFlp.fire.raw.ms250.cueSPR(ii,:) = mean(inhFlp.fire.raw.ms250.interval(7:12,:,ii));
    inhFlp.fire.raw.ms250.cueNsPR(ii,:) = mean(inhFlp.fire.raw.ms250.interval(13:22,:,ii));
    inhFlp.fire.raw.ms250.cuePR(ii,:) = mean(inhFlp.fire.raw.ms250.interval(7:22,:,ii));
    inhFlp.fire.raw.ms250.cue0(ii,:) = mean(inhFlp.fire.raw.ms250.interval(23:32,:,ii));
    
    inhFlp.fire.raw.ms100.cue100(ii,:) = mean(inhFlp.fire.raw.ms100.interval(1:6,:,ii));
    inhFlp.fire.raw.ms100.cueSPR(ii,:) = mean(inhFlp.fire.raw.ms100.interval(7:12,:,ii));
    inhFlp.fire.raw.ms100.cueNsPR(ii,:) = mean(inhFlp.fire.raw.ms100.interval(13:22,:,ii));
    inhFlp.fire.raw.ms100.cuePR(ii,:) = mean(inhFlp.fire.raw.ms100.interval(7:22,:,ii));
    inhFlp.fire.raw.ms100.cue0(ii,:) = mean(inhFlp.fire.raw.ms100.interval(23:32,:,ii));
    
    inhFlp.fire.diff.s1.cue100(ii,:) = mean(inhFlp.fire.diff.s1.interval(1:6,:,ii));
    inhFlp.fire.diff.s1.cueSPR(ii,:) = mean(inhFlp.fire.diff.s1.interval(7:12,:,ii));
    inhFlp.fire.diff.s1.cueNsPR(ii,:) = mean(inhFlp.fire.diff.s1.interval(13:22,:,ii));
    inhFlp.fire.diff.s1.cuePR(ii,:) = mean(inhFlp.fire.diff.s1.interval(7:22,:,ii));
    inhFlp.fire.diff.s1.cue0(ii,:) = mean(inhFlp.fire.diff.s1.interval(23:32,:,ii));
    
    inhFlp.fire.diff.ms500.cue100(ii,:) = mean(inhFlp.fire.diff.ms500.interval(1:6,:,ii));
    inhFlp.fire.diff.ms500.cueSPR(ii,:) = mean(inhFlp.fire.diff.ms500.interval(7:12,:,ii));
    inhFlp.fire.diff.ms500.cueNsPR(ii,:) = mean(inhFlp.fire.diff.ms500.interval(13:22,:,ii));
    inhFlp.fire.diff.ms500.cuePR(ii,:) = mean(inhFlp.fire.diff.ms500.interval(7:22,:,ii));
    inhFlp.fire.diff.ms500.cue0(ii,:) = mean(inhFlp.fire.diff.ms500.interval(23:32,:,ii));
    
    inhFlp.fire.diff.ms250.cue100(ii,:) = mean(inhFlp.fire.diff.ms250.interval(1:6,:,ii));
    inhFlp.fire.diff.ms250.cueSPR(ii,:) = mean(inhFlp.fire.diff.ms250.interval(7:12,:,ii));
    inhFlp.fire.diff.ms250.cueNsPR(ii,:) = mean(inhFlp.fire.diff.ms250.interval(13:22,:,ii));
    inhFlp.fire.diff.ms250.cuePR(ii,:) = mean(inhFlp.fire.diff.ms250.interval(7:22,:,ii));
    inhFlp.fire.diff.ms250.cue0(ii,:) = mean(inhFlp.fire.diff.ms250.interval(23:32,:,ii));
    
    inhFlp.fire.diff.ms100.cue100(ii,:) = mean(inhFlp.fire.diff.ms100.interval(1:6,:,ii));
    inhFlp.fire.diff.ms100.cueSPR(ii,:) = mean(inhFlp.fire.diff.ms100.interval(7:12,:,ii));
    inhFlp.fire.diff.ms100.cueNsPR(ii,:) = mean(inhFlp.fire.diff.ms100.interval(13:22,:,ii));
    inhFlp.fire.diff.ms100.cuePR(ii,:) = mean(inhFlp.fire.diff.ms100.interval(7:22,:,ii));
    inhFlp.fire.diff.ms100.cue0(ii,:) = mean(inhFlp.fire.diff.ms100.interval(23:32,:,ii));
    
    inhFlp.fire.z.s1.cue100(ii,:) = mean(inhFlp.fire.z.s1.interval(1:6,:,ii));
    inhFlp.fire.z.s1.cueSPR(ii,:) = mean(inhFlp.fire.z.s1.interval(7:12,:,ii));
    inhFlp.fire.z.s1.cueNsPR(ii,:) = mean(inhFlp.fire.z.s1.interval(13:22,:,ii));
    inhFlp.fire.z.s1.cuePR(ii,:) = mean(inhFlp.fire.z.s1.interval(7:22,:,ii));
    inhFlp.fire.z.s1.cue0(ii,:) = mean(inhFlp.fire.z.s1.interval(23:32,:,ii));
    
    inhFlp.fire.z.s1.firstFive.cue100 = mean(inhFlp.fire.z.s1.cue100(:,21:25),2); %NEW
    inhFlp.fire.z.s1.firstFive.cueSPR = mean(inhFlp.fire.z.s1.cueSPR(:,21:25),2); %NEW
    inhFlp.fire.z.s1.firstFive.cueNsPR = mean(inhFlp.fire.z.s1.cueNsPR(:,21:25),2); %NEW
    inhFlp.fire.z.s1.firstFive.cuePR = mean(inhFlp.fire.z.s1.cuePR(:,21:25),2); %NEW
    inhFlp.fire.z.s1.firstFive.cue0 = mean(inhFlp.fire.z.s1.cue0(:,21:25),2); %NEW

    inhFlp.fire.z.s1.firstFive.cue100mean = mean(inhFlp.fire.z.s1.firstFive.cue100); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.firstFive.cueSPRmean = mean(inhFlp.fire.z.s1.firstFive.cueSPR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.firstFive.cueNsPRmean = mean(inhFlp.fire.z.s1.firstFive.cueNsPR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.firstFive.cuePRmean = mean(inhFlp.fire.z.s1.firstFive.cuePR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.firstFive.cue0mean = mean(inhFlp.fire.z.s1.firstFive.cue0); %NEW MEAN FOR BAR
    
    inhFlp.fire.z.s1.firstFive.cue100SEM = std(inhFlp.fire.z.s1.firstFive.cue100)/sqrt((length(inhFlp.fire.z.s1.firstFive.cue100)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.firstFive.cueSPRSEM = std(inhFlp.fire.z.s1.firstFive.cueSPR)/sqrt((length(inhFlp.fire.z.s1.firstFive.cueSPR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.firstFive.cueNsPRSEM = std(inhFlp.fire.z.s1.firstFive.cueNsPR)/sqrt((length(inhFlp.fire.z.s1.firstFive.cueNsPR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.firstFive.cuePRSEM = std(inhFlp.fire.z.s1.firstFive.cuePR)/sqrt((length(inhFlp.fire.z.s1.firstFive.cuePR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.firstFive.cue0SEM = std(inhFlp.fire.z.s1.firstFive.cue0)/sqrt((length(inhFlp.fire.z.s1.firstFive.cue0)-1)); %NEW SEM FOR BAR
    
    inhFlp.fire.z.s1.lastFive.cue100 = mean(inhFlp.fire.z.s1.cue100(:,26:30),2); %NEW
    inhFlp.fire.z.s1.lastFive.cueSPR = mean(inhFlp.fire.z.s1.cueSPR(:,26:30),2); %NEW
    inhFlp.fire.z.s1.lastFive.cueNsPR = mean(inhFlp.fire.z.s1.cueNsPR(:,26:30),2); %NEW
    inhFlp.fire.z.s1.lastFive.cuePR = mean(inhFlp.fire.z.s1.cuePR(:,26:30),2); %NEW
    inhFlp.fire.z.s1.lastFive.cue0 = mean(inhFlp.fire.z.s1.cue0(:,26:30),2); %NEW
    
    inhFlp.fire.z.s1.lastFive.cue100mean = mean(inhFlp.fire.z.s1.lastFive.cue100); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.lastFive.cueSPRmean = mean(inhFlp.fire.z.s1.lastFive.cueSPR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.lastFive.cueNsPRmean = mean(inhFlp.fire.z.s1.lastFive.cueNsPR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.lastFive.cuePRmean = mean(inhFlp.fire.z.s1.lastFive.cuePR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.lastFive.cue0mean = mean(inhFlp.fire.z.s1.lastFive.cue0); %NEW MEAN FOR BAR
    
    inhFlp.fire.z.s1.lastFive.cue100SEM = std(inhFlp.fire.z.s1.lastFive.cue100)/sqrt((length(inhFlp.fire.z.s1.lastFive.cue100)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.lastFive.cueSPRSEM = std(inhFlp.fire.z.s1.lastFive.cueSPR)/sqrt((length(inhFlp.fire.z.s1.lastFive.cueSPR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.lastFive.cueNsPRSEM = std(inhFlp.fire.z.s1.lastFive.cueNsPR)/sqrt((length(inhFlp.fire.z.s1.lastFive.cueNsPR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.lastFive.cuePRSEM = std(inhFlp.fire.z.s1.lastFive.cuePR)/sqrt((length(inhFlp.fire.z.s1.lastFive.cuePR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.lastFive.cue0SEM = std(inhFlp.fire.z.s1.lastFive.cue0)/sqrt((length(inhFlp.fire.z.s1.lastFive.cue0)-1)); %NEW SEM FOR BAR
    
    inhFlp.fire.z.s1.cueEntire.cue100 = mean(inhFlp.fire.z.s1.cue100(:,21:30),2); %NEW
    inhFlp.fire.z.s1.cueEntire.cueSPR = mean(inhFlp.fire.z.s1.cueSPR(:,21:30),2); %NEW
    inhFlp.fire.z.s1.cueEntire.cueNsPR = mean(inhFlp.fire.z.s1.cueNsPR(:,21:30),2); %NEW
    inhFlp.fire.z.s1.cueEntire.cuePR = mean(inhFlp.fire.z.s1.cuePR(:,21:30),2); %NEW
    inhFlp.fire.z.s1.cueEntire.cue0 = mean(inhFlp.fire.z.s1.cue0(:,21:30),2); %NEW
    
    inhFlp.fire.z.s1.cueEntire.cue100mean = mean(inhFlp.fire.z.s1.cueEntire.cue100); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.cueEntire.cueSPRmean = mean(inhFlp.fire.z.s1.cueEntire.cueSPR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.cueEntire.cueNsPRmean = mean(inhFlp.fire.z.s1.cueEntire.cueNsPR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.cueEntire.cuePRmean = mean(inhFlp.fire.z.s1.cueEntire.cuePR); %NEW MEAN FOR BAR
    inhFlp.fire.z.s1.cueEntire.cue0mean = mean(inhFlp.fire.z.s1.cueEntire.cue0); %NEW MEAN FOR BAR
    
    inhFlp.fire.z.s1.cueEntire.cue100SEM = std(inhFlp.fire.z.s1.cueEntire.cue100)/sqrt((length(inhFlp.fire.z.s1.cueEntire.cue100)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.cueEntire.cueSPRSEM = std(inhFlp.fire.z.s1.cueEntire.cueSPR)/sqrt((length(inhFlp.fire.z.s1.cueEntire.cueSPR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.cueEntire.cueNsPRSEM = std(inhFlp.fire.z.s1.cueEntire.cueNsPR)/sqrt((length(inhFlp.fire.z.s1.cueEntire.cueNsPR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.cueEntire.cuePRSEM = std(inhFlp.fire.z.s1.cueEntire.cuePR)/sqrt((length(inhFlp.fire.z.s1.cueEntire.cuePR)-1)); %NEW SEM FOR BAR
    inhFlp.fire.z.s1.cueEntire.cue0SEM = std(inhFlp.fire.z.s1.cueEntire.cue0)/sqrt((length(inhFlp.fire.z.s1.cueEntire.cue0)-1)); %NEW SEM FOR BAR
      
    inhFlp.fire.z.ms500.cue100(ii,:) = mean(inhFlp.fire.z.ms500.interval(1:6,:,ii));
    inhFlp.fire.z.ms500.cueSPR(ii,:) = mean(inhFlp.fire.z.ms500.interval(7:12,:,ii));
    inhFlp.fire.z.ms500.cueNsPR(ii,:) = mean(inhFlp.fire.z.ms500.interval(13:22,:,ii));
    inhFlp.fire.z.ms500.cuePR(ii,:) = mean(inhFlp.fire.z.ms500.interval(7:22,:,ii));
    inhFlp.fire.z.ms500.cue0(ii,:) = mean(inhFlp.fire.z.ms500.interval(23:32,:,ii));
    
    inhFlp.fire.z.ms500.firstFive.cue100 = mean(inhFlp.fire.z.ms500.cue100(:,41:50),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms500.firstFive.cueSPR = mean(inhFlp.fire.z.ms500.cueSPR(:,41:50),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms500.firstFive.cueNsPR = mean(inhFlp.fire.z.ms500.cueNsPR(:,41:50),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms500.firstFive.cuePR = mean(inhFlp.fire.z.ms500.cuePR(:,41:50),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms500.firstFive.cue0 = mean(inhFlp.fire.z.ms500.cue0(:,41:50),2); %ROW MEANS firstFive

    inhFlp.fire.z.ms500.firstFive.cue100mean = mean(inhFlp.fire.z.ms500.firstFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.firstFive.cueSPRmean = mean(inhFlp.fire.z.ms500.firstFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.firstFive.cueNsPRmean = mean(inhFlp.fire.z.ms500.firstFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.firstFive.cuePRmean = mean(inhFlp.fire.z.ms500.firstFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.firstFive.cue0mean = mean(inhFlp.fire.z.ms500.firstFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms500.firstFive.cue100SEM = std(inhFlp.fire.z.ms500.firstFive.cue100)/sqrt((length(inhFlp.fire.z.ms500.firstFive.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.firstFive.cueSPRSEM = std(inhFlp.fire.z.ms500.firstFive.cueSPR)/sqrt((length(inhFlp.fire.z.ms500.firstFive.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.firstFive.cueNsPRSEM = std(inhFlp.fire.z.ms500.firstFive.cueNsPR)/sqrt((length(inhFlp.fire.z.ms500.firstFive.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.firstFive.cuePRSEM = std(inhFlp.fire.z.ms500.firstFive.cuePR)/sqrt((length(inhFlp.fire.z.ms500.firstFive.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.firstFive.cue0SEM = std(inhFlp.fire.z.ms500.firstFive.cue0)/sqrt((length(inhFlp.fire.z.ms500.firstFive.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms500.lastFive.cue100 = mean(inhFlp.fire.z.ms500.cue100(:,51:60),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms500.lastFive.cueSPR = mean(inhFlp.fire.z.ms500.cueSPR(:,51:60),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms500.lastFive.cueNsPR = mean(inhFlp.fire.z.ms500.cueNsPR(:,51:60),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms500.lastFive.cuePR = mean(inhFlp.fire.z.ms500.cuePR(:,51:60),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms500.lastFive.cue0 = mean(inhFlp.fire.z.ms500.cue0(:,51:60),2); %ROW MEANS lastFive
    
    inhFlp.fire.z.ms500.lastFive.cue100mean = mean(inhFlp.fire.z.ms500.lastFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.lastFive.cueSPRmean = mean(inhFlp.fire.z.ms500.lastFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.lastFive.cueNsPRmean = mean(inhFlp.fire.z.ms500.lastFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.lastFive.cuePRmean = mean(inhFlp.fire.z.ms500.lastFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.lastFive.cue0mean = mean(inhFlp.fire.z.ms500.lastFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms500.lastFive.cue100SEM = std(inhFlp.fire.z.ms500.lastFive.cue100)/sqrt((length(inhFlp.fire.z.ms500.lastFive.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.lastFive.cueSPRSEM = std(inhFlp.fire.z.ms500.lastFive.cueSPR)/sqrt((length(inhFlp.fire.z.ms500.lastFive.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.lastFive.cueNsPRSEM = std(inhFlp.fire.z.ms500.lastFive.cueNsPR)/sqrt((length(inhFlp.fire.z.ms500.lastFive.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.lastFive.cuePRSEM = std(inhFlp.fire.z.ms500.lastFive.cuePR)/sqrt((length(inhFlp.fire.z.ms500.lastFive.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.lastFive.cue0SEM = std(inhFlp.fire.z.ms500.lastFive.cue0)/sqrt((length(inhFlp.fire.z.ms500.lastFive.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms500.cueEntire.cue100 = mean(inhFlp.fire.z.ms500.cue100(:,41:60),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms500.cueEntire.cueSPR = mean(inhFlp.fire.z.ms500.cueSPR(:,41:60),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms500.cueEntire.cueNsPR = mean(inhFlp.fire.z.ms500.cueNsPR(:,41:60),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms500.cueEntire.cuePR = mean(inhFlp.fire.z.ms500.cuePR(:,41:60),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms500.cueEntire.cue0 = mean(inhFlp.fire.z.ms500.cue0(:,41:60),2); %ROW MEANS cueEntire

    inhFlp.fire.z.ms500.cueEntire.cue100mean = mean(inhFlp.fire.z.ms500.cueEntire.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cueSPRmean = mean(inhFlp.fire.z.ms500.cueEntire.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cueNsPRmean = mean(inhFlp.fire.z.ms500.cueEntire.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cuePRmean = mean(inhFlp.fire.z.ms500.cueEntire.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cue0mean = mean(inhFlp.fire.z.ms500.cueEntire.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms500.cueEntire.cue100SEM = std(inhFlp.fire.z.ms500.cueEntire.cue100)/sqrt((length(inhFlp.fire.z.ms500.cueEntire.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cueSPRSEM = std(inhFlp.fire.z.ms500.cueEntire.cueSPR)/sqrt((length(inhFlp.fire.z.ms500.cueEntire.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cueNsPRSEM = std(inhFlp.fire.z.ms500.cueEntire.cueNsPR)/sqrt((length(inhFlp.fire.z.ms500.cueEntire.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cuePRSEM = std(inhFlp.fire.z.ms500.cueEntire.cuePR)/sqrt((length(inhFlp.fire.z.ms500.cueEntire.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms500.cueEntire.cue0SEM = std(inhFlp.fire.z.ms500.cueEntire.cue0)/sqrt((length(inhFlp.fire.z.ms500.cueEntire.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms250.cue100(ii,:) = mean(inhFlp.fire.z.ms250.interval(1:6,:,ii));
    inhFlp.fire.z.ms250.cueSPR(ii,:) = mean(inhFlp.fire.z.ms250.interval(7:12,:,ii));
    inhFlp.fire.z.ms250.cueNsPR(ii,:) = mean(inhFlp.fire.z.ms250.interval(13:22,:,ii));
    inhFlp.fire.z.ms250.cuePR(ii,:) = mean(inhFlp.fire.z.ms250.interval(7:22,:,ii));
    inhFlp.fire.z.ms250.cue0(ii,:) = mean(inhFlp.fire.z.ms250.interval(23:32,:,ii));
    
    inhFlp.fire.z.ms250.firstFive.cue100 = mean(inhFlp.fire.z.ms250.cue100(:,81:100),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms250.firstFive.cueSPR = mean(inhFlp.fire.z.ms250.cueSPR(:,81:100),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms250.firstFive.cueNsPR = mean(inhFlp.fire.z.ms250.cueNsPR(:,81:100),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms250.firstFive.cuePR = mean(inhFlp.fire.z.ms250.cuePR(:,81:100),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms250.firstFive.cue0 = mean(inhFlp.fire.z.ms250.cue0(:,81:100),2); %ROW MEANS firstFive

    inhFlp.fire.z.ms250.firstFive.cue100mean = mean(inhFlp.fire.z.ms250.firstFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.firstFive.cueSPRmean = mean(inhFlp.fire.z.ms250.firstFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.firstFive.cueNsPRmean = mean(inhFlp.fire.z.ms250.firstFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.firstFive.cuePRmean = mean(inhFlp.fire.z.ms250.firstFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.firstFive.cue0mean = mean(inhFlp.fire.z.ms250.firstFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms250.firstFive.cue100SEM = std(inhFlp.fire.z.ms250.firstFive.cue100)/sqrt((length(inhFlp.fire.z.ms250.firstFive.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.firstFive.cueSPRSEM = std(inhFlp.fire.z.ms250.firstFive.cueSPR)/sqrt((length(inhFlp.fire.z.ms250.firstFive.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.firstFive.cueNsPRSEM = std(inhFlp.fire.z.ms250.firstFive.cueNsPR)/sqrt((length(inhFlp.fire.z.ms250.firstFive.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.firstFive.cuePRSEM = std(inhFlp.fire.z.ms250.firstFive.cuePR)/sqrt((length(inhFlp.fire.z.ms250.firstFive.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.firstFive.cue0SEM = std(inhFlp.fire.z.ms250.firstFive.cue0)/sqrt((length(inhFlp.fire.z.ms250.firstFive.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms250.lastFive.cue100 = mean(inhFlp.fire.z.ms250.cue100(:,101:120),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms250.lastFive.cueSPR = mean(inhFlp.fire.z.ms250.cueSPR(:,101:120),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms250.lastFive.cueNsPR = mean(inhFlp.fire.z.ms250.cueNsPR(:,101:120),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms250.lastFive.cuePR = mean(inhFlp.fire.z.ms250.cuePR(:,101:120),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms250.lastFive.cue0 = mean(inhFlp.fire.z.ms250.cue0(:,101:120),2); %ROW MEANS lastFive
    
    inhFlp.fire.z.ms250.lastFive.cue100mean = mean(inhFlp.fire.z.ms250.lastFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.lastFive.cueSPRmean = mean(inhFlp.fire.z.ms250.lastFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.lastFive.cueNsPRmean = mean(inhFlp.fire.z.ms250.lastFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.lastFive.cuePRmean = mean(inhFlp.fire.z.ms250.lastFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.lastFive.cue0mean = mean(inhFlp.fire.z.ms250.lastFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms250.lastFive.cue100SEM = std(inhFlp.fire.z.ms250.lastFive.cue100)/sqrt((length(inhFlp.fire.z.ms250.lastFive.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.lastFive.cueSPRSEM = std(inhFlp.fire.z.ms250.lastFive.cueSPR)/sqrt((length(inhFlp.fire.z.ms250.lastFive.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.lastFive.cueNsPRSEM = std(inhFlp.fire.z.ms250.lastFive.cueNsPR)/sqrt((length(inhFlp.fire.z.ms250.lastFive.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.lastFive.cuePRSEM = std(inhFlp.fire.z.ms250.lastFive.cuePR)/sqrt((length(inhFlp.fire.z.ms250.lastFive.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.lastFive.cue0SEM = std(inhFlp.fire.z.ms250.lastFive.cue0)/sqrt((length(inhFlp.fire.z.ms250.lastFive.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms250.cueEntire.cue100 = mean(inhFlp.fire.z.ms250.cue100(:,81:120),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms250.cueEntire.cueSPR = mean(inhFlp.fire.z.ms250.cueSPR(:,81:120),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms250.cueEntire.cueNsPR = mean(inhFlp.fire.z.ms250.cueNsPR(:,81:120),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms250.cueEntire.cuePR = mean(inhFlp.fire.z.ms250.cuePR(:,81:120),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms250.cueEntire.cue0 = mean(inhFlp.fire.z.ms250.cue0(:,81:120),2); %ROW MEANS cueEntire

    inhFlp.fire.z.ms250.cueEntire.cue100mean = mean(inhFlp.fire.z.ms250.cueEntire.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cueSPRmean = mean(inhFlp.fire.z.ms250.cueEntire.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cueNsPRmean = mean(inhFlp.fire.z.ms250.cueEntire.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cuePRmean = mean(inhFlp.fire.z.ms250.cueEntire.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cue0mean = mean(inhFlp.fire.z.ms250.cueEntire.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms250.cueEntire.cue100SEM = std(inhFlp.fire.z.ms250.cueEntire.cue100)/sqrt((length(inhFlp.fire.z.ms250.cueEntire.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cueSPRSEM = std(inhFlp.fire.z.ms250.cueEntire.cueSPR)/sqrt((length(inhFlp.fire.z.ms250.cueEntire.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cueNsPRSEM = std(inhFlp.fire.z.ms250.cueEntire.cueNsPR)/sqrt((length(inhFlp.fire.z.ms250.cueEntire.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cuePRSEM = std(inhFlp.fire.z.ms250.cueEntire.cuePR)/sqrt((length(inhFlp.fire.z.ms250.cueEntire.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms250.cueEntire.cue0SEM = std(inhFlp.fire.z.ms250.cueEntire.cue0)/sqrt((length(inhFlp.fire.z.ms250.cueEntire.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms100.cue100(ii,:) = mean(inhFlp.fire.z.ms100.interval(1:6,:,ii));
    inhFlp.fire.z.ms100.cueSPR(ii,:) = mean(inhFlp.fire.z.ms100.interval(7:12,:,ii));
    inhFlp.fire.z.ms100.cueNsPR(ii,:) = mean(inhFlp.fire.z.ms100.interval(13:22,:,ii));
    inhFlp.fire.z.ms100.cuePR(ii,:) = mean(inhFlp.fire.z.ms100.interval(7:22,:,ii));
    inhFlp.fire.z.ms100.cue0(ii,:) = mean(inhFlp.fire.z.ms100.interval(23:32,:,ii));
    
    inhFlp.fire.z.ms100.firstFive.cue100 = mean(inhFlp.fire.z.ms100.cue100(:,201:250),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms100.firstFive.cueSPR = mean(inhFlp.fire.z.ms100.cueSPR(:,201:250),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms100.firstFive.cueNsPR = mean(inhFlp.fire.z.ms100.cueNsPR(:,201:250),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms100.firstFive.cuePR = mean(inhFlp.fire.z.ms100.cuePR(:,201:250),2); %ROW MEANS firstFive
    inhFlp.fire.z.ms100.firstFive.cue0 = mean(inhFlp.fire.z.ms100.cue0(:,201:250),2); %ROW MEANS firstFive

    inhFlp.fire.z.ms100.firstFive.cue100mean = mean(inhFlp.fire.z.ms100.firstFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.firstFive.cueSPRmean = mean(inhFlp.fire.z.ms100.firstFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.firstFive.cueNsPRmean = mean(inhFlp.fire.z.ms100.firstFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.firstFive.cuePRmean = mean(inhFlp.fire.z.ms100.firstFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.firstFive.cue0mean = mean(inhFlp.fire.z.ms100.firstFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms100.firstFive.cue100SEM = std(inhFlp.fire.z.ms100.firstFive.cue100)/sqrt((length(inhFlp.fire.z.ms100.firstFive.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.firstFive.cueSPRSEM = std(inhFlp.fire.z.ms100.firstFive.cueSPR)/sqrt((length(inhFlp.fire.z.ms100.firstFive.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.firstFive.cueNsPRSEM = std(inhFlp.fire.z.ms100.firstFive.cueNsPR)/sqrt((length(inhFlp.fire.z.ms100.firstFive.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.firstFive.cuePRSEM = std(inhFlp.fire.z.ms100.firstFive.cuePR)/sqrt((length(inhFlp.fire.z.ms100.firstFive.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.firstFive.cue0SEM = std(inhFlp.fire.z.ms100.firstFive.cue0)/sqrt((length(inhFlp.fire.z.ms100.firstFive.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms100.lastFive.cue100 = mean(inhFlp.fire.z.ms100.cue100(:,251:300),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms100.lastFive.cueSPR = mean(inhFlp.fire.z.ms100.cueSPR(:,251:300),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms100.lastFive.cueNsPR = mean(inhFlp.fire.z.ms100.cueNsPR(:,251:300),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms100.lastFive.cuePR = mean(inhFlp.fire.z.ms100.cuePR(:,251:300),2); %ROW MEANS lastFive
    inhFlp.fire.z.ms100.lastFive.cue0 = mean(inhFlp.fire.z.ms100.cue0(:,251:300),2); %ROW MEANS lastFive
    
    inhFlp.fire.z.ms100.lastFive.cue100mean = mean(inhFlp.fire.z.ms100.lastFive.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.lastFive.cueSPRmean = mean(inhFlp.fire.z.ms100.lastFive.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.lastFive.cueNsPRmean = mean(inhFlp.fire.z.ms100.lastFive.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.lastFive.cuePRmean = mean(inhFlp.fire.z.ms100.lastFive.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.lastFive.cue0mean = mean(inhFlp.fire.z.ms100.lastFive.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms100.lastFive.cue100SEM = std(inhFlp.fire.z.ms100.lastFive.cue100)/sqrt((length(inhFlp.fire.z.ms100.lastFive.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.lastFive.cueSPRSEM = std(inhFlp.fire.z.ms100.lastFive.cueSPR)/sqrt((length(inhFlp.fire.z.ms100.lastFive.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.lastFive.cueNsPRSEM = std(inhFlp.fire.z.ms100.lastFive.cueNsPR)/sqrt((length(inhFlp.fire.z.ms100.lastFive.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.lastFive.cuePRSEM = std(inhFlp.fire.z.ms100.lastFive.cuePR)/sqrt((length(inhFlp.fire.z.ms100.lastFive.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.lastFive.cue0SEM = std(inhFlp.fire.z.ms100.lastFive.cue0)/sqrt((length(inhFlp.fire.z.ms100.lastFive.cue0)-1)); %SEM FOR BAR
    
    inhFlp.fire.z.ms100.cueEntire.cue100 = mean(inhFlp.fire.z.ms100.cue100(:,201:300),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms100.cueEntire.cueSPR = mean(inhFlp.fire.z.ms100.cueSPR(:,201:300),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms100.cueEntire.cueNsPR = mean(inhFlp.fire.z.ms100.cueNsPR(:,201:300),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms100.cueEntire.cuePR = mean(inhFlp.fire.z.ms100.cuePR(:,201:300),2); %ROW MEANS cueEntire
    inhFlp.fire.z.ms100.cueEntire.cue0 = mean(inhFlp.fire.z.ms100.cue0(:,201:300),2); %ROW MEANS cueEntire

    inhFlp.fire.z.ms100.cueEntire.cue100mean = mean(inhFlp.fire.z.ms100.cueEntire.cue100); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cueSPRmean = mean(inhFlp.fire.z.ms100.cueEntire.cueSPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cueNsPRmean = mean(inhFlp.fire.z.ms100.cueEntire.cueNsPR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cuePRmean = mean(inhFlp.fire.z.ms100.cueEntire.cuePR); %COLUMN - MEAN of MEANS FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cue0mean = mean(inhFlp.fire.z.ms100.cueEntire.cue0); %COLUMN - MEAN of MEANS FOR BAR
    
    inhFlp.fire.z.ms100.cueEntire.cue100SEM = std(inhFlp.fire.z.ms100.cueEntire.cue100)/sqrt((length(inhFlp.fire.z.ms100.cueEntire.cue100)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cueSPRSEM = std(inhFlp.fire.z.ms100.cueEntire.cueSPR)/sqrt((length(inhFlp.fire.z.ms100.cueEntire.cueSPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cueNsPRSEM = std(inhFlp.fire.z.ms100.cueEntire.cueNsPR)/sqrt((length(inhFlp.fire.z.ms100.cueEntire.cueNsPR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cuePRSEM = std(inhFlp.fire.z.ms100.cueEntire.cuePR)/sqrt((length(inhFlp.fire.z.ms100.cueEntire.cuePR)-1)); %SEM FOR BAR
    inhFlp.fire.z.ms100.cueEntire.cue0SEM = std(inhFlp.fire.z.ms100.cueEntire.cue0)/sqrt((length(inhFlp.fire.z.ms100.cueEntire.cue0)-1)); %SEM FOR BAR
  
end

clear ii;

inhFlp.cer.cue100mean = mean(inhFlp.cer.cue100);
inhFlp.cer.cueSPRmean = mean(inhFlp.cer.cueSPR);
inhFlp.cer.cueNsPRmean = mean(inhFlp.cer.cueNsPR);
inhFlp.cer.cuePRmean = mean(inhFlp.cer.cuePR);
inhFlp.cer.cue0mean = mean(inhFlp.cer.cue0);

inhFlp.cer.cue100SEM = (std(inhFlp.cer.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.cer.cueSPRSEM = (std(inhFlp.cer.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.cer.cueNsPRSEM = (std(inhFlp.cer.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.cer.cuePRSEM = (std(inhFlp.cer.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.cer.cue0SEM = (std(inhFlp.cer.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.cer.s1.cue100mean = mean(inhFlp.cer.s1.cue100);
inhFlp.cer.s1.cueSPRmean = mean(inhFlp.cer.s1.cueSPR);
inhFlp.cer.s1.cueNsPRmean = mean(inhFlp.cer.s1.cueNsPR);
inhFlp.cer.s1.cuePRmean = mean(inhFlp.cer.s1.cuePR);
inhFlp.cer.s1.cue0mean = mean(inhFlp.cer.s1.cue0);

inhFlp.cer.ms500.cue100mean = mean(inhFlp.cer.ms500.cue100);
inhFlp.cer.ms500.cueSPRmean = mean(inhFlp.cer.ms500.cueSPR);
inhFlp.cer.ms500.cueNsPRmean = mean(inhFlp.cer.ms500.cueNsPR);
inhFlp.cer.ms500.cuePRmean = mean(inhFlp.cer.ms500.cuePR);
inhFlp.cer.ms500.cue0mean = mean(inhFlp.cer.ms500.cue0);

inhFlp.cer.ms250.cue100mean = mean(inhFlp.cer.ms250.cue100);
inhFlp.cer.ms250.cueSPRmean = mean(inhFlp.cer.ms250.cueSPR);
inhFlp.cer.ms250.cueNsPRmean = mean(inhFlp.cer.ms250.cueNsPR);
inhFlp.cer.ms250.cuePRmean = mean(inhFlp.cer.ms250.cuePR);
inhFlp.cer.ms250.cue0mean = mean(inhFlp.cer.ms250.cue0);

inhFlp.cer.ms100.cue100mean = mean(inhFlp.cer.ms100.cue100);
inhFlp.cer.ms100.cueSPRmean = mean(inhFlp.cer.ms100.cueSPR);
inhFlp.cer.ms100.cueNsPRmean = mean(inhFlp.cer.ms100.cueNsPR);
inhFlp.cer.ms100.cuePRmean = mean(inhFlp.cer.ms100.cuePR);
inhFlp.cer.ms100.cue0mean = mean(inhFlp.cer.ms100.cue0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find population mean & SEM firing for each trial type %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inh.fire.raw.s1.cue100mean = mean(inh.fire.raw.s1.cue100);
inh.fire.raw.s1.cueSPRmean = mean(inh.fire.raw.s1.cueSPR);
inh.fire.raw.s1.cueNsPRmean = mean(inh.fire.raw.s1.cueNsPR);
inh.fire.raw.s1.cuePRmean = mean(inh.fire.raw.s1.cuePR);
inh.fire.raw.s1.cue0mean = mean(inh.fire.raw.s1.cue0);

inh.fire.raw.ms500.cue100mean = mean(inh.fire.raw.ms500.cue100);
inh.fire.raw.ms500.cueSPRmean = mean(inh.fire.raw.ms500.cueSPR);
inh.fire.raw.ms500.cueNsPRmean = mean(inh.fire.raw.ms500.cueNsPR);
inh.fire.raw.ms500.cuePRmean = mean(inh.fire.raw.ms500.cuePR);
inh.fire.raw.ms500.cue0mean = mean(inh.fire.raw.ms500.cue0);

inh.fire.raw.ms250.cue100mean = mean(inh.fire.raw.ms250.cue100);
inh.fire.raw.ms250.cueSPRmean = mean(inh.fire.raw.ms250.cueSPR);
inh.fire.raw.ms250.cueNsPRmean = mean(inh.fire.raw.ms250.cueNsPR);
inh.fire.raw.ms250.cuePRmean = mean(inh.fire.raw.ms250.cuePR);
inh.fire.raw.ms250.cue0mean = mean(inh.fire.raw.ms250.cue0);

inh.fire.raw.ms100.cue100mean = mean(inh.fire.raw.ms100.cue100);
inh.fire.raw.ms100.cueSPRmean = mean(inh.fire.raw.ms100.cueSPR);
inh.fire.raw.ms100.cueNsPRmean = mean(inh.fire.raw.ms100.cueNsPR);
inh.fire.raw.ms100.cuePRmean = mean(inh.fire.raw.ms100.cuePR);
inh.fire.raw.ms100.cue0mean = mean(inh.fire.raw.ms100.cue0);

inh.fire.raw.s1.cue100SEM = (std(inh.fire.raw.s1.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.s1.cueSPRSEM = (std(inh.fire.raw.s1.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.s1.cueNsPRSEM = (std(inh.fire.raw.s1.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.s1.cuePRSEM = (std(inh.fire.raw.s1.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.s1.cue0SEM = (std(inh.fire.raw.s1.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.raw.ms500.cue100SEM = (std(inh.fire.raw.ms500.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms500.cueSPRSEM = (std(inh.fire.raw.ms500.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms500.cueNsPRSEM = (std(inh.fire.raw.ms500.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms500.cuePRSEM = (std(inh.fire.raw.ms500.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms500.cue0SEM = (std(inh.fire.raw.ms500.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.raw.ms250.cue100SEM = (std(inh.fire.raw.ms250.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms250.cueSPRSEM = (std(inh.fire.raw.ms250.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms250.cueNsPRSEM = (std(inh.fire.raw.ms250.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms250.cuePRSEM = (std(inh.fire.raw.ms250.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms250.cue0SEM = (std(inh.fire.raw.ms250.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.raw.ms100.cue100SEM = (std(inh.fire.raw.ms100.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms100.cueSPRSEM = (std(inh.fire.raw.ms100.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms100.cueNsPRSEM = (std(inh.fire.raw.ms100.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms100.cuePRSEM = (std(inh.fire.raw.ms100.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.raw.ms100.cue0SEM = (std(inh.fire.raw.ms100.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.diff.s1.cue100mean = mean(inh.fire.diff.s1.cue100);
inh.fire.diff.s1.cueSPRmean = mean(inh.fire.diff.s1.cueSPR);
inh.fire.diff.s1.cueNsPRmean = mean(inh.fire.diff.s1.cueNsPR);
inh.fire.diff.s1.cuePRmean = mean(inh.fire.diff.s1.cuePR);
inh.fire.diff.s1.cue0mean = mean(inh.fire.diff.s1.cue0);

inh.fire.diff.ms500.cue100mean = mean(inh.fire.diff.ms500.cue100);
inh.fire.diff.ms500.cueSPRmean = mean(inh.fire.diff.ms500.cueSPR);
inh.fire.diff.ms500.cueNsPRmean = mean(inh.fire.diff.ms500.cueNsPR);
inh.fire.diff.ms500.cuePRmean = mean(inh.fire.diff.ms500.cuePR);
inh.fire.diff.ms500.cue0mean = mean(inh.fire.diff.ms500.cue0);

inh.fire.diff.ms250.cue100mean = mean(inh.fire.diff.ms250.cue100);
inh.fire.diff.ms250.cueSPRmean = mean(inh.fire.diff.ms250.cueSPR);
inh.fire.diff.ms250.cueNsPRmean = mean(inh.fire.diff.ms250.cueNsPR);
inh.fire.diff.ms250.cuePRmean = mean(inh.fire.diff.ms250.cuePR);
inh.fire.diff.ms250.cue0mean = mean(inh.fire.diff.ms250.cue0);

inh.fire.diff.ms100.cue100mean = mean(inh.fire.diff.ms100.cue100);
inh.fire.diff.ms100.cueSPRmean = mean(inh.fire.diff.ms100.cueSPR);
inh.fire.diff.ms100.cueNsPRmean = mean(inh.fire.diff.ms100.cueNsPR);
inh.fire.diff.ms100.cuePRmean = mean(inh.fire.diff.ms100.cuePR);
inh.fire.diff.ms100.cue0mean = mean(inh.fire.diff.ms100.cue0);

inh.fire.diff.s1.cue100SEM = (std(inh.fire.diff.s1.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.s1.cueSPRSEM = (std(inh.fire.diff.s1.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.s1.cueNsPRSEM = (std(inh.fire.diff.s1.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.s1.cuePRSEM = (std(inh.fire.diff.s1.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.s1.cue0SEM = (std(inh.fire.diff.s1.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.diff.ms500.cue100SEM = (std(inh.fire.diff.ms500.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms500.cueSPRSEM = (std(inh.fire.diff.ms500.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms500.cueNsPRSEM = (std(inh.fire.diff.ms500.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms500.cuePRSEM = (std(inh.fire.diff.ms500.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms500.cue0SEM = (std(inh.fire.diff.ms500.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.diff.ms250.cue100SEM = (std(inh.fire.diff.ms250.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms250.cueSPRSEM = (std(inh.fire.diff.ms250.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms250.cueNsPRSEM = (std(inh.fire.diff.ms250.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms250.cuePRSEM = (std(inh.fire.diff.ms250.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms250.cue0SEM = (std(inh.fire.diff.ms250.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.diff.ms100.cue100SEM = (std(inh.fire.diff.ms100.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms100.cueSPRSEM = (std(inh.fire.diff.ms100.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms100.cueNsPRSEM = (std(inh.fire.diff.ms100.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms100.cuePRSEM = (std(inh.fire.diff.ms100.cuePR))/(sqrt((size(inh.tag,3))-1));
inh.fire.diff.ms100.cue0SEM = (std(inh.fire.diff.ms100.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.z.s1.cue100mean = mean(inh.fire.z.s1.cue100);
inh.fire.z.s1.cueSPRmean = mean(inh.fire.z.s1.cueSPR);
inh.fire.z.s1.cueNsPRmean = mean(inh.fire.z.s1.cueNsPR);
inh.fire.z.s1.cuePRmean = mean(inh.fire.z.s1.cuePR);
inh.fire.z.s1.cue0mean = mean(inh.fire.z.s1.cue0);

inh.fire.z.ms500.cue100mean = mean(inh.fire.z.ms500.cue100);
inh.fire.z.ms500.cueSPRmean = mean(inh.fire.z.ms500.cueSPR);
inh.fire.z.ms500.cueNsPRmean = mean(inh.fire.z.ms500.cueNsPR);
inh.fire.z.ms500.cuePRmean = mean(inh.fire.z.ms500.cuePR);
inh.fire.z.ms500.cue0mean = mean(inh.fire.z.ms500.cue0);

inh.fire.z.ms250.cue100mean = mean(inh.fire.z.ms250.cue100);
inh.fire.z.ms250.cueSPRmean = mean(inh.fire.z.ms250.cueSPR);
inh.fire.z.ms250.cueNsPRmean = mean(inh.fire.z.ms250.cueNsPR);
inh.fire.z.ms250.cuePRmean = mean(inh.fire.z.ms250.cuePR);
inh.fire.z.ms250.cue0mean = mean(inh.fire.z.ms250.cue0);

inh.fire.z.ms100.cue100mean = mean(inh.fire.z.ms100.cue100);
inh.fire.z.ms100.cueSPRmean = mean(inh.fire.z.ms100.cueSPR);
inh.fire.z.ms100.cueNsPRmean = mean(inh.fire.z.ms100.cueNsPR);
inh.fire.z.ms100.cuePRmean = mean(inh.fire.z.ms100.cuePR);
inh.fire.z.ms100.cue0mean = mean(inh.fire.z.ms100.cue0);

inh.fire.z.s1.cue100SEM = (std(inh.fire.z.s1.cue100))/(sqrt(28));
inh.fire.z.s1.cueSPRSEM = (std(inh.fire.z.s1.cueSPR))/(sqrt(28));
inh.fire.z.s1.cueNsPRSEM = (std(inh.fire.z.s1.cueNsPR))/(sqrt(28));
inh.fire.z.s1.cuePRSEM = (std(inh.fire.z.s1.cuePR))/(sqrt(28));
inh.fire.z.s1.cue0SEM = (std(inh.fire.z.s1.cue0))/(sqrt(28));

inh.fire.z.ms500.cue100SEM = (std(inh.fire.z.ms500.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms500.cueSPRSEM = (std(inh.fire.z.ms500.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms500.cueNsPRSEM = (std(inh.fire.z.ms500.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms500.cue0SEM = (std(inh.fire.z.ms500.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.z.ms250.cue100SEM = (std(inh.fire.z.ms250.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms250.cueSPRSEM = (std(inh.fire.z.ms250.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms250.cueNsPRSEM = (std(inh.fire.z.ms250.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms250.cue0SEM = (std(inh.fire.z.ms250.cue0))/(sqrt((size(inh.tag,3))-1));

inh.fire.z.ms100.cue100SEM = (std(inh.fire.z.ms100.cue100))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms100.cueSPRSEM = (std(inh.fire.z.ms100.cueSPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms100.cueNsPRSEM = (std(inh.fire.z.ms100.cueNsPR))/(sqrt((size(inh.tag,3))-1));
inh.fire.z.ms100.cue0SEM = (std(inh.fire.z.ms100.cue0))/(sqrt((size(inh.tag,3))-1));

% Find population mean & SEM firing for each trial type -- inhSus

inhSus.fire.raw.s1.cue100mean = mean(inhSus.fire.raw.s1.cue100);
inhSus.fire.raw.s1.cueSPRmean = mean(inhSus.fire.raw.s1.cueSPR);
inhSus.fire.raw.s1.cueNsPRmean = mean(inhSus.fire.raw.s1.cueNsPR);
inhSus.fire.raw.s1.cuePRmean = mean(inhSus.fire.raw.s1.cuePR);
inhSus.fire.raw.s1.cue0mean = mean(inhSus.fire.raw.s1.cue0);

inhSus.fire.raw.ms500.cue100mean = mean(inhSus.fire.raw.ms500.cue100);
inhSus.fire.raw.ms500.cueSPRmean = mean(inhSus.fire.raw.ms500.cueSPR);
inhSus.fire.raw.ms500.cueNsPRmean = mean(inhSus.fire.raw.ms500.cueNsPR);
inhSus.fire.raw.ms500.cuePRmean = mean(inhSus.fire.raw.ms500.cuePR);
inhSus.fire.raw.ms500.cue0mean = mean(inhSus.fire.raw.ms500.cue0);

inhSus.fire.raw.ms250.cue100mean = mean(inhSus.fire.raw.ms250.cue100);
inhSus.fire.raw.ms250.cueSPRmean = mean(inhSus.fire.raw.ms250.cueSPR);
inhSus.fire.raw.ms250.cueNsPRmean = mean(inhSus.fire.raw.ms250.cueNsPR);
inhSus.fire.raw.ms250.cuePRmean = mean(inhSus.fire.raw.ms250.cuePR);
inhSus.fire.raw.ms250.cue0mean = mean(inhSus.fire.raw.ms250.cue0);

inhSus.fire.raw.ms100.cue100mean = mean(inhSus.fire.raw.ms100.cue100);
inhSus.fire.raw.ms100.cueSPRmean = mean(inhSus.fire.raw.ms100.cueSPR);
inhSus.fire.raw.ms100.cueNsPRmean = mean(inhSus.fire.raw.ms100.cueNsPR);
inhSus.fire.raw.ms100.cuePRmean = mean(inhSus.fire.raw.ms100.cuePR);
inhSus.fire.raw.ms100.cue0mean = mean(inhSus.fire.raw.ms100.cue0);

inhSus.fire.raw.s1.cue100SEM = (std(inhSus.fire.raw.s1.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.s1.cueSPRSEM = (std(inhSus.fire.raw.s1.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.s1.cueNsPRSEM = (std(inhSus.fire.raw.s1.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.s1.cuePRSEM = (std(inhSus.fire.raw.s1.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.s1.cue0SEM = (std(inhSus.fire.raw.s1.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.raw.ms500.cue100SEM = (std(inhSus.fire.raw.ms500.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms500.cueSPRSEM = (std(inhSus.fire.raw.ms500.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms500.cueNsPRSEM = (std(inhSus.fire.raw.ms500.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms500.cuePRSEM = (std(inhSus.fire.raw.ms500.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms500.cue0SEM = (std(inhSus.fire.raw.ms500.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.raw.ms250.cue100SEM = (std(inhSus.fire.raw.ms250.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms250.cueSPRSEM = (std(inhSus.fire.raw.ms250.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms250.cueNsPRSEM = (std(inhSus.fire.raw.ms250.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms250.cuePRSEM = (std(inhSus.fire.raw.ms250.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms250.cue0SEM = (std(inhSus.fire.raw.ms250.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.raw.ms100.cue100SEM = (std(inhSus.fire.raw.ms100.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms100.cueSPRSEM = (std(inhSus.fire.raw.ms100.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms100.cueNsPRSEM = (std(inhSus.fire.raw.ms100.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms100.cuePRSEM = (std(inhSus.fire.raw.ms100.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.raw.ms100.cue0SEM = (std(inhSus.fire.raw.ms100.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.diff.s1.cue100mean = mean(inhSus.fire.diff.s1.cue100);
inhSus.fire.diff.s1.cueSPRmean = mean(inhSus.fire.diff.s1.cueSPR);
inhSus.fire.diff.s1.cueNsPRmean = mean(inhSus.fire.diff.s1.cueNsPR);
inhSus.fire.diff.s1.cuePRmean = mean(inhSus.fire.diff.s1.cuePR);
inhSus.fire.diff.s1.cue0mean = mean(inhSus.fire.diff.s1.cue0);

inhSus.fire.diff.ms500.cue100mean = mean(inhSus.fire.diff.ms500.cue100);
inhSus.fire.diff.ms500.cueSPRmean = mean(inhSus.fire.diff.ms500.cueSPR);
inhSus.fire.diff.ms500.cueNsPRmean = mean(inhSus.fire.diff.ms500.cueNsPR);
inhSus.fire.diff.ms500.cuePRmean = mean(inhSus.fire.diff.ms500.cuePR);
inhSus.fire.diff.ms500.cue0mean = mean(inhSus.fire.diff.ms500.cue0);

inhSus.fire.diff.ms250.cue100mean = mean(inhSus.fire.diff.ms250.cue100);
inhSus.fire.diff.ms250.cueSPRmean = mean(inhSus.fire.diff.ms250.cueSPR);
inhSus.fire.diff.ms250.cueNsPRmean = mean(inhSus.fire.diff.ms250.cueNsPR);
inhSus.fire.diff.ms250.cuePRmean = mean(inhSus.fire.diff.ms250.cuePR);
inhSus.fire.diff.ms250.cue0mean = mean(inhSus.fire.diff.ms250.cue0);

inhSus.fire.diff.ms100.cue100mean = mean(inhSus.fire.diff.ms100.cue100);
inhSus.fire.diff.ms100.cueSPRmean = mean(inhSus.fire.diff.ms100.cueSPR);
inhSus.fire.diff.ms100.cueNsPRmean = mean(inhSus.fire.diff.ms100.cueNsPR);
inhSus.fire.diff.ms100.cuePRmean = mean(inhSus.fire.diff.ms100.cuePR);
inhSus.fire.diff.ms100.cue0mean = mean(inhSus.fire.diff.ms100.cue0);

inhSus.fire.diff.s1.cue100SEM = (std(inhSus.fire.diff.s1.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.s1.cueSPRSEM = (std(inhSus.fire.diff.s1.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.s1.cueNsPRSEM = (std(inhSus.fire.diff.s1.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.s1.cuePRSEM = (std(inhSus.fire.diff.s1.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.s1.cue0SEM = (std(inhSus.fire.diff.s1.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.diff.ms500.cue100SEM = (std(inhSus.fire.diff.ms500.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms500.cueSPRSEM = (std(inhSus.fire.diff.ms500.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms500.cueNsPRSEM = (std(inhSus.fire.diff.ms500.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms500.cuePRSEM = (std(inhSus.fire.diff.ms500.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms500.cue0SEM = (std(inhSus.fire.diff.ms500.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.diff.ms250.cue100SEM = (std(inhSus.fire.diff.ms250.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms250.cueSPRSEM = (std(inhSus.fire.diff.ms250.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms250.cueNsPRSEM = (std(inhSus.fire.diff.ms250.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms250.cuePRSEM = (std(inhSus.fire.diff.ms250.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms250.cue0SEM = (std(inhSus.fire.diff.ms250.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.diff.ms100.cue100SEM = (std(inhSus.fire.diff.ms100.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms100.cueSPRSEM = (std(inhSus.fire.diff.ms100.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms100.cueNsPRSEM = (std(inhSus.fire.diff.ms100.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms100.cuePRSEM = (std(inhSus.fire.diff.ms100.cuePR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.diff.ms100.cue0SEM = (std(inhSus.fire.diff.ms100.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.z.s1.cue100mean = mean(inhSus.fire.z.s1.cue100);
inhSus.fire.z.s1.cueSPRmean = mean(inhSus.fire.z.s1.cueSPR);
inhSus.fire.z.s1.cueNsPRmean = mean(inhSus.fire.z.s1.cueNsPR);
inhSus.fire.z.s1.cuePRmean = mean(inhSus.fire.z.s1.cuePR);
inhSus.fire.z.s1.cue0mean = mean(inhSus.fire.z.s1.cue0);

inhSus.fire.z.ms500.cue100mean = mean(inhSus.fire.z.ms500.cue100);
inhSus.fire.z.ms500.cueSPRmean = mean(inhSus.fire.z.ms500.cueSPR);
inhSus.fire.z.ms500.cueNsPRmean = mean(inhSus.fire.z.ms500.cueNsPR);
inhSus.fire.z.ms500.cuePRmean = mean(inhSus.fire.z.ms500.cuePR);
inhSus.fire.z.ms500.cue0mean = mean(inhSus.fire.z.ms500.cue0);

inhSus.fire.z.ms250.cue100mean = mean(inhSus.fire.z.ms250.cue100);
inhSus.fire.z.ms250.cueSPRmean = mean(inhSus.fire.z.ms250.cueSPR);
inhSus.fire.z.ms250.cueNsPRmean = mean(inhSus.fire.z.ms250.cueNsPR);
inhSus.fire.z.ms250.cuePRmean = mean(inhSus.fire.z.ms250.cuePR);
inhSus.fire.z.ms250.cue0mean = mean(inhSus.fire.z.ms250.cue0);

inhSus.fire.z.ms100.cue100mean = mean(inhSus.fire.z.ms100.cue100);
inhSus.fire.z.ms100.cueSPRmean = mean(inhSus.fire.z.ms100.cueSPR);
inhSus.fire.z.ms100.cueNsPRmean = mean(inhSus.fire.z.ms100.cueNsPR);
inhSus.fire.z.ms100.cuePRmean = mean(inhSus.fire.z.ms100.cuePR);
inhSus.fire.z.ms100.cue0mean = mean(inhSus.fire.z.ms100.cue0);

inhSus.fire.z.s1.cue100SEM = (std(inhSus.fire.z.s1.cue100))/(sqrt(28));
inhSus.fire.z.s1.cueSPRSEM = (std(inhSus.fire.z.s1.cueSPR))/(sqrt(28));
inhSus.fire.z.s1.cueNsPRSEM = (std(inhSus.fire.z.s1.cueNsPR))/(sqrt(28));
inhSus.fire.z.s1.cuePRSEM = (std(inhSus.fire.z.s1.cuePR))/(sqrt(28));
inhSus.fire.z.s1.cue0SEM = (std(inhSus.fire.z.s1.cue0))/(sqrt(28));

inhSus.fire.z.ms500.cue100SEM = (std(inhSus.fire.z.ms500.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms500.cueSPRSEM = (std(inhSus.fire.z.ms500.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms500.cueNsPRSEM = (std(inhSus.fire.z.ms500.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms500.cue0SEM = (std(inhSus.fire.z.ms500.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.z.ms250.cue100SEM = (std(inhSus.fire.z.ms250.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms250.cueSPRSEM = (std(inhSus.fire.z.ms250.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms250.cueNsPRSEM = (std(inhSus.fire.z.ms250.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms250.cue0SEM = (std(inhSus.fire.z.ms250.cue0))/(sqrt((size(inhSus.tag,3))-1));

inhSus.fire.z.ms100.cue100SEM = (std(inhSus.fire.z.ms100.cue100))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms100.cueSPRSEM = (std(inhSus.fire.z.ms100.cueSPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms100.cueNsPRSEM = (std(inhSus.fire.z.ms100.cueNsPR))/(sqrt((size(inhSus.tag,3))-1));
inhSus.fire.z.ms100.cue0SEM = (std(inhSus.fire.z.ms100.cue0))/(sqrt((size(inhSus.tag,3))-1));

% Find population mean & SEM firing for each trial type -- inhFlp

inhFlp.fire.raw.s1.cue100mean = mean(inhFlp.fire.raw.s1.cue100);
inhFlp.fire.raw.s1.cueSPRmean = mean(inhFlp.fire.raw.s1.cueSPR);
inhFlp.fire.raw.s1.cueNsPRmean = mean(inhFlp.fire.raw.s1.cueNsPR);
inhFlp.fire.raw.s1.cuePRmean = mean(inhFlp.fire.raw.s1.cuePR);
inhFlp.fire.raw.s1.cue0mean = mean(inhFlp.fire.raw.s1.cue0);

inhFlp.fire.raw.ms500.cue100mean = mean(inhFlp.fire.raw.ms500.cue100);
inhFlp.fire.raw.ms500.cueSPRmean = mean(inhFlp.fire.raw.ms500.cueSPR);
inhFlp.fire.raw.ms500.cueNsPRmean = mean(inhFlp.fire.raw.ms500.cueNsPR);
inhFlp.fire.raw.ms500.cuePRmean = mean(inhFlp.fire.raw.ms500.cuePR);
inhFlp.fire.raw.ms500.cue0mean = mean(inhFlp.fire.raw.ms500.cue0);

inhFlp.fire.raw.ms250.cue100mean = mean(inhFlp.fire.raw.ms250.cue100);
inhFlp.fire.raw.ms250.cueSPRmean = mean(inhFlp.fire.raw.ms250.cueSPR);
inhFlp.fire.raw.ms250.cueNsPRmean = mean(inhFlp.fire.raw.ms250.cueNsPR);
inhFlp.fire.raw.ms250.cuePRmean = mean(inhFlp.fire.raw.ms250.cuePR);
inhFlp.fire.raw.ms250.cue0mean = mean(inhFlp.fire.raw.ms250.cue0);

inhFlp.fire.raw.ms100.cue100mean = mean(inhFlp.fire.raw.ms100.cue100);
inhFlp.fire.raw.ms100.cueSPRmean = mean(inhFlp.fire.raw.ms100.cueSPR);
inhFlp.fire.raw.ms100.cueNsPRmean = mean(inhFlp.fire.raw.ms100.cueNsPR);
inhFlp.fire.raw.ms100.cuePRmean = mean(inhFlp.fire.raw.ms100.cuePR);
inhFlp.fire.raw.ms100.cue0mean = mean(inhFlp.fire.raw.ms100.cue0);

inhFlp.fire.raw.s1.cue100SEM = (std(inhFlp.fire.raw.s1.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.s1.cueSPRSEM = (std(inhFlp.fire.raw.s1.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.s1.cueNsPRSEM = (std(inhFlp.fire.raw.s1.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.s1.cuePRSEM = (std(inhFlp.fire.raw.s1.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.s1.cue0SEM = (std(inhFlp.fire.raw.s1.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.raw.ms500.cue100SEM = (std(inhFlp.fire.raw.ms500.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms500.cueSPRSEM = (std(inhFlp.fire.raw.ms500.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms500.cueNsPRSEM = (std(inhFlp.fire.raw.ms500.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms500.cuePRSEM = (std(inhFlp.fire.raw.ms500.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms500.cue0SEM = (std(inhFlp.fire.raw.ms500.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.raw.ms250.cue100SEM = (std(inhFlp.fire.raw.ms250.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms250.cueSPRSEM = (std(inhFlp.fire.raw.ms250.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms250.cueNsPRSEM = (std(inhFlp.fire.raw.ms250.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms250.cuePRSEM = (std(inhFlp.fire.raw.ms250.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms250.cue0SEM = (std(inhFlp.fire.raw.ms250.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.raw.ms100.cue100SEM = (std(inhFlp.fire.raw.ms100.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms100.cueSPRSEM = (std(inhFlp.fire.raw.ms100.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms100.cueNsPRSEM = (std(inhFlp.fire.raw.ms100.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms100.cuePRSEM = (std(inhFlp.fire.raw.ms100.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.raw.ms100.cue0SEM = (std(inhFlp.fire.raw.ms100.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.diff.s1.cue100mean = mean(inhFlp.fire.diff.s1.cue100);
inhFlp.fire.diff.s1.cueSPRmean = mean(inhFlp.fire.diff.s1.cueSPR);
inhFlp.fire.diff.s1.cueNsPRmean = mean(inhFlp.fire.diff.s1.cueNsPR);
inhFlp.fire.diff.s1.cuePRmean = mean(inhFlp.fire.diff.s1.cuePR);
inhFlp.fire.diff.s1.cue0mean = mean(inhFlp.fire.diff.s1.cue0);

inhFlp.fire.diff.ms500.cue100mean = mean(inhFlp.fire.diff.ms500.cue100);
inhFlp.fire.diff.ms500.cueSPRmean = mean(inhFlp.fire.diff.ms500.cueSPR);
inhFlp.fire.diff.ms500.cueNsPRmean = mean(inhFlp.fire.diff.ms500.cueNsPR);
inhFlp.fire.diff.ms500.cuePRmean = mean(inhFlp.fire.diff.ms500.cuePR);
inhFlp.fire.diff.ms500.cue0mean = mean(inhFlp.fire.diff.ms500.cue0);

inhFlp.fire.diff.ms250.cue100mean = mean(inhFlp.fire.diff.ms250.cue100);
inhFlp.fire.diff.ms250.cueSPRmean = mean(inhFlp.fire.diff.ms250.cueSPR);
inhFlp.fire.diff.ms250.cueNsPRmean = mean(inhFlp.fire.diff.ms250.cueNsPR);
inhFlp.fire.diff.ms250.cuePRmean = mean(inhFlp.fire.diff.ms250.cuePR);
inhFlp.fire.diff.ms250.cue0mean = mean(inhFlp.fire.diff.ms250.cue0);

inhFlp.fire.diff.ms100.cue100mean = mean(inhFlp.fire.diff.ms100.cue100);
inhFlp.fire.diff.ms100.cueSPRmean = mean(inhFlp.fire.diff.ms100.cueSPR);
inhFlp.fire.diff.ms100.cueNsPRmean = mean(inhFlp.fire.diff.ms100.cueNsPR);
inhFlp.fire.diff.ms100.cuePRmean = mean(inhFlp.fire.diff.ms100.cuePR);
inhFlp.fire.diff.ms100.cue0mean = mean(inhFlp.fire.diff.ms100.cue0);

inhFlp.fire.diff.s1.cue100SEM = (std(inhFlp.fire.diff.s1.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.s1.cueSPRSEM = (std(inhFlp.fire.diff.s1.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.s1.cueNsPRSEM = (std(inhFlp.fire.diff.s1.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.s1.cuePRSEM = (std(inhFlp.fire.diff.s1.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.s1.cue0SEM = (std(inhFlp.fire.diff.s1.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.diff.ms500.cue100SEM = (std(inhFlp.fire.diff.ms500.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms500.cueSPRSEM = (std(inhFlp.fire.diff.ms500.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms500.cueNsPRSEM = (std(inhFlp.fire.diff.ms500.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms500.cuePRSEM = (std(inhFlp.fire.diff.ms500.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms500.cue0SEM = (std(inhFlp.fire.diff.ms500.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.diff.ms250.cue100SEM = (std(inhFlp.fire.diff.ms250.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms250.cueSPRSEM = (std(inhFlp.fire.diff.ms250.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms250.cueNsPRSEM = (std(inhFlp.fire.diff.ms250.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms250.cuePRSEM = (std(inhFlp.fire.diff.ms250.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms250.cue0SEM = (std(inhFlp.fire.diff.ms250.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.diff.ms100.cue100SEM = (std(inhFlp.fire.diff.ms100.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms100.cueSPRSEM = (std(inhFlp.fire.diff.ms100.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms100.cueNsPRSEM = (std(inhFlp.fire.diff.ms100.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms100.cuePRSEM = (std(inhFlp.fire.diff.ms100.cuePR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.diff.ms100.cue0SEM = (std(inhFlp.fire.diff.ms100.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.z.s1.cue100mean = mean(inhFlp.fire.z.s1.cue100);
inhFlp.fire.z.s1.cueSPRmean = mean(inhFlp.fire.z.s1.cueSPR);
inhFlp.fire.z.s1.cueNsPRmean = mean(inhFlp.fire.z.s1.cueNsPR);
inhFlp.fire.z.s1.cuePRmean = mean(inhFlp.fire.z.s1.cuePR);
inhFlp.fire.z.s1.cue0mean = mean(inhFlp.fire.z.s1.cue0);

inhFlp.fire.z.ms500.cue100mean = mean(inhFlp.fire.z.ms500.cue100);
inhFlp.fire.z.ms500.cueSPRmean = mean(inhFlp.fire.z.ms500.cueSPR);
inhFlp.fire.z.ms500.cueNsPRmean = mean(inhFlp.fire.z.ms500.cueNsPR);
inhFlp.fire.z.ms500.cuePRmean = mean(inhFlp.fire.z.ms500.cuePR);
inhFlp.fire.z.ms500.cue0mean = mean(inhFlp.fire.z.ms500.cue0);

inhFlp.fire.z.ms250.cue100mean = mean(inhFlp.fire.z.ms250.cue100);
inhFlp.fire.z.ms250.cueSPRmean = mean(inhFlp.fire.z.ms250.cueSPR);
inhFlp.fire.z.ms250.cueNsPRmean = mean(inhFlp.fire.z.ms250.cueNsPR);
inhFlp.fire.z.ms250.cuePRmean = mean(inhFlp.fire.z.ms250.cuePR);
inhFlp.fire.z.ms250.cue0mean = mean(inhFlp.fire.z.ms250.cue0);

inhFlp.fire.z.ms100.cue100mean = mean(inhFlp.fire.z.ms100.cue100);
inhFlp.fire.z.ms100.cueSPRmean = mean(inhFlp.fire.z.ms100.cueSPR);
inhFlp.fire.z.ms100.cueNsPRmean = mean(inhFlp.fire.z.ms100.cueNsPR);
inhFlp.fire.z.ms100.cuePRmean = mean(inhFlp.fire.z.ms100.cuePR);
inhFlp.fire.z.ms100.cue0mean = mean(inhFlp.fire.z.ms100.cue0);

inhFlp.fire.z.s1.cue100SEM = (std(inhFlp.fire.z.s1.cue100))/(sqrt(28));
inhFlp.fire.z.s1.cueSPRSEM = (std(inhFlp.fire.z.s1.cueSPR))/(sqrt(28));
inhFlp.fire.z.s1.cueNsPRSEM = (std(inhFlp.fire.z.s1.cueNsPR))/(sqrt(28));
inhFlp.fire.z.s1.cuePRSEM = (std(inhFlp.fire.z.s1.cuePR))/(sqrt(28));
inhFlp.fire.z.s1.cue0SEM = (std(inhFlp.fire.z.s1.cue0))/(sqrt(28));

inhFlp.fire.z.ms500.cue100SEM = (std(inhFlp.fire.z.ms500.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms500.cueSPRSEM = (std(inhFlp.fire.z.ms500.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms500.cueNsPRSEM = (std(inhFlp.fire.z.ms500.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms500.cue0SEM = (std(inhFlp.fire.z.ms500.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.z.ms250.cue100SEM = (std(inhFlp.fire.z.ms250.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms250.cueSPRSEM = (std(inhFlp.fire.z.ms250.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms250.cueNsPRSEM = (std(inhFlp.fire.z.ms250.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms250.cue0SEM = (std(inhFlp.fire.z.ms250.cue0))/(sqrt((size(inhFlp.tag,3))-1));

inhFlp.fire.z.ms100.cue100SEM = (std(inhFlp.fire.z.ms100.cue100))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms100.cueSPRSEM = (std(inhFlp.fire.z.ms100.cueSPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms100.cueNsPRSEM = (std(inhFlp.fire.z.ms100.cueNsPR))/(sqrt((size(inhFlp.tag,3))-1));
inhFlp.fire.z.ms100.cue0SEM = (std(inhFlp.fire.z.ms100.cue0))/(sqrt((size(inhFlp.tag,3))-1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1C Behavior Data for Unique Sessions Only in Flp and Sus%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Find mean & SEM cer for all unique Flp and Sus 
SusCer = [inhSus.cer.cue100,inhSus.cer.cuePR,inhSus.cer.cue0];

FlpCer = [inhFlp.cer.cue100,inhFlp.cer.cuePR,inhFlp.cer.cue0];

SusFlpCer = vertcat(SusCer,FlpCer);
SusFlpCerUnique = unique(SusFlpCer,'rows');

SusFlpCerUniqueMEAN = mean(SusFlpCerUnique);

SusFlpCerUniqueSEM = std(SusFlpCerUnique)/sqrt((length(SusFlpCerUnique)-1));

figure; % Figure 1C Behavior BeeSwarm Graph

y = (SusFlpCerUniqueMEAN);
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [1.0 0.2 0.2];
h.CData(2,:) = [0.4 0.2 0.7];
h.CData(3,:) = [0.4 0.8 1.0];
hold on;
plotSpread(SusFlpCerUnique);
hold on;
title ({'Fear'},'fontsize',14)
axis([0 4 -0.4 1.2]);
set(gca,'XTick',1:1:3);
set(gca,'XTickLabel',{'Danger','Uncertainty','Safety'},'fontsize',14);
set(gca,'XTickLabelRotation',45)
set(gca,'YTick',-0.5:0.5:1.5);
set(gca,'YTickLabel',{'-0.5','0.0','0.5','1.0','1.5'},'fontsize',14);
ylabel('Suppression Ratio','fontsize',14);
box off;
set(gcf,'Position',[1250 300 320 350]);

% figure; % Figure 1C Behavior Bar Graph
% 
% errorPlot = (SusFlpCerUniqueSEM);
% barPlot = (SusFlpCerUniqueMEAN);
% 
% h = barwitherr(errorPlot,barPlot);
% title ({'Fear'},'fontsize',14)
% axis([0 4 0 1]);
% h.FaceColor = 'flat';
% h.CData(1,:) = [1.0 0.2 0.2];
% h.CData(2,:) = [0.4 0.2 0.7];
% h.CData(3,:) = [0.4 0.8 1.0];
% set(gca,'XTick',1:1:3);
% set(gca,'XTickLabel',{'Danger','Uncertainty','Safety'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',0:0.25:1);
% set(gca,'YTickLabel',{'0.00','0.25','0.50','0.75','1.00'},'fontsize',14);
% ylabel('Suppression Ratio','fontsize',14);
% box off;
% set(gcf,'Position',[1250 300 320 300]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1D - Waveform Data for Population Scatters and Waveform Property Bar Graphs %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ii = 1:length(vlPAGcube.wave)

    wave = vlPAGcube.wave(:,:,ii);
    [valleyValue,valleyLocation] = min(wave); % valley
    [maxPreValleyValue,maxPreValleyLocation] = max(wave(1:valleyLocation)); % initial hyper polarization
    [maxPostValleyValue,maxPostValleyLocation] = max(wave(valleyLocation:end)); % after hyper polarization
    maxPostValleyLocation = maxPostValleyLocation + valleyLocation; % must add to get correct time point

    vlPAGcube.halfDuration(ii,1) = (((maxPostValleyLocation-valleyLocation)/2)/40); % calculate half duration
    p = maxPreValleyValue-wave(1,1); % initial hyperpolarization amplitude
    n = wave(1,1)-valleyValue; % depolarization amplitude

    vlPAGcube.amplitudeRatio(ii,1) = (n-p)/(n+p); % calculate ratio

end

for ii = 1:length(inhSus.wave)

    wave = inhSus.wave(:,:,ii);
    [valleyValue,valleyLocation] = min(wave); % valley
    [maxPreValleyValue,maxPreValleyLocation] = max(wave(1:valleyLocation)); % initial hyper polarization
    [maxPostValleyValue,maxPostValleyLocation] = max(wave(valleyLocation:end)); % after hyper polarization
    maxPostValleyLocation = maxPostValleyLocation + valleyLocation; % must add to get correct time point

    inhSus.halfDuration(ii,1) = (((maxPostValleyLocation-valleyLocation)/2)/40); % calculate half duration
    p = maxPreValleyValue-wave(1,1); % initial hyperpolarization amplitude
    n = wave(1,1)-valleyValue; % depolarization amplitude

    inhSus.amplitudeRatio(ii,1) = (n-p)/(n+p); % calculate ratio

end

for ii = 1:length(inhFlp.wave)

    wave = inhFlp.wave(:,:,ii);
    [valleyValue,valleyLocation] = min(wave); % valley
    [maxPreValleyValue,maxPreValleyLocation] = max(wave(1:valleyLocation)); % initial hyper polarization
    [maxPostValleyValue,maxPostValleyLocation] = max(wave(valleyLocation:end)); % after hyper polarization
    maxPostValleyLocation = maxPostValleyLocation + valleyLocation; % must add to get correct time point

    inhFlp.halfDuration(ii,1) = (((maxPostValleyLocation-valleyLocation)/2)/40); % calculate half duration
    p = maxPreValleyValue-wave(1,1); % initial hyperpolarization amplitude
    n = wave(1,1)-valleyValue; % depolarization amplitude

    inhFlp.amplitudeRatio(ii,1) = (n-p)/(n+p); % calculate ratio

end

 % Determine significance (h) and direction (d) of Flp vs Sus waveform characteristics
    
aR = ttest2(inhSus.amplitudeRatio,inhFlp.amplitudeRatio);

hD = ttest2(inhSus.halfDuration,inhFlp.halfDuration);

for ii = 1:size(inhSus.tag,3)
    
    inhSus.fire.raw.base10mean(ii,:) = mean(inhSus.fire.raw.base10(:,:,ii));
end

for ii = 1:size(inhFlp.tag,3)
    
    inhFlp.fire.raw.base10mean(ii,:) = mean(inhFlp.fire.raw.base10(:,:,ii));
end

for ii = 1:size(vlPAGcube.tag,3)
    
    vlPAGcube.fire.raw.base10mean(ii,:) = mean(vlPAGcube.fire.raw.base10(:,:,ii));
end

b10 = ttest2(inhSus.fire.raw.base10mean,inhFlp.fire.raw.base10mean);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Waveform Property Data for Bar Graphs Sus vs. Flp %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inhSus.fire.raw.base10MEAN = mean(inhSus.fire.raw.base10mean); %COLUMN - MEAN of MEANS FOR BAR
inhSus.fire.raw.base10SEM = std(inhSus.fire.raw.base10mean)/sqrt((length(inhSus.fire.raw.base10mean)-1)); %SEM FOR BAR

inhSus.halfDurationMEAN = mean(inhSus.halfDuration); %COLUMN - MEAN of MEANS FOR BAR
inhSus.halfDurationSEM = std(inhSus.halfDuration)/sqrt((length(inhSus.halfDuration)-1)); %SEM FOR BAR

inhSus.amplitudeRatioMEAN = mean(inhSus.amplitudeRatio); %COLUMN - MEAN of MEANS FOR BAR
inhSus.amplitudeRatioSEM = std(inhSus.amplitudeRatio)/sqrt((length(inhSus.amplitudeRatio)-1)); %SEM FOR BAR

inhFlp.fire.raw.base10MEAN = mean(inhFlp.fire.raw.base10mean); %COLUMN - MEAN of MEANS FOR BAR
inhFlp.fire.raw.base10SEM = std(inhFlp.fire.raw.base10mean)/sqrt((length(inhFlp.fire.raw.base10mean)-1)); %SEM FOR BAR

inhFlp.halfDurationMEAN = mean(inhFlp.halfDuration); %COLUMN - MEAN of MEANS FOR BAR
inhFlp.halfDurationSEM = std(inhFlp.halfDuration)/sqrt((length(inhFlp.halfDuration)-1)); %SEM FOR BAR

inhFlp.amplitudeRatioMEAN = mean(inhFlp.amplitudeRatio); %COLUMN - MEAN of MEANS FOR BAR
inhFlp.amplitudeRatioSEM = std(inhFlp.amplitudeRatio)/sqrt((length(inhFlp.amplitudeRatio)-1)); %SEM FOR BAR

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % OLD Figure 1D - Population Scatter vlPAG Cube Waveform Properties Scatter with Flp/Sus Overlay %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure;
% 
% box off;
% title ('Waveform')
% h = scatter(vlPAGcube.halfDuration,vlPAGcube.fire.raw.base10mean,300);
% set(h,'MarkerFaceColor','0.8 0.8 0.8');
% set(h,'MarkerEdgeColor','0.8 0.8 0.8');
% set(h,'LineWidth',1);
% axis([0.03 0.35 -10 180]);
% set(gca,'XTick',0:.1:0.4);
% set(gca,'XTickLabel',{'0.0','0.1','0.2','0.3','0.4'},'fontsize',18);
% set(gca,'YTick',0:20:180);
% set(gca,'YTickLabel',{'0','20','40','60','80','100','120','140','160','180'},'fontsize',18);
% xlabel('','fontsize',18);
% ylabel('','fontsize',18);
% vline(0,'k');
% hold on;
% hline(0,'k');
% hold on;
% set(h,'linewidth',1);
% hold on;
% h = scatter(inhSus.halfDuration,inhSus.fire.raw.base10mean,300);
% set(h,'MarkerFaceColor','0.6 0.6 0.8');
% set(h,'MarkerEdgeColor','0.6 0.6 0.8');
% set(h,'LineWidth',1);
% hold on;
% h = scatter(inhFlp.halfDuration,inhFlp.fire.raw.base10mean,300);
% set(h,'MarkerFaceColor','0.2 0.8 0.8');
% set(h,'MarkerEdgeColor','0.2 0.8 0.8');
% set(h,'LineWidth',1);
% 
% 
% set(gcf,'Position',[100 200 700 700]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 1 - Waveform Property Beeswarm Plots Sus vs. Flp %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;

subplot (1,3,1); %Baseline Firing Beeswarm Plot 

y = [inhFlp.fire.raw.base10MEAN,inhSus.fire.raw.base10MEAN];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [0.2 0.8 0.8];
h.CData(2,:) = [0.6 0.6 0.8];
hold on;
plotSpread([nan(46,1),inhSus.fire.raw.base10mean],'binWidth',0.1);
hold on;
plotSpread([inhFlp.fire.raw.base10mean,nan(45,1)],'binWidth',0.1);
hold on;
box off;
title ({''},'fontsize',14)
set(gca,'XTick',1:1:2);
set(gca,'XTickLabel',{'Flip','Sustain'},'fontsize',14);
set(gca,'XTickLabelRotation',45)
set(gca,'YTick',0.00:20:160.0);
set(gca,'YTickLabel',{'0.00','','40.0','','80.0','','120.0','','160.0'},'fontsize',14);
axis([0 3 0.00 175.50]);
hold on;
ylabel('Baseline Firing','fontsize',14);
clear a;

subplot (1,3,2); %Half the Duration Beeswarm Plot

y = [inhFlp.halfDurationMEAN,inhSus.halfDurationMEAN];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [0.2 0.8 0.8];
h.CData(2,:) = [0.6 0.6 0.8];
hold on;
plotSpread([nan(46,1),inhSus.halfDuration],'binWidth',0.1);
hold on;
plotSpread([inhFlp.halfDuration,nan(45,1)],'binWidth',0.1);
hold on;
box off;
title ({''},'fontsize',14)
set(gca,'XTick',1:1:2);
set(gca,'XTickLabel',{'Flip','Sustain'},'fontsize',14);
set(gca,'XTickLabelRotation',45)
set(gca,'YTick',0.00:0.05:0.30);
set(gca,'YTickLabel',{'0.00','0.05','0.10','0.15','0.20','0.25','0.30'},'fontsize',14);
axis([0 3 0.00 0.33]);
hold on;
ylabel('Half the Duration','fontsize',14);
clear a;

subplot (1,3,3); %Amplitude Ratio Beeswarm Plot

y = [inhFlp.amplitudeRatioMEAN,inhSus.amplitudeRatioMEAN];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [0.2 0.8 0.8];
h.CData(2,:) = [0.6 0.6 0.8];
hold on;
plotSpread([nan(46,1),inhSus.amplitudeRatio],'binWidth',0.1);
hold on;
plotSpread([inhFlp.amplitudeRatio,nan(45,1)],'binWidth',0.1);
hold on;
box off;
title ({''},'fontsize',14)
h.FaceColor = 'flat';
h.CData(1,:) = [0.2 0.8 0.8];
h.CData(2,:) = [0.6 0.6 0.8];
set(gca,'XTick',1:1:2);
set(gca,'XTickLabel',{'Flip','Sustain'},'fontsize',14);
set(gca,'XTickLabelRotation',45)
set(gca,'YTick',0.00:0.20:1.20);
set(gca,'YTickLabel',{'0.00','0.20','0.40','0.60','0.80','1.00'},'fontsize',14);
axis([0 3 0.00 1.1]);
hold on;
ylabel('Amplitude Ratio','fontsize',14);
set(gcf,'Position',[200 400 1300 400]);

clear a;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % OLD BAR GRAPHS Figure 1 - Waveform Property BarPlots Sus vs. Flp %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure;
% subplot (3,1,1);%Baseline Firing
% 
% errPlot = [inhFlp.fire.raw.base10SEM;inhSus.fire.raw.base10SEM];
% barPlot = [inhFlp.fire.raw.base10MEAN;inhSus.fire.raw.base10MEAN];
% 
% h = barwitherr(errPlot,barPlot); %#ok<*NASGU>
% box off;
% title ({''},'fontsize',14)
% h.FaceColor = 'flat';
% h.CData(1,:) = [0.2 0.8 0.8];
% h.CData(2,:) = [0.6 0.6 0.8];
% set(gca,'XTick',1:1:2);
% set(gca,'XTickLabel',{'Flip','Sustain'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',0.00:15:60.0);
% set(gca,'YTickLabel',{'0.00','15.0','30.0','45.0','60.0'},'fontsize',14);
% axis([0 3 0.00 60.0]);
% hold on;
% ylabel('Baseline Firing','fontsize',14);
% set(gcf,'Position',[200 400 250 750]);
% clear a;
% 
% subplot (3,1,2); %Half the Duration BarPlot 
% 
% errPlot = [inhFlp.halfDurationSEM;inhSus.halfDurationSEM];
% barPlot = [inhFlp.halfDurationMEAN;inhSus.halfDurationMEAN];
% 
% h = barwitherr(errPlot,barPlot); %#ok<*NASGU>
% box off;
% title ({''},'fontsize',14)
% h.FaceColor = 'flat';
% h.CData(1,:) = [0.2 0.8 0.8];
% h.CData(2,:) = [0.6 0.6 0.8];
% set(gca,'XTick',1:1:2);
% set(gca,'XTickLabel',{'Flip','Sustain'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',0.00:0.03:0.12);
% set(gca,'YTickLabel',{'0.00','0.03','0.06','0.09','0.12',},'fontsize',14);
% axis([0 3 0.00 0.12]);
% hold on;
% ylabel('Half the Duration','fontsize',14);
% set(gcf,'Position',[200 400 250 750]);
% clear a;
% 
% subplot (3,1,3); %Amplitude Ratio BarPlot 
% 
% errPlot = [inhFlp.amplitudeRatioSEM;inhSus.amplitudeRatioSEM];
% barPlot = [inhFlp.amplitudeRatioMEAN;inhSus.amplitudeRatioMEAN];
% 
% h = barwitherr(errPlot,barPlot); %#ok<*NASGU>
% box off;
% title ({''},'fontsize',14)
% h.FaceColor = 'flat';
% h.CData(1,:) = [0.2 0.8 0.8];
% h.CData(2,:) = [0.6 0.6 0.8];
% set(gca,'XTick',1:1:2);
% set(gca,'XTickLabel',{'Flip','Sustain'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',0.00:0.20:0.80);
% set(gca,'YTickLabel',{'0.00','0.20','0.40','0.60','0.80'},'fontsize',14);
% axis([0 3 0.00 0.80]);
% hold on;
% ylabel('Amplitude Ratio','fontsize',14);
% set(gcf,'Position',[200 400 250 750]);
% 
% clear a;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                             %
%  Column # for important events in 'fire' variables          %
%                                                             %
%                        FirstFive   LastFive   First shock   %
%                        interval    LastFive   interval      %
%  s1 (1-s bin)          21-25       26-30      33            %
%  ms 500 (500-ms bin)   41-50       51-60      65            %
%  ms 100 (100-ms bin)   201-250     251-300    321           %
%  ms 250 (250-ms bin)   81-100      101-120    129           %
%                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 2 - Population Line Graphs 250ms Bins %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; %Figure 2A - Sustain Population Line Graph 250 ms bins

subplot (2,4,5:6);

nan2 = nan(1,2);
nan20 = nan(1,20);
nan56 = nan(1,56); 
 
a = [inhSus.fire.z.ms250.cue100mean(1,73:128),nan2,inhSus.fire.z.ms250.cue100mean(131:150)]; 
b = [inhSus.fire.z.ms250.cuePRmean(1,73:128),nan2,nan20];
c = [nan56,nan2,inhSus.fire.z.ms250.cueSPRmean(131:150)];
d = [nan56,nan2,inhSus.fire.z.ms250.cueNsPRmean(131:150)];
e = [inhSus.fire.z.ms250.cue0mean(1,73:128),nan2,inhSus.fire.z.ms250.cue0mean(131:150)];

x = 1:78;
y = [a;b;c;d;e];

title ({'Sustain Population (n = 46)'},'fontsize',14)
axis([1 78 -0.75 0.5]);
hold on;
hline(0,'k');
hold on;
vline(8,'k');
hold on;
vline(48,'k');
hold on;
h = plot(x,y);
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0.2 0.2]);
set(h(2),'Color',[0.4 0.0 1.0]);
set(h(3),'Color',[0.4 0.0 1.0]);
set(h(4),'Color',[0.4 0.0 1.0]);
set(h(4),'linestyle','--');
set(h(5),'Color',[0.0 0.4 1.0]);
set(gca,'XTick',0:4:78);
set(gca,'XTickLabel',{'-2','-1','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'},'fontsize',14);
set(gca,'YTick',-0.75:0.25:0.5);
set(gca,'YTickLabel',{'-0.75','-0.50','-0.25','-0.00','0.25','0.50'},'fontsize',14);
set(gca,'fontsize',14);
box off;
hold on;
axis([1 78 -0.75 0.5]);
hold on;
xlabel('Time from Cue Onset (s)','fontsize',16);
ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[200 400 1160 790]);
clear h ii pos x y;

subplot (2,4,1:2); %Figure 2C - Flip Population Line Graph 100ms bins

a2 = [inhFlp.fire.z.ms250.cue100mean(1,73:128),nan2,inhFlp.fire.z.ms250.cue100mean(131:150)]; 
b2 = [inhFlp.fire.z.ms250.cuePRmean(1,73:128),nan2,nan20];
c2 = [nan56,nan2,inhFlp.fire.z.ms250.cueSPRmean(131:150)];
d2 = [nan56,nan2,inhFlp.fire.z.ms250.cueNsPRmean(131:150)];
e2 = [inhFlp.fire.z.ms250.cue0mean(1,73:128),nan2,inhFlp.fire.z.ms250.cue0mean(131:150)];

x = 1:78;
y = [a2;b2;c2;d2;e2];

title ({'Flip Population (n = 45)'},'fontsize',14)
axis([1 78 -0.75 0.5]);
hold on;
hline(0,'k');
hold on;
vline(8,'k');
hold on;
vline(48,'k');
hold on;
h = plot(x,y);
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0.2 0.2]);
set(h(2),'Color',[0.4 0.0 1.0]);
set(h(3),'Color',[0.4 0.0 1.0]);
set(h(4),'Color',[0.4 0.0 1.0]);
set(h(4),'linestyle','--');
set(h(5),'Color',[0.0 0.4 1.0]);
set(gca,'XTick',0:4:78);
set(gca,'XTickLabel',{'-2','-1','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'},'fontsize',14);
set(gca,'YTick',-0.75:0.25:0.5);
set(gca,'YTickLabel',{'-0.75','-0.50','-0.25','-0.00','0.25','0.50'},'fontsize',14);
set(gca,'fontsize',14);
box off;
hold on;
axis([1 78 -0.75 0.5]);
hold on;
xlabel('Time from Cue Onset (s)','fontsize',16);
ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[100 100 1160 790]);
clear h ii pos x y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 2 - Population Line Graphs 100ms Bins %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure; %Figure 2A - Sustain Population Line Graph 100ms bins
% 
% subplot (2,4,1:2);
% 
% nan5 = nan(1,5);
% nan25 = nan(1,25);
% nan140 = nan(1,140); 
%  
% a = [inhSus.fire.z.ms100.cue100mean(1,181:320),nan5,inhSus.fire.z.ms100.cue100mean(1,326:350)]; 
% b = [inhSus.fire.z.ms100.cuePRmean(1,181:320),nan5,nan25];
% c = [nan140,nan5,inhSus.fire.z.ms100.cueSPRmean(1,326:350)];
% d = [nan140,nan5,inhSus.fire.z.ms100.cueNsPRmean(1,326:350)];
% e = [inhSus.fire.z.ms100.cue0mean(1,181:320),nan5,inhSus.fire.z.ms100.cue0mean(1,326:350)];
% 
% x = 1:170;
% y = [a;b;c;d;e];

%variable to run for ANOVA below
%  y = [inhSus.fire.z.ms250.cue100(:,73:128),...
%       inhSus.fire.z.ms250.cuePR(:,73:128),...
%       inhSus.fire.z.ms250.cue0(:,73:128)];
% 
% title ({'Sustain Population (n = 46)'},'fontsize',14)
% axis([1 170 -0.6 0.5]);
% hold on;
% hline(0,'k');
% hold on;
% vline(20,'k');
% hold on;
% vline(120,'k');
% hold on;
% h = plot(x,y);
% set(h,'linewidth',1.5);
% set(h,'marker','none');
% set(h,'markersize',10);
% set(h(1),'Color',[1.0 0.2 0.2]);
% set(h(2),'Color',[0.4 0.0 1.0]);
% set(h(3),'Color',[0.4 0.0 1.0]);
% set(h(4),'Color',[0.4 0.0 1.0]);
% set(h(4),'linestyle','--');
% set(h(5),'Color',[0.0 0.4 1.0]);
% set(gca,'XTick',0:10:170);
% set(gca,'XTickLabel',{'-2','-1','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'},'fontsize',14);
% set(gca,'YTick',-0.5:0.5:0.5);
% set(gca,'YTickLabel',{'-0.5','-0.0','0.5'},'fontsize',14);
% set(gca,'fontsize',14);
% box off;
% hold on;
% axis([1 170 -0.6 0.5]);
% hold on;
% xlabel('Time from Cue Onset (s)','fontsize',16);
% ylabel('Normalized Firing Rate','fontsize',14);
% set(gcf,'Position',[200 400 1160 790]);
% clear h ii pos x y;
% 
% subplot (2,4,5:6); %Figure 2C - Flip Population Line Graph 100ms bins
% 
% 
% a2 = [inhFlp.fire.z.ms100.cue100mean(1,181:320),nan5,inhFlp.fire.z.ms100.cue100mean(1,326:350)]; 
% b2 = [inhFlp.fire.z.ms100.cuePRmean(1,181:320),nan5,nan25];
% c2 = [nan140,nan5,inhFlp.fire.z.ms100.cueSPRmean(1,326:350)];
% d2 = [nan140,nan5,inhFlp.fire.z.ms100.cueNsPRmean(1,326:350)];
% e2 = [inhFlp.fire.z.ms100.cue0mean(1,181:320),nan5,inhFlp.fire.z.ms100.cue0mean(1,326:350)];
% 
% x = 1:170;
% y = [a2;b2;c2;d2;e2];

%variable to run for ANOVA below
%  y = [inhFlp.fire.z.ms250.cue100(:,73:128),...
%       inhFlp.fire.z.ms250.cuePR(:,73:128),...
%       inhFlp.fire.z.ms250.cue0(:,73:128)];
% 
% title ({'Flip Population (n = 45)'},'fontsize',14)
% axis([1 170 -0.6 0.5]);
% hold on;
% hline(0,'k');
% hold on;
% vline(20,'k');
% hold on;
% vline(120,'k');
% hold on;
% h = plot(x,y);
% set(h,'linewidth',1.5);
% set(h,'marker','none');
% set(h,'markersize',10);
% set(h(1),'Color',[1.0 0.2 0.2]);
% set(h(2),'Color',[0.4 0.0 1.0]);
% set(h(3),'Color',[0.4 0.0 1.0]);
% set(h(4),'Color',[0.4 0.0 1.0]);
% set(h(4),'linestyle','--');
% set(h(5),'Color',[0.0 0.4 1.0]);
% set(gca,'XTick',0:10:170);
% set(gca,'XTickLabel',{'-2','-1','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'},'fontsize',14);
% set(gca,'YTick',-0.5:0.5:0.5);
% set(gca,'YTickLabel',{'-0.5','-0.0','0.5'},'fontsize',14);
% set(gca,'fontsize',14);
% box off;
% hold on;
% axis([1 170 -0.6 0.5]);
% hold on;
% xlabel('Time from Cue Onset (s)','fontsize',16);
% ylabel('Normalized Firing Rate','fontsize',14);
% set(gcf,'Position',[200 400 1160 790]);
% clear h ii pos x y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 2 - Early/Late BeeSwarm Graphs 250ms Bins %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,4,7); %Figure 2B - Sus Early Bar Graph 250ms bins

y = [inhSus.fire.z.ms250.firstFive.cue100mean,inhSus.fire.z.ms250.firstFive.cuePRmean,inhSus.fire.z.ms250.firstFive.cue0mean];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [1.0 0.2 0.2];
h.CData(2,:) = [0.4 0.2 0.7];
h.CData(3,:) = [0.4 0.8 1.0];
hold on;
plotSpread([inhSus.fire.z.ms250.firstFive.cue100,inhSus.fire.z.ms250.firstFive.cuePR,inhSus.fire.z.ms250.firstFive.cue0],'binWidth',0.1);
hold on;
box off;
title ('Early')
set(gca,'XTick',1:1:3);
set(gca,'XTickLabel',{'D','U','S'},'fontsize',14);
% set(gca,'XTickLabelRotation',45);
set(gca,'YTick',-1.5:0.5:1.0);
set(gca,'YTickLabel',{'-1.5','-1.0','-0.5','-0.0','0.5','1.0'},'fontsize',14);
axis([0 4 -1.7 1.2]);
hold on;


ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[200 400 1160 790]);

clear a;

subplot(2,4,8); %Figure 2B - Sus Late Bar Graph 100ms bins

y = [inhSus.fire.z.ms250.lastFive.cue100mean,inhSus.fire.z.ms250.lastFive.cuePRmean,inhSus.fire.z.ms250.lastFive.cue0mean];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [1.0 0.2 0.2];
h.CData(2,:) = [0.4 0.2 0.7];
h.CData(3,:) = [0.4 0.8 1.0];
hold on;
plotSpread([inhSus.fire.z.ms250.lastFive.cue100,inhSus.fire.z.ms250.lastFive.cuePR,inhSus.fire.z.ms250.lastFive.cue0],'binWidth',0.1);
hold on;
box off;
title ('Late')
set(gca,'XTick',1:1:3);
set(gca,'XTickLabel',{'D','U','S'},'fontsize',14);
% set(gca,'XTickLabelRotation',45);
set(gca,'YTick',-1.5:0.5:1.0);
set(gca,'YTickLabel',{'-1.5','-1.0','-0.5','-0.0','0.5','1.0'},'fontsize',14);
axis([0 4 -1.7 1.2]);
hold on;

ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[200 400 1160 790]);

clear a;

subplot(2,4,3); %Figure 2D - Flp Early Bar Graph 100ms bins

y = [inhFlp.fire.z.ms250.firstFive.cue100mean,inhFlp.fire.z.ms250.firstFive.cuePRmean,inhFlp.fire.z.ms250.firstFive.cue0mean];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [1.0 0.2 0.2];
h.CData(2,:) = [0.4 0.2 0.7];
h.CData(3,:) = [0.4 0.8 1.0];
hold on;
plotSpread([inhFlp.fire.z.ms250.firstFive.cue100,inhFlp.fire.z.ms250.firstFive.cuePR,inhFlp.fire.z.ms250.firstFive.cue0],'binWidth',0.1);
hold on;
box off;
title ('Early')
set(gca,'XTick',1:1:3);
set(gca,'XTickLabel',{'D','U','S'},'fontsize',14);
% set(gca,'XTickLabelRotation',45);
set(gca,'YTick',-1.5:0.5:1.0);
set(gca,'YTickLabel',{'-1.5','-1.0','-0.5','-0.0','0.5','1.0'},'fontsize',14);
axis([0 4 -1.7 1.2]);
hold on;

ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[200 400 1160 790]);

clear a;

subplot(2,4,4); %Figure 2D - Flp Late Bar Graph 100ms bins

y = [inhFlp.fire.z.ms250.lastFive.cue100mean,inhFlp.fire.z.ms250.lastFive.cuePRmean,inhFlp.fire.z.ms250.lastFive.cue0mean];
h = bar(y);
h.FaceColor = 'flat';
h.CData(1,:) = [1.0 0.2 0.2];
h.CData(2,:) = [0.4 0.2 0.7];
h.CData(3,:) = [0.4 0.8 1.0];
hold on;
plotSpread([inhFlp.fire.z.ms250.lastFive.cue100,inhFlp.fire.z.ms250.lastFive.cuePR,inhFlp.fire.z.ms250.lastFive.cue0],'binWidth',0.1);
hold on;
box off;
title ('Late')
set(gca,'XTick',1:1:3);
set(gca,'XTickLabel',{'D','U','S'},'fontsize',14);
% set(gca,'XTickLabelRotation',45);
set(gca,'YTick',-1.5:0.5:1.0);
set(gca,'YTickLabel',{'-1.5','-1.0','-0.5','-0.0','0.5','1.0'},'fontsize',14);
axis([0 4 -1.7 1.2]);
hold on;

ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[100 100 1160 790]);

clear a;


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Figure 2 - Early/Late Bar Graphs 100ms Bins %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% subplot(2,4,3); %Figure 2B - Sus Early Bar Graph 100ms bins
% 
% errPlot = [inhSus.fire.z.ms100.firstFive.cue100SEM;inhSus.fire.z.ms100.firstFive.cuePRSEM;inhSus.fire.z.ms100.firstFive.cue0SEM];
% barPlot = [inhSus.fire.z.ms100.firstFive.cue100mean;inhSus.fire.z.ms100.firstFive.cuePRmean; inhSus.fire.z.ms100.firstFive.cue0mean];
% 
% maxPlot = (errPlot+barPlot);
% maxPlot = max(maxPlot);
% 
% h = barwitherr(errPlot,barPlot);
% box off;
% title ('Early')
% h.FaceColor = 'flat';
% h.CData(1,:) = [1.0 0.2 0.2];
% h.CData(2,:) = [0.4 0.0 1.0];
% h.CData(3,:) = [0.0 0.4 1.0];
% set(gca,'XTick',1:1:3);
% set(gca,'XTickLabel',{'Danger','Uncertainty','Safety'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',-0.5:0.5:0.5);
% set(gca,'YTickLabel',{'-0.5','-0.0','0.5'},'fontsize',14);
% axis([0 4 -0.6 .5]);
% hold on;
% 
% 
% ylabel('Normalized Firing Rate','fontsize',14);
% set(gcf,'Position',[200 400 1160 790]);
% 
% clear a;
% 
% subplot(2,4,4); %Figure 2B - Sus Late Bar Graph 100ms bins
% 
% errPlot = [inhSus.fire.z.ms100.lastFive.cue100SEM;inhSus.fire.z.ms100.lastFive.cuePRSEM;inhSus.fire.z.ms100.lastFive.cue0SEM];
% barPlot = [inhSus.fire.z.ms100.lastFive.cue100mean;inhSus.fire.z.ms100.lastFive.cuePRmean; inhSus.fire.z.ms100.lastFive.cue0mean];
% 
% maxPlot = (errPlot+barPlot);
% maxPlot = max(maxPlot);
% 
% h = barwitherr(errPlot,barPlot);
% box off;
% title ('Late')
% h.FaceColor = 'flat';
% h.CData(1,:) = [1.0 0.2 0.2];
% h.CData(2,:) = [0.4 0.0 1.0];
% h.CData(3,:) = [0.0 0.4 1.0];
% set(gca,'XTick',1:1:3);
% set(gca,'XTickLabel',{'Danger','Uncertainty','Safety'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',-0.5:0.5:0.5);
% set(gca,'YTickLabel',{'-0.5','-0.0','0.5'},'fontsize',14);
% axis([0 4 -0.6 .5]);
% hold on;
% 
% ylabel('Normalized Firing Rate','fontsize',14);
% set(gcf,'Position',[200 400 1160 790]);
% 
% clear a;
% 
% subplot(2,4,7); %Figure 2D - Flp Early Bar Graph 100ms bins
% 
% errPlot = [inhFlp.fire.z.ms100.firstFive.cue100SEM;inhFlp.fire.z.ms100.firstFive.cuePRSEM;inhFlp.fire.z.ms100.firstFive.cue0SEM];
% barPlot = [inhFlp.fire.z.ms100.firstFive.cue100mean;inhFlp.fire.z.ms100.firstFive.cuePRmean; inhFlp.fire.z.ms100.firstFive.cue0mean];
% 
% h = barwitherr(errPlot,barPlot); %#ok<*NASGU>
% box off;
% title ({'Early'},'fontsize',14)
% h.FaceColor = 'flat';
% h.CData(1,:) = [1.0 0.2 0.2];
% h.CData(2,:) = [0.4 0.0 1.0];
% h.CData(3,:) = [0.0 0.4 1.0];
% set(gca,'XTick',1:1:3);
% set(gca,'XTickLabel',{'Danger','Uncertainty','Safety'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',-0.5:0.5:0.5);
% set(gca,'YTickLabel',{'-0.5','-0.0','0.5'},'fontsize',14);
% axis([0 4 -0.6 .5]);
% hold on;
% 
% 
% ylabel('Normalized Firing Rate','fontsize',14);
% set(gcf,'Position',[200 400 1160 790]);
% 
% clear a;
% 
% subplot(2,4,8); %Figure 2D - Flp Late Bar Graph 100ms bins
% 
% errPlot = [inhFlp.fire.z.ms100.lastFive.cue100SEM;inhFlp.fire.z.ms100.lastFive.cuePRSEM;inhFlp.fire.z.ms100.lastFive.cue0SEM];
% barPlot = [inhFlp.fire.z.ms100.lastFive.cue100mean;inhFlp.fire.z.ms100.lastFive.cuePRmean; inhFlp.fire.z.ms100.lastFive.cue0mean];
% 
% maxPlot = (errPlot+barPlot);
% maxPlot = max(maxPlot);
% 
% h = barwitherr(errPlot,barPlot);
% box off;
% title ({'Late'},'fontsize',14)
% h.FaceColor = 'flat';
% h.CData(1,:) = [1.0 0.2 0.2];
% h.CData(2,:) = [0.4 0.0 1.0];
% h.CData(3,:) = [0.0 0.4 1.0];
% set(gca,'XTick',1:1:3);
% set(gca,'XTickLabel',{'Danger','Uncertainty','Safety'},'fontsize',14);
% set(gca,'XTickLabelRotation',45)
% set(gca,'YTick',-0.5:0.5:0.5);
% set(gca,'YTickLabel',{'-0.5','-0.0','0.5'},'fontsize',14);
% axis([0 4 -0.6 .5]);
% hold on;
% 
% ylabel('Normalized Firing Rate','fontsize',14);
% set(gcf,'Position',[200 400 1160 790]);
% 
% clear a;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 3 - Descriptive Scatters InhSus and Flip 100ms Bins%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; 
% Inhibitory Sustain Danger vs. Uncertainty Early (firstFive) - Between
subplot (2,4,1);

zzMin = min(inhSus.fire.z.ms250.firstFive.cue100);
zzMax = max(inhSus.fire.z.ms250.firstFive.cue100);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.ms250.firstFive.cue100,inhSus.fire.z.ms250.firstFive.cuePR,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhSus.fire.z.ms250.firstFive.cue100,inhSus.fire.z.ms250.firstFive.cuePR); % calculate correlation
inhSus.fire.z.ms250.firstFive.cue100vcuePRr2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.ms250.firstFive.cue100vcuePRp = pval; % get the p value for the correlation coefficient
inhSus.fire.z.ms250.firstFive.cue100sign = signtest(inhSus.fire.z.ms250.firstFive.cue100);
inhSus.fire.z.ms250.firstFive.cuePRsign = signtest(inhSus.fire.z.ms250.firstFive.cuePR);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhSus Early')
h = scatter(inhSus.fire.z.ms250.firstFive.cue100(:,:),inhSus.fire.z.ms250.firstFive.cuePR(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Danger','fontsize',15);
ylabel('Normalized Firing Rate Uncertainty','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Sustain Danger vs. Uncertainty Late (lastFive) - Between
subplot (2,4,2); 

zzMin = min(inhSus.fire.z.ms250.lastFive.cue100);
zzMax = max(inhSus.fire.z.ms250.lastFive.cue100);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.ms250.lastFive.cue100,inhSus.fire.z.ms250.lastFive.cuePR,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhSus.fire.z.ms250.lastFive.cue100,inhSus.fire.z.ms250.lastFive.cuePR); % calculate correlation
inhSus.fire.z.ms250.lastFive.cue100vcuePRr2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.ms250.lastFive.cue100vcuePRp = pval; % get the p value for the correlation coefficient
inhSus.fire.z.ms250.lastFive.cue100sign = signtest(inhSus.fire.z.ms250.lastFive.cue100);
inhSus.fire.z.ms250.lastFive.cuePRsign = signtest(inhSus.fire.z.ms250.lastFive.cuePR);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhSus Late')
h = scatter(inhSus.fire.z.ms250.lastFive.cue100(:,:),inhSus.fire.z.ms250.lastFive.cuePR(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Danger','fontsize',15);
ylabel('Normalized Firing Rate Uncertainty','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Flip Danger vs. Uncertainty Early (firstFive) - Between
subplot (2,4,3);

zzMin = min(inhFlp.fire.z.ms250.firstFive.cue100);
zzMax = max(inhFlp.fire.z.ms250.firstFive.cue100);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.ms250.firstFive.cue100,inhFlp.fire.z.ms250.firstFive.cuePR,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhFlp.fire.z.ms250.firstFive.cue100,inhFlp.fire.z.ms250.firstFive.cuePR); % calculate correlation
inhFlp.fire.z.ms250.firstFive.cue100vcuePRr2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.ms250.firstFive.cue100vcuePRp = pval; % get the p value for the correlation coefficient
inhFlp.fire.z.ms250.firstFive.cue100sign = signtest(inhFlp.fire.z.ms250.firstFive.cue100);
inhFlp.fire.z.ms250.firstFive.cuePRsign = signtest(inhFlp.fire.z.ms250.firstFive.cuePR);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhFlp Early')
h = scatter(inhFlp.fire.z.ms250.firstFive.cue100(:,:),inhFlp.fire.z.ms250.firstFive.cuePR(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Danger','fontsize',15);
ylabel('Normalized Firing Rate Uncertainty','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Flip Danger vs. Uncertainty Late (lastFive) - Between
subplot (2,4,4); 

zzMin = min(inhFlp.fire.z.ms250.lastFive.cue100);
zzMax = max(inhFlp.fire.z.ms250.lastFive.cue100);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.ms250.lastFive.cue100,inhFlp.fire.z.ms250.lastFive.cuePR,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhFlp.fire.z.ms250.lastFive.cue100,inhFlp.fire.z.ms250.lastFive.cuePR); % calculate correlation
inhFlp.fire.z.ms250.lastFive.cue100vcuePRr2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.ms250.lastFive.cue100vcuePRp = pval; % get the p value for the correlation coefficient
inhFlp.fire.z.ms250.lastFive.cue100sign = signtest(inhFlp.fire.z.ms250.lastFive.cue100);
inhFlp.fire.z.ms250.lastFive.cuePRsign = signtest(inhFlp.fire.z.ms250.lastFive.cuePR);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhFlp Late')
h = scatter(inhFlp.fire.z.ms250.lastFive.cue100(:,:),inhFlp.fire.z.ms250.lastFive.cuePR(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Danger','fontsize',15);
ylabel('Normalized Firing Rate Uncertainty','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Sustain Uncertainty vs. Safety Early (firstFive) - Between
subplot (2,4,5);

zzMin = min(inhSus.fire.z.ms250.firstFive.cuePR);
zzMax = max(inhSus.fire.z.ms250.firstFive.cuePR);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.ms250.firstFive.cuePR,inhSus.fire.z.ms250.firstFive.cue0,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhSus.fire.z.ms250.firstFive.cuePR,inhSus.fire.z.ms250.firstFive.cue0); % calculate correlation
inhSus.fire.z.ms250.firstFive.cuePRvcue0r2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.ms250.firstFive.cuePRvcue0p = pval; % get the p value for the correlation coefficient
% inhSus.fire.z.ms250.firstFive.cuePRsign = signtest(inhSus.fire.z.ms250.firstFive.cuePR);
inhSus.fire.z.ms250.firstFive.cue0sign = signtest(inhSus.fire.z.ms250.firstFive.cue0);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhSus Early')
h = scatter(inhSus.fire.z.ms250.firstFive.cuePR(:,:),inhSus.fire.z.ms250.firstFive.cue0(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Uncertainty','fontsize',15);
ylabel('Normalized Firing Rate Safety','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Sustain Uncertainty vs. Safety Late (lastFive) - Between
subplot (2,4,6); 

zzMin = min(inhSus.fire.z.ms250.lastFive.cuePR);
zzMax = max(inhSus.fire.z.ms250.lastFive.cuePR);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.ms250.lastFive.cuePR,inhSus.fire.z.ms250.lastFive.cue0,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhSus.fire.z.ms250.lastFive.cuePR,inhSus.fire.z.ms250.lastFive.cue0); % calculate correlation
inhSus.fire.z.ms250.lastFive.cuePRvcue0r2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.ms250.lastFive.cuePRvcue0p = pval; % get the p value for the correlation coefficient
% inhSus.fire.z.ms250.lastFive.cuePRsign = signtest(inhSus.fire.z.ms250.lastFive.cuePR);
inhSus.fire.z.ms250.lastFive.cue0sign = signtest(inhSus.fire.z.ms250.lastFive.cue0);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhSus Late')
h = scatter(inhSus.fire.z.ms250.lastFive.cuePR(:,:),inhSus.fire.z.ms250.lastFive.cue0(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Uncertainty','fontsize',15);
ylabel('Normalized Firing Rate Safety','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Flip Uncertainty vs. Safety Early (firstFive) - Between
 subplot (2,4,7);

zzMin = min(inhFlp.fire.z.ms250.firstFive.cuePR);
zzMax = max(inhFlp.fire.z.ms250.firstFive.cuePR);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.ms250.firstFive.cuePR,inhFlp.fire.z.ms250.firstFive.cue0,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhFlp.fire.z.ms250.firstFive.cuePR,inhFlp.fire.z.ms250.firstFive.cue0); % calculate correlation
inhFlp.fire.z.ms250.firstFive.cuePRvcue0r2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.ms250.firstFive.cuePRvcue0p = pval; % get the p value for the correlation coefficient
inhFlp.fire.z.ms250.firstFive.cuePRsign = signtest(inhFlp.fire.z.ms250.firstFive.cuePR);
inhFlp.fire.z.ms250.firstFive.cue0sign = signtest(inhFlp.fire.z.ms250.firstFive.cue0);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhFlp Early')
h = scatter(inhFlp.fire.z.ms250.firstFive.cuePR(:,:),inhFlp.fire.z.ms250.firstFive.cue0(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Uncertainty','fontsize',15);
ylabel('Normalized Firing Rate Safety','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% Inhibitory Flip Uncertainty vs. Safety Late (lastFive) - Between
subplot (2,4,8); 

zzMin = min(inhFlp.fire.z.ms250.lastFive.cuePR);
zzMax = max(inhFlp.fire.z.ms250.lastFive.cuePR);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.ms250.lastFive.cuePR,inhFlp.fire.z.ms250.lastFive.cue0,1);
f = polyval(p,zz);
xx = 0:10:1;
yy = 0:10:1;
[rho,pval] = corr(inhFlp.fire.z.ms250.lastFive.cuePR,inhFlp.fire.z.ms250.lastFive.cue0); % calculate correlation
inhFlp.fire.z.ms250.lastFive.cuePRvcue0r2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.ms250.lastFive.cuePRvcue0p = pval; % get the p value for the correlation coefficient
inhFlp.fire.z.ms250.lastFive.cuePRsign = signtest(inhFlp.fire.z.ms250.lastFive.cuePR);
inhFlp.fire.z.ms250.lastFive.cue0sign = signtest(inhFlp.fire.z.ms250.lastFive.cue0);
clear rho pval;
h = plot(xx,yy);
set(h,'Color','k');
set(h,'linewidth',1);
hold on;
box off;
title ('inhFlp Late')
h = scatter(inhFlp.fire.z.ms250.lastFive.cuePR(:,:),inhFlp.fire.z.ms250.lastFive.cue0(:,:),150);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-1.25 1.25 -1.25 1.25]);
set(gca,'XTick',-1:1:1);
set(gca,'XTickLabel',{'-1','0','1'},'fontsize',14);
set(gca,'YTick',-1:1:1);
set(gca,'YTickLabel',{'-1','0','1'},'fontsize',14);
xlabel('Normalized Firing Rate Uncertainty','fontsize',15);
ylabel('Normalized Firing Rate Safety','fontsize',15);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

set(gcf,'Position',[100 200 1637 752]);

clearvars -except inh inhFlp inhSus vlPAGcube;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simultaneous Regression (Tot/Prob) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

regBlank = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]; % must be first regression term
regProb = [1;1;1;1;1;1;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0;0;0;0;0;0;0;0;0;0]; % shock probability

for ii = 1:size(inhSus.tag,3)
   
    for jj = 1:14 % regression for pre-cue period (2 intervals), cue period (10 intervals) and delay period (2 intervals)
    regData(:,jj,ii) = inhSus.fire.z.s1.interval(:,jj+18,ii); %#ok<*SAGROW>
    regTotal = inhSus.cer.cue(:,1,ii);
    regTerms = [regBlank,regTotal,regProb];
    [b,~,~,~,~] = regress(regData(:,jj,ii),regTerms); %regress is function, has many outputs
    inhSus.fire.z.s1.reg.TotalComb(ii,jj) = b(2,1); % b always start at 2 to ignore ones
    inhSus.fire.z.s1.reg.ProbComb(ii,jj) = b(3,1); % b always start at 2 to ignore ones

    end
    
    % Perform individual to compare to simultaneous
    
    for jj = 1:14 % regression for pre-cue period (2 intervals), cue period (10 intervals) and delay period (2 intervals)
    regData(:,jj,ii) = inhSus.fire.z.s1.interval(:,jj+18,ii);
    regTerms = [regBlank,regProb];
    [b,~,~,~,~] = regress(regData(:,jj,ii),regTerms); %regress is function, has many outputs
    inhSus.fire.z.s1.reg.ProbInd(ii,jj) = b(2,1); % b always start at 2 to ignore ones

    end
    
    for jj = 1:14 % regression for pre-cue period (2 intervals), cue period (10 intervals) and delay period (2 intervals)
    regData(:,jj,ii) = inhSus.fire.z.s1.interval(:,jj+18,ii);
    regTerms = [regBlank,regTotal];
    [b,~,~,~,~] = regress(regData(:,jj,ii),regTerms); %regress is function, has many outputs
    inhSus.fire.z.s1.reg.TotalInd(ii,jj) = b(2,1); % b always start at 2 to ignore ones

    end
    
    clear jj;
    
end

for ii = 1:size(inhFlp.tag,3)
   
    for jj = 1:14 % regression for pre-cue period (2 intervals), cue period (10 intervals) and delay period (2 intervals)
    regData(:,jj,ii) = inhFlp.fire.z.s1.interval(:,jj+18,ii);
    regTotal = inhFlp.cer.cue(:,1,ii);
    regTerms = [regBlank,regTotal,regProb];
    [b,~,~,~,~] = regress(regData(:,jj,ii),regTerms); %regress is function, has many outputs
    inhFlp.fire.z.s1.reg.TotalComb(ii,jj) = b(2,1); % b always start at 2 to ignore ones
    inhFlp.fire.z.s1.reg.ProbComb(ii,jj) = b(3,1); % b always start at 2 to ignore ones 

    end
    
    % Perform individual to compare to simultaneous
    
    for jj = 1:14 % regression for pre-cue period (2 intervals), cue period (10 intervals) and delay period (2 intervals)
    regData(:,jj,ii) = inhFlp.fire.z.s1.interval(:,jj+18,ii);
    regTerms = [regBlank,regProb];
    [b,~,~,~,~] = regress(regData(:,jj,ii),regTerms); %regress is function, has many outputs
    inhFlp.fire.z.s1.reg.ProbInd(ii,jj) = b(2,1); % b always start at 2 to ignore ones

    end
    
    for jj = 1:14 % regression for pre-cue period (2 intervals), cue period (10 intervals) and delay period (2 intervals)
    regData(:,jj,ii) = inhFlp.fire.z.s1.interval(:,jj+18,ii);
    regTerms = [regBlank,regTotal];
    [b,~,~,~,~] = regress(regData(:,jj,ii),regTerms); %regress is function, has many outputs
    inhFlp.fire.z.s1.reg.TotalInd(ii,jj) = b(2,1); % b always start at 2 to ignore ones

    end
    
    clear jj;
    
end

inhSus.fire.z.s1.reg.TotalCombMean = mean(inhSus.fire.z.s1.reg.TotalComb);
inhSus.fire.z.s1.reg.TotalCombSEM = std(inhSus.fire.z.s1.reg.TotalComb)/sqrt((size(inhSus.fire.z.s1.reg.TotalComb,1)-1)); %SEM FOR Line Graph

inhSus.fire.z.s1.reg.ProbCombMean = mean(inhSus.fire.z.s1.reg.ProbComb);
inhSus.fire.z.s1.reg.ProbCombSEM = std(inhSus.fire.z.s1.reg.ProbComb)/sqrt((size(inhSus.fire.z.s1.reg.ProbComb,1)-1)); %SEM FOR Line Graph

inhSus.fire.z.s1.reg.TotalIndMean = mean(inhSus.fire.z.s1.reg.TotalInd);
inhSus.fire.z.s1.reg.TotalIndSEM = std(inhSus.fire.z.s1.reg.TotalInd)/sqrt((size(inhSus.fire.z.s1.reg.TotalInd,1)-1)); %SEM FOR Line Graph

inhSus.fire.z.s1.reg.ProbIndMean = mean(inhSus.fire.z.s1.reg.ProbInd);
inhSus.fire.z.s1.reg.ProbIndSEM = std(inhSus.fire.z.s1.reg.ProbInd)/sqrt((size(inhSus.fire.z.s1.reg.ProbInd,1)-1)); %SEM FOR Line Graph

inhFlp.fire.z.s1.reg.TotalCombMean = mean(inhFlp.fire.z.s1.reg.TotalComb);
inhFlp.fire.z.s1.reg.TotalCombSEM = std(inhFlp.fire.z.s1.reg.TotalComb)/sqrt((size(inhFlp.fire.z.s1.reg.TotalComb,1)-1)); %SEM FOR Line Graph

inhFlp.fire.z.s1.reg.ProbCombMean = mean(inhFlp.fire.z.s1.reg.ProbComb);
inhFlp.fire.z.s1.reg.ProbCombSEM = std(inhFlp.fire.z.s1.reg.ProbComb)/sqrt((size(inhFlp.fire.z.s1.reg.ProbComb,1)-1)); %SEM FOR Line Graph

inhFlp.fire.z.s1.reg.TotalIndMean = mean(inhFlp.fire.z.s1.reg.TotalInd);
inhFlp.fire.z.s1.reg.TotalIndSEM = std(inhFlp.fire.z.s1.reg.TotalInd)/sqrt((size(inhFlp.fire.z.s1.reg.TotalInd,1)-1)); %SEM FOR Line Graph

inhFlp.fire.z.s1.reg.ProbIndMean = mean(inhFlp.fire.z.s1.reg.ProbInd);
inhFlp.fire.z.s1.reg.ProbIndSEM = std(inhFlp.fire.z.s1.reg.ProbInd)/sqrt((size(inhFlp.fire.z.s1.reg.ProbInd,1)-1)); %SEM FOR Line Graph

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find mean first and last five %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inhSus.fire.z.s1.reg.TotalCombFirstFive = mean(inhSus.fire.z.s1.reg.TotalComb(:,3:7),2);
inhSus.fire.z.s1.reg.TotalCombLastFive = mean(inhSus.fire.z.s1.reg.TotalComb(:,8:12),2);
inhSus.fire.z.s1.reg.ProbCombFirstFive = mean(inhSus.fire.z.s1.reg.ProbComb(:,3:7),2);
inhSus.fire.z.s1.reg.ProbCombLastFive = mean(inhSus.fire.z.s1.reg.ProbComb(:,8:12),2);

inhSus.fire.z.s1.reg.TotalIndFirstFive = mean(inhSus.fire.z.s1.reg.TotalInd(:,3:7),2);
inhSus.fire.z.s1.reg.TotalIndLastFive = mean(inhSus.fire.z.s1.reg.TotalInd(:,8:12),2);
inhSus.fire.z.s1.reg.ProbIndFirstFive = mean(inhSus.fire.z.s1.reg.ProbInd(:,3:7),2);
inhSus.fire.z.s1.reg.ProbIndLastFive = mean(inhSus.fire.z.s1.reg.ProbInd(:,8:12),2);

inhFlp.fire.z.s1.reg.TotalCombFirstFive = mean(inhFlp.fire.z.s1.reg.TotalComb(:,3:7),2);
inhFlp.fire.z.s1.reg.TotalCombLastFive = mean(inhFlp.fire.z.s1.reg.TotalComb(:,8:12),2);
inhFlp.fire.z.s1.reg.ProbCombFirstFive = mean(inhFlp.fire.z.s1.reg.ProbComb(:,3:7),2);
inhFlp.fire.z.s1.reg.ProbCombLastFive = mean(inhFlp.fire.z.s1.reg.ProbComb(:,8:12),2);

inhFlp.fire.z.s1.reg.TotalIndFirstFive = mean(inhFlp.fire.z.s1.reg.TotalInd(:,3:7),2);
inhFlp.fire.z.s1.reg.TotalIndLastFive = mean(inhFlp.fire.z.s1.reg.TotalInd(:,8:12),2);
inhFlp.fire.z.s1.reg.ProbIndFirstFive = mean(inhFlp.fire.z.s1.reg.ProbInd(:,3:7),2);
inhFlp.fire.z.s1.reg.ProbIndLastFive = mean(inhFlp.fire.z.s1.reg.ProbInd(:,8:12),2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Correlation and sign test %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[rho,pval] = corr(inhSus.fire.z.s1.reg.TotalCombFirstFive,inhSus.fire.z.s1.reg.ProbCombFirstFive); % calculate correlation
inhSus.fire.z.s1.reg.CombFirstFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.s1.reg.CombFirstFiveP = pval; % get the p value for the correlation coefficient
inhSus.fire.z.s1.reg.ProbCombFirstFiveSign = signtest(inhSus.fire.z.s1.reg.ProbCombFirstFive);
inhSus.fire.z.s1.reg.TotalCombFirstFiveSign = signtest(inhSus.fire.z.s1.reg.TotalCombFirstFive);
clear rho pval a;

[rho,pval] = corr(inhSus.fire.z.s1.reg.TotalCombLastFive,inhSus.fire.z.s1.reg.ProbCombLastFive); % calculate correlation
inhSus.fire.z.s1.reg.CombLastFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.s1.reg.CombLastFiveP = pval; % get the p value for the correlation coefficient
inhSus.fire.z.s1.reg.ProbCombLastFiveSign = signtest(inhSus.fire.z.s1.reg.ProbCombLastFive);
inhSus.fire.z.s1.reg.TotalCombLastFiveSign = signtest(inhSus.fire.z.s1.reg.TotalCombLastFive);
clear rho pval a;

[rho,pval] = corr(inhSus.fire.z.s1.reg.TotalIndFirstFive,inhSus.fire.z.s1.reg.ProbIndFirstFive); % calculate correlation
inhSus.fire.z.s1.reg.IndFirstFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.s1.reg.IndFirstFiveP = pval; % get the p value for the correlation coefficient
clear rho pval a;

[rho,pval] = corr(inhSus.fire.z.s1.reg.TotalIndLastFive,inhSus.fire.z.s1.reg.ProbIndLastFive); % calculate correlation
inhSus.fire.z.s1.reg.IndLastFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhSus.fire.z.s1.reg.IndLastFiveP = pval; % get the p value for the correlation coefficient
clear rho pval a;

[rho,pval] = corr(inhFlp.fire.z.s1.reg.TotalCombFirstFive,inhFlp.fire.z.s1.reg.ProbCombFirstFive); % calculate correlation
inhFlp.fire.z.s1.reg.CombFirstFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.s1.reg.CombFirstFiveP = pval; % get the p value for the correlation coefficient
inhFlp.fire.z.s1.reg.ProbCombFirstFiveSign = signtest(inhFlp.fire.z.s1.reg.ProbCombFirstFive);
inhFlp.fire.z.s1.reg.TotalCombFirstFiveSign = signtest(inhFlp.fire.z.s1.reg.TotalCombFirstFive);
clear rho pval a;

[rho,pval] = corr(inhFlp.fire.z.s1.reg.TotalCombLastFive,inhFlp.fire.z.s1.reg.ProbCombLastFive); % calculate correlation
inhFlp.fire.z.s1.reg.CombLastFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.s1.reg.CombLastFiveP = pval; % get the p value for the correlation coefficient
inhFlp.fire.z.s1.reg.ProbCombLastFiveSign = signtest(inhFlp.fire.z.s1.reg.ProbCombLastFive);
inhFlp.fire.z.s1.reg.TotalCombLastFiveSign = signtest(inhFlp.fire.z.s1.reg.TotalCombLastFive);
clear rho pval a;

[rho,pval] = corr(inhFlp.fire.z.s1.reg.TotalIndFirstFive,inhFlp.fire.z.s1.reg.ProbIndFirstFive); % calculate correlation
inhFlp.fire.z.s1.reg.IndFirstFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.s1.reg.IndFirstFiveP = pval; % get the p value for the correlation coefficient
a = (inhFlp.fire.z.s1.reg.ProbIndFirstFive-inhFlp.fire.z.s1.reg.TotalIndFirstFive);
clear rho pval a;

[rho,pval] = corr(inhFlp.fire.z.s1.reg.TotalIndLastFive,inhFlp.fire.z.s1.reg.ProbIndLastFive); % calculate correlation
inhFlp.fire.z.s1.reg.IndLastFiveR2 = rho*rho; % get the R2 value (correlation coefficient)
inhFlp.fire.z.s1.reg.IndLastFiveP = pval; % get the p value for the correlation coefficient
clear rho pval a;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scatter plots for simultaneous regression %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; 

% InhSus Total v. Probability First Five

subplot (2,2,1);
zzMin = min(inhSus.fire.z.s1.reg.TotalCombFirstFive);
zzMax = max(inhSus.fire.z.s1.reg.TotalCombFirstFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.s1.reg.TotalCombFirstFive,inhSus.fire.z.s1.reg.ProbCombFirstFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhSus Total v Probability')
h = scatter(inhSus.fire.z.s1.reg.TotalCombFirstFive,inhSus.fire.z.s1.reg.ProbCombFirstFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta First Five','fontsize',10);
ylabel('Prob Beta First Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% InhSus Total v. Probability Last Five

subplot (2,2,2);
zzMin = min(inhSus.fire.z.s1.reg.TotalCombLastFive);
zzMax = max(inhSus.fire.z.s1.reg.TotalCombLastFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.s1.reg.TotalCombLastFive,inhSus.fire.z.s1.reg.ProbCombLastFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhSus Total v Probability')
h = scatter(inhSus.fire.z.s1.reg.TotalCombLastFive,inhSus.fire.z.s1.reg.ProbCombLastFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta Last Five','fontsize',10);
ylabel('Prob Beta Last Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% InhFlp Total v. Probability First Five

subplot (2,2,3);
zzMin = min(inhFlp.fire.z.s1.reg.TotalCombFirstFive);
zzMax = max(inhFlp.fire.z.s1.reg.TotalCombFirstFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.s1.reg.TotalCombFirstFive,inhFlp.fire.z.s1.reg.ProbCombFirstFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhFlp Total v Probability')
h = scatter(inhFlp.fire.z.s1.reg.TotalCombFirstFive,inhFlp.fire.z.s1.reg.ProbCombFirstFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta First Five','fontsize',10);
ylabel('Prob Beta First Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% InhSus Total v. Probability Last Five

subplot (2,2,4);
zzMin = min(inhFlp.fire.z.s1.reg.TotalCombLastFive);
zzMax = max(inhFlp.fire.z.s1.reg.TotalCombLastFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.s1.reg.TotalCombLastFive,inhFlp.fire.z.s1.reg.ProbCombLastFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhFlp Total v Probability')
h = scatter(inhFlp.fire.z.s1.reg.TotalCombLastFive,inhFlp.fire.z.s1.reg.ProbCombLastFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta Last Five','fontsize',10);
ylabel('Prob Beta Last Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

set(gcf,'Position',[180 200 600 600]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scatter plots for individual regression %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; 

% InhSus Total v. Probability First Five

subplot (2,2,1);
zzMin = min(inhSus.fire.z.s1.reg.TotalIndFirstFive);
zzMax = max(inhSus.fire.z.s1.reg.TotalIndFirstFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.s1.reg.TotalIndFirstFive,inhSus.fire.z.s1.reg.ProbIndFirstFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhSus Total v Probability')
h = scatter(inhSus.fire.z.s1.reg.TotalIndFirstFive,inhSus.fire.z.s1.reg.ProbIndFirstFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta First Five','fontsize',10);
ylabel('Prob Beta First Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% InhSus Total v. Probability Last Five

subplot (2,2,2);
zzMin = min(inhSus.fire.z.s1.reg.TotalIndLastFive);
zzMax = max(inhSus.fire.z.s1.reg.TotalIndLastFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhSus.fire.z.s1.reg.TotalIndLastFive,inhSus.fire.z.s1.reg.ProbIndLastFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhSus Total v Probability')
h = scatter(inhSus.fire.z.s1.reg.TotalIndLastFive,inhSus.fire.z.s1.reg.ProbIndLastFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta Last Five','fontsize',10);
ylabel('Prob Beta Last Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% InhFlp Total v. Probability First Five

subplot (2,2,3);
zzMin = min(inhFlp.fire.z.s1.reg.TotalIndFirstFive);
zzMax = max(inhFlp.fire.z.s1.reg.TotalIndFirstFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.s1.reg.TotalIndFirstFive,inhFlp.fire.z.s1.reg.ProbIndFirstFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhFlp Total v Probability')
h = scatter(inhFlp.fire.z.s1.reg.TotalIndFirstFive,inhFlp.fire.z.s1.reg.ProbIndFirstFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta First Five','fontsize',10);
ylabel('Prob Beta First Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

% InhSus Total v. Probability Last Five

subplot (2,2,4);
zzMin = min(inhFlp.fire.z.s1.reg.TotalIndLastFive);
zzMax = max(inhFlp.fire.z.s1.reg.TotalIndLastFive);
zz = zzMin:zzMax-zzMin:zzMax;
p = polyfit(inhFlp.fire.z.s1.reg.TotalIndLastFive,inhFlp.fire.z.s1.reg.ProbIndLastFive,1);
f = polyval(p,zz);
hold on;
box off;
title ('inhFlp Total v Probability')
h = scatter(inhFlp.fire.z.s1.reg.TotalIndLastFive,inhFlp.fire.z.s1.reg.ProbIndLastFive,100);
set(h,'MarkerFaceColor','none');
set(h,'MarkerEdgeColor','b');
set(h,'LineWidth',1);
axis([-2 2 -2 2]);
set(gca,'XTick',-2:1:2);
set(gca,'XTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
set(gca,'YTick',-2:1:2);
set(gca,'YTickLabel',{'-2','-1','0','1','2'},'fontsize',10);
xlabel('Total Beta Last Five','fontsize',10);
ylabel('Prob Beta Last Five','fontsize',10);
vline(0,'k');
hold on;
hline(0,'k');
hold on;
h = plot(zz,f);
set(h,'Color','k');
set(h,'linewidth',1);
clear h ii pos x y;

set(gcf,'Position',[800 200 600 600]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Line graphs for regression %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;

subplot (1,2,1);

axis([1 14 -1.00 1.00]);
x = [1:14;1:14];
error = [inhFlp.fire.z.s1.reg.TotalCombSEM;...
        inhFlp.fire.z.s1.reg.ProbCombSEM];                    
y = [inhFlp.fire.z.s1.reg.TotalCombMean;...
    inhFlp.fire.z.s1.reg.ProbCombMean];

hline(0,'k');
hold on;
vline(2.5,'k');
hold on;
vline(12.5,'k');
hold on;
h = errorbar(x',y',error');
axis([1 14 -1.00 1.00]);
set(h,'linewidth',2);
set(h(1),'Color',[0.2 0.6 0.4]); %total/greendrk
set(h(2),'Color',[1.0 0.6 0.8]); %probability/pink 
hold on;
h = plot(x',y');
hold on;
set(h,'linewidth',2);
set(h,'markersize',8);
set(h(1),'Color',[0.2 0.6 0.4]); %total/greendrk
set(h(2),'Color',[1.0 0.6 0.8]); %probability/pink 
set(h(1),'MarkerFaceColor',[0.6 0.0 0.4]); %total/maroon 
set(h(2),'MarkerFaceColor',[1.0 0.6 0.8]); %probability/pink 
set(gca,'XTick',1:1:15);
set(gca,'XTickLabel',{'-2','-1','1','2','3','4','5','6','7','8','9','10','11','12'},'fontsize',9);
set(gca,'YTick',-1:0.5:1);
set(gca,'YTickLabel',{'-1.00','-0.50','0.00','0.50','1.00'},'fontsize',9);
box off;
hold on;
axis([1 14 -1.00 1.00]);
hold on;
title('Flip: Total v Probability','fontsize',9);
xlabel('Interval (s)','fontsize',9);
ylabel('Beta Coefficient','fontsize',9);
set(gcf,'Position',[700 325 750 202]);

subplot (1,2,2);

axis([1 14 -1.00 1.00]);
x = [1:14;1:14];
error = [inhSus.fire.z.s1.reg.TotalCombSEM;...
        inhSus.fire.z.s1.reg.ProbCombSEM];                    
y = [inhSus.fire.z.s1.reg.TotalCombMean;...
    inhSus.fire.z.s1.reg.ProbCombMean];

hline(0,'k');
hold on;
vline(2.5,'k');
hold on;
vline(12.5,'k');
hold on;
h = errorbar(x',y',error');
axis([1 14 -1.00 1.00]);
set(h,'linewidth',2);
set(h(1),'Color',[0.2 0.6 0.4]); %total/greendrk
set(h(2),'Color',[1.0 0.6 0.8]); %probability/pink 
hold on;
h = plot(x',y');
hold on;
set(h,'linewidth',2);
set(h,'markersize',8);
set(h(1),'Color',[0.2 0.6 0.4]); %total/greendrk
set(h(2),'Color',[1.0 0.6 0.8]); %probability/pink 
set(h(1),'MarkerFaceColor',[0.6 0.0 0.4]); %total/maroon 
set(h(2),'MarkerFaceColor',[1.0 0.6 0.8]); %probability/pink 
set(gca,'XTick',1:1:15);
set(gca,'XTickLabel',{'-2','-1','1','2','3','4','5','6','7','8','9','10','11','12'},'fontsize',9);
set(gca,'YTick',-1:0.5:1);
set(gca,'YTickLabel',{'-1.00','-0.50','0.00','0.50','1.00'},'fontsize',9);
box off;
hold on;
axis([1 14 -1.00 1.00]);
hold on;
title('Sustain: Total v Probability','fontsize',9);
xlabel('Interval (s)','fontsize',9);
ylabel('Beta Coefficient','fontsize',9);
set(gcf,'Position',[700 325 750 202]);

clearvars -except inhSus inhFlp vlPAGcube;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Single-unit regression for threat tuning %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

regBlank = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]; % must be first regression term
regProb = [1;1;1;1;1;1;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0;0;0;0;0;0;0;0;0;0]; % shock probability

reg0 = [1;1;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
reg1 = [1;1;1;1;1;1;0;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125;0;0;0;0;0;0;0;0;0;0];
reg2 = [1;1;1;1;1;1;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0;0;0;0;0;0;0;0;0;0];
reg3 = [1;1;1;1;1;1;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0.375;0;0;0;0;0;0;0;0;0;0];
reg4 = [1;1;1;1;1;1;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0;0;0;0;0;0;0;0;0;0];
reg5 = [1;1;1;1;1;1;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0.625;0;0;0;0;0;0;0;0;0;0];
reg6 = [1;1;1;1;1;1;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0.75;0;0;0;0;0;0;0;0;0;0];
reg7 = [1;1;1;1;1;1;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0.875;0;0;0;0;0;0;0;0;0;0];
reg8 = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;0;0;0;0;0];

for ii = 1:size(inhFlp.tag,3)
   
    for kk = 1:10
    
    regData(:,:,ii) = inhFlp.fire.z.s1.interval(:,kk+20,ii);
    regTotal = inhFlp.cer.cue(:,1,ii);
    
    regCueTerms = [regBlank,regTotal,reg0];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,1) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg1];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,2) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg2];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,3) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg3];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,4) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg4];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,5) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg5];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,6) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg6];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,7) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg7];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,8) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg8];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhFlp.fire.z.s1.regTune(ii,kk,9) = b(3,1);
    
    end
    
end

inhFlp.fire.z.s1.regTuneBin = mean(inhFlp.fire.z.s1.regTune,1);
inhFlp.fire.z.s1.regTuneBin = reshape(inhFlp.fire.z.s1.regTuneBin,[10,9]);
inhFlp.fire.z.s1.regTuneBin = inhFlp.fire.z.s1.regTuneBin';

inhFlp.fire.z.s1.regTuneFirstHalf = inhFlp.fire.z.s1.regTune(:,1:5,:);
inhFlp.fire.z.s1.regTuneSecondHalf = inhFlp.fire.z.s1.regTune(:,6:10,:);

inhFlp.fire.z.s1.regTuneFirstHalfMean = mean(inhFlp.fire.z.s1.regTuneFirstHalf);
inhFlp.fire.z.s1.regTuneSecondHalfMean = mean(inhFlp.fire.z.s1.regTuneSecondHalf);

inhFlp.fire.z.s1.regTuneFirstHalfMean = reshape(inhFlp.fire.z.s1.regTuneFirstHalfMean,[5,9]);
inhFlp.fire.z.s1.regTuneSecondHalfMean = reshape(inhFlp.fire.z.s1.regTuneSecondHalfMean,[5,9]);

inhFlp.fire.z.s1.regTuneFirstHalfMeanInd = mean(inhFlp.fire.z.s1.regTuneFirstHalf,2);
inhFlp.fire.z.s1.regTuneSecondHalfMeanInd = mean(inhFlp.fire.z.s1.regTuneSecondHalf,2);
inhFlp.fire.z.s1.regTuneFirstHalfMeanInd = reshape(inhFlp.fire.z.s1.regTuneFirstHalfMeanInd,[size(inhFlp.tag,3),9]);
inhFlp.fire.z.s1.regTuneSecondHalfMeanInd = reshape(inhFlp.fire.z.s1.regTuneSecondHalfMeanInd,[size(inhFlp.tag,3),9]);

inhFlp.fire.z.s1.regTuneFirstHalfMeanG = mean(inhFlp.fire.z.s1.regTuneFirstHalfMeanInd);
inhFlp.fire.z.s1.regTuneSecondHalfMeanG = mean(inhFlp.fire.z.s1.regTuneSecondHalfMeanInd);
inhFlp.fire.z.s1.regTuneFirstHalfSEMG = std(inhFlp.fire.z.s1.regTuneSecondHalfMeanInd)/sqrt((size(inhFlp.tag,3)-1));
inhFlp.fire.z.s1.regTuneSecondHalfSEMG = std(inhFlp.fire.z.s1.regTuneSecondHalfMeanInd)/sqrt((size(inhFlp.tag,3)-1));

for ii = 1:size(inhSus.tag,3)
   
    for kk = 1:10
    
    regData(:,:,ii) = inhSus.fire.z.s1.interval(:,kk+20,ii);
    regTotal = inhSus.cer.cue(:,1,ii);
    
    regCueTerms = [regBlank,regTotal,reg0];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,1) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg1];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,2) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg2];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,3) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg3];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,4) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg4];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,5) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg5];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,6) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg6];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,7) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg7];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,8) = b(3,1);
    
    regCueTerms = [regBlank,regTotal,reg8];
    [b,~,~,~,~] = regress(regData(:,:,ii),regCueTerms);
    inhSus.fire.z.s1.regTune(ii,kk,9) = b(3,1);
    
    end
    
end

inhSus.fire.z.s1.regTuneBin = mean(inhSus.fire.z.s1.regTune,1);
inhSus.fire.z.s1.regTuneBin = reshape(inhSus.fire.z.s1.regTuneBin,[10,9]);
inhSus.fire.z.s1.regTuneBin = inhSus.fire.z.s1.regTuneBin';

inhSus.fire.z.s1.regTuneFirstHalf = inhSus.fire.z.s1.regTune(:,1:5,:);
inhSus.fire.z.s1.regTuneSecondHalf = inhSus.fire.z.s1.regTune(:,6:10,:);

inhSus.fire.z.s1.regTuneFirstHalfMean = mean(inhSus.fire.z.s1.regTuneFirstHalf);
inhSus.fire.z.s1.regTuneSecondHalfMean = mean(inhSus.fire.z.s1.regTuneSecondHalf);

inhSus.fire.z.s1.regTuneFirstHalfMean = reshape(inhSus.fire.z.s1.regTuneFirstHalfMean,[5,9]);
inhSus.fire.z.s1.regTuneSecondHalfMean = reshape(inhSus.fire.z.s1.regTuneSecondHalfMean,[5,9]);

inhSus.fire.z.s1.regTuneFirstHalfMeanInd = mean(inhSus.fire.z.s1.regTuneFirstHalf,2);
inhSus.fire.z.s1.regTuneSecondHalfMeanInd = mean(inhSus.fire.z.s1.regTuneSecondHalf,2);
inhSus.fire.z.s1.regTuneFirstHalfMeanInd = reshape(inhSus.fire.z.s1.regTuneFirstHalfMeanInd,[size(inhSus.tag,3),9]);
inhSus.fire.z.s1.regTuneSecondHalfMeanInd = reshape(inhSus.fire.z.s1.regTuneSecondHalfMeanInd,[size(inhSus.tag,3),9]);

inhSus.fire.z.s1.regTuneFirstHalfMeanG = mean(inhSus.fire.z.s1.regTuneFirstHalfMeanInd);
inhSus.fire.z.s1.regTuneSecondHalfMeanG = mean(inhSus.fire.z.s1.regTuneSecondHalfMeanInd);
inhSus.fire.z.s1.regTuneFirstHalfSEMG = std(inhSus.fire.z.s1.regTuneSecondHalfMeanInd)/sqrt((size(inhSus.tag,3)-1));
inhSus.fire.z.s1.regTuneSecondHalfSEMG = std(inhSus.fire.z.s1.regTuneSecondHalfMeanInd)/sqrt((size(inhSus.tag,3)-1));

%%%%%%%%%%%%%%%%%%%%%%%%
% Threat tuning figure %
%%%%%%%%%%%%%%%%%%%%%%%%

figure;

subplot(2,2,1)

y = [inhFlp.fire.z.s1.regTuneFirstHalfMeanG;inhFlp.fire.z.s1.regTuneSecondHalfMeanG]; 
yErr = [inhFlp.fire.z.s1.regTuneFirstHalfSEMG;inhFlp.fire.z.s1.regTuneSecondHalfSEMG]; 

axis([0.5 9.5 -0.55 0.55]);
hline(0,'k');
hold on;
h = plot(y');
set(h,'LineWidth',1);
set(gca,'XTick',1:1:9);
set(h(1),'Color',[1.0 0.6 0.8]);
set(h(2),'Color',[1.0 0.6 0.2]);
set(gca,'XTickLabel',{'0.000','0.125','0.250','0.375','0.500','0.625','0.750','0.875','1.000'},'fontsize',8);
set(gca,'XTickLabelRotation',45)
axis([0.5 9.5 -0.55 0.55]);
set(gca,'YTick',-0.5:0.5:2);
set(gca,'YTickLabel',{'-0.5','0.0','0.5','1.0','1.5','2.0'},'fontsize',8);
xlabel('Uncertainty Assignment','fontsize',12);
ylabel('Beta Coefficient','fontsize',12);
hold on;
vline(4,'k');
hold on;
vline(6.379,'g');
box off;

subplot(2,2,2)

y = [inhSus.fire.z.s1.regTuneFirstHalfMeanG;inhSus.fire.z.s1.regTuneSecondHalfMeanG];
yErr = [inhSus.fire.z.s1.regTuneFirstHalfSEMG;inhSus.fire.z.s1.regTuneSecondHalfSEMG]; 

axis([0.5 9.5 -0.55 0.55]);
hline(0,'k');
hold on;
h = plot(y');
set(h,'LineWidth',1);
set(h(1),'Color',[1.0 0.6 0.8]);
set(h(2),'Color',[1.0 0.6 0.2]);
set(gca,'XTick',1:1:9);
set(gca,'XTickLabel',{'0.000','0.125','0.250','0.375','0.500','0.625','0.750','0.875','1.000'},'fontsize',8);
set(gca,'XTickLabelRotation',45)
axis([0.5 9.5 -0.55 0.55]);
set(gca,'YTick',-0.5:0.5:2);
set(gca,'YTickLabel',{'-0.5','0.0','0.5','1.0','1.5','2.0'},'fontsize',8);
xlabel('Uncertainty Assignment','fontsize',12);
ylabel('Beta Coefficient','fontsize',12);
hold on;
vline(4,'k');
hold on;
vline(7.008,'g');
box off;

set(gcf,'Position',[1250 300 500 500]);

%%%%%%%%%
%HEATMAP%
%%%%%%%%%

FlpHeat = [inhFlp.fire.z.s1.cue100(:,19:32),inhFlp.fire.z.s1.cuePR(:,19:32),inhFlp.fire.z.s1.cue0(:,19:32),mean(inhFlp.fire.z.s1.cue100(:,26:30),2)];
SusHeat = [inhSus.fire.z.s1.cue100(:,19:32),inhSus.fire.z.s1.cuePR(:,19:32),inhSus.fire.z.s1.cue0(:,19:32),mean(inhSus.fire.z.s1.cue100(:,26:30),2)];

FlpHeat = sortrows(FlpHeat,43);
SusHeat = sortrows(SusHeat,43);
SusHeat = flipud(SusHeat);

FlpSusHeat = [FlpHeat;SusHeat];

dangerAll = FlpSusHeat(:,1:14);
uncertaintyAll = FlpSusHeat(:,15:28);
safetyAll = FlpSusHeat(:,29:42);

figure;

load('vik.mat');

subplot (1,3,1)
FlpSusHeatlims = [-1 1];
imagesc(dangerAll,FlpSusHeatlims);
hold on;
vline(2.5,'w');
hold on;
vline(12.5,'w');
hold on;
hline(45.5,'w');
hold on;
colormap(vik);
colorbar;

subplot (1,3,2)
FlpSusHeatlims = [-1 1];
imagesc(uncertaintyAll,FlpSusHeatlims);
hold on;
vline(2.5,'w');
hold on;
vline(12.5,'w');
hold on;
hline(45.5,'w');
hold on;
colorbar;

subplot (1,3,3)
FlpSusHeatlims = [-1 1];
imagesc(safetyAll,FlpSusHeatlims);
hold on;
vline(2.5,'w');
hold on;
vline(12.5,'w');
hold on;
hline(45.5,'w');
hold on;
colorbar;
set(gcf,'Position',[300 300 600 600]);

%%%%%%%%%%%%%%
%TrialbyTrial%
%%%%%%%%%%%%%%

a = mean(inhFlp.fire.z.s1.interval,3); %collapse across all neurons in Z plane

inhFlp.fire.z.s1.cue100tbt = a(1:6,19:32);
inhFlp.fire.z.s1.cueSPRtbt = a(7:12,19:32);
inhFlp.fire.z.s1.cueNsPRtbt = a(13:22,19:32);
inhFlp.fire.z.s1.cue0tbt = a(23:32,19:32);

inhFlp.fire.z.s1.cue100tbtMeanB  = mean(inhFlp.fire.z.s1.cue100tbt(:,1:2),2);
inhFlp.fire.z.s1.cue100tbtMeanF5 = mean(inhFlp.fire.z.s1.cue100tbt(:,3:7),2);
inhFlp.fire.z.s1.cue100tbtMeanL5 = mean(inhFlp.fire.z.s1.cue100tbt(:,8:12),2);

inhFlp.fire.z.s1.cueSPRtbtMeanB  = mean(inhFlp.fire.z.s1.cueSPRtbt(:,1:2),2);
inhFlp.fire.z.s1.cueSPRtbtMeanF5 = mean(inhFlp.fire.z.s1.cueSPRtbt(:,3:7),2);
inhFlp.fire.z.s1.cueSPRtbtMeanL5 = mean(inhFlp.fire.z.s1.cueSPRtbt(:,8:12),2);

inhFlp.fire.z.s1.cueNsPRtbtMeanB  = mean(inhFlp.fire.z.s1.cueNsPRtbt(:,1:2),2);
inhFlp.fire.z.s1.cueNsPRtbtMeanF5 = mean(inhFlp.fire.z.s1.cueNsPRtbt(:,3:7),2);
inhFlp.fire.z.s1.cueNsPRtbtMeanL5 = mean(inhFlp.fire.z.s1.cueNsPRtbt(:,8:12),2);

inhFlp.fire.z.s1.cue0tbtMeanB  = mean(inhFlp.fire.z.s1.cue0tbt(:,1:2),2);
inhFlp.fire.z.s1.cue0tbtMeanF5 = mean(inhFlp.fire.z.s1.cue0tbt(:,3:7),2);
inhFlp.fire.z.s1.cue0tbtMeanL5 = mean(inhFlp.fire.z.s1.cue0tbt(:,8:12),2);

b = mean(inhSus.fire.z.s1.interval,3); %collapse across all neurons in Z plane

inhSus.fire.z.s1.cue100tbt = b(1:6,19:32);
inhSus.fire.z.s1.cueSPRtbt = b(7:12,19:32);
inhSus.fire.z.s1.cueNsPRtbt = b(13:22,19:32);
inhSus.fire.z.s1.cue0tbt = b(23:32,19:32);

inhSus.fire.z.s1.cue100tbtMeanB  = mean(inhSus.fire.z.s1.cue100tbt(:,1:2),2);
inhSus.fire.z.s1.cue100tbtMeanF5 = mean(inhSus.fire.z.s1.cue100tbt(:,3:7),2);
inhSus.fire.z.s1.cue100tbtMeanL5 = mean(inhSus.fire.z.s1.cue100tbt(:,8:12),2);

inhSus.fire.z.s1.cueSPRtbtMeanB  = mean(inhSus.fire.z.s1.cueSPRtbt(:,1:2),2);
inhSus.fire.z.s1.cueSPRtbtMeanF5 = mean(inhSus.fire.z.s1.cueSPRtbt(:,3:7),2);
inhSus.fire.z.s1.cueSPRtbtMeanL5 = mean(inhSus.fire.z.s1.cueSPRtbt(:,8:12),2);

inhSus.fire.z.s1.cueNsPRtbtMeanB  = mean(inhSus.fire.z.s1.cueNsPRtbt(:,1:2),2);
inhSus.fire.z.s1.cueNsPRtbtMeanF5 = mean(inhSus.fire.z.s1.cueNsPRtbt(:,3:7),2);
inhSus.fire.z.s1.cueNsPRtbtMeanL5 = mean(inhSus.fire.z.s1.cueNsPRtbt(:,8:12),2);

inhSus.fire.z.s1.cue0tbtMeanB  = mean(inhSus.fire.z.s1.cue0tbt(:,1:2),2);
inhSus.fire.z.s1.cue0tbtMeanF5 = mean(inhSus.fire.z.s1.cue0tbt(:,3:7),2);
inhSus.fire.z.s1.cue0tbtMeanL5 = mean(inhSus.fire.z.s1.cue0tbt(:,8:12),2);

figure;

subplot(4,12,1:2) %Flp100tbtLineGraph

y = inhFlp.fire.z.s1.cue100tbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0 0]);
set(h(2),'Color',[.9 0 0]);
set(h(3),'Color',[.8 0 0]);
set(h(4),'Color',[.7 0 0]);
set(h(5),'Color',[.6 0 0]);
set(h(6),'Color',[.5 0 0]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,3:4) %Flp100tbtFirstFive

y1 = [inhFlp.fire.z.s1.cue100tbtMeanF5,...
      inhFlp.fire.z.s1.cue100tbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 0.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
title('inhFlp','fontsize',12);
g = subplot(4,12,3:4);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,5:6) %Flp100tbtLastFive

y1 = [inhFlp.fire.z.s1.cue100tbtMeanL5,...
      inhFlp.fire.z.s1.cue100tbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 0.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,5:6);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,7:8) %Sus100tbtLineGraph

y = inhSus.fire.z.s1.cue100tbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0 0]);
set(h(2),'Color',[.9 0 0]);
set(h(3),'Color',[.8 0 0]);
set(h(4),'Color',[.7 0 0]);
set(h(5),'Color',[.6 0 0]);
set(h(6),'Color',[.5 0 0]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,9:10) %Sus100tbtFirstFive

y1 = [inhSus.fire.z.s1.cue100tbtMeanF5,...
      inhSus.fire.z.s1.cue100tbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 0.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
title('inhSus','fontsize',12);
g = subplot(4,12,9:10);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,11:12) %Sus100tbtLastFive

y1 = [inhSus.fire.z.s1.cue100tbtMeanL5,...
      inhSus.fire.z.s1.cue100tbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 0.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,11:12);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);


subplot(4,12,13:14) %FlpSPRtbtLineGraph

y = inhFlp.fire.z.s1.cueSPRtbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[.95 0.0 .95]);
set(h(3),'Color',[0.9 0.0 0.9]);
set(h(4),'Color',[.85 0.0 .85]);
set(h(5),'Color',[0.8 0.0 0.8]);
set(h(6),'Color',[.75 0.0 .75]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,15:16) %FlpSPRtbtFirstFive

y1 = [inhFlp.fire.z.s1.cueSPRtbtMeanF5,...
      inhFlp.fire.z.s1.cueSPRtbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,15:16);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,17:18) %FlpSPRtbtLastFive

y1 = [inhFlp.fire.z.s1.cueSPRtbtMeanL5,...
      inhFlp.fire.z.s1.cueSPRtbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,17:18);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,19:20) %SusSPRtbtLineGraph

y = inhSus.fire.z.s1.cueSPRtbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[.95 0.0 .95]);
set(h(3),'Color',[0.9 0.0 0.9]);
set(h(4),'Color',[.85 0.0 .85]);
set(h(5),'Color',[0.8 0.0 0.8]);
set(h(6),'Color',[.75 0.0 .75]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,21:22) %SusSPRtbtFirstFive

y1 = [inhSus.fire.z.s1.cueSPRtbtMeanF5,...
      inhSus.fire.z.s1.cueSPRtbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,21:22);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,23:24) %SusSPRtbtLastFive

y1 = [inhSus.fire.z.s1.cueSPRtbtMeanL5,...
      inhSus.fire.z.s1.cueSPRtbtMeanB];

axis([0.25 6.75 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:7);
set(gca,'XTickLabel',{'1','2','3','4','5','6'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,23:24);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.25 6.75 -1.25 1.25]);

subplot(4,12,25:26) %FlpNsPRtbtLineGraph

y = inhFlp.fire.z.s1.cueNsPRtbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0 1.0]);
set(h(2),'Color',[.95 0 .95]);
set(h(3),'Color',[.9 0 .9]);
set(h(4),'Color',[.85 0 .85]);
set(h(5),'Color',[.8 0 .8]);
set(h(6),'Color',[.75 0 .75]);
set(h(7),'Color',[.7 0 .7]);
set(h(8),'Color',[.65 0 .65]);
set(h(9),'Color',[.6 0 .6]);
set(h(10),'Color',[.55 0 .55]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,27:28) %FlpNsPRtbtFirstFive

y1 = [inhFlp.fire.z.s1.cueNsPRtbtMeanF5,...
      inhFlp.fire.z.s1.cueNsPRtbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,27:28);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

subplot(4,12,29:30) %FlpNsPRtbtLastFive

y1 = [inhFlp.fire.z.s1.cueNsPRtbtMeanL5,...
      inhFlp.fire.z.s1.cueNsPRtbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,29:30);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

subplot(4,12,31:32) %SusNsPRtbtLineGraph

y = inhSus.fire.z.s1.cueNsPRtbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0 1.0]);
set(h(2),'Color',[.95 0 .95]);
set(h(3),'Color',[.9 0 .9]);
set(h(4),'Color',[.85 0 .85]);
set(h(5),'Color',[.8 0 .8]);
set(h(6),'Color',[.75 0 .75]);
set(h(7),'Color',[.7 0 .7]);
set(h(8),'Color',[.65 0 .65]);
set(h(9),'Color',[.6 0 .6]);
set(h(10),'Color',[.55 0 .55]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,33:34) %SusNsPRtbtFirstFive

y1 = [inhSus.fire.z.s1.cueNsPRtbtMeanF5,...
      inhSus.fire.z.s1.cueNsPRtbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,33:34);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

subplot(4,12,35:36) %SusNsPRtbtLastFive

y1 = [inhSus.fire.z.s1.cueNsPRtbtMeanL5,...
      inhSus.fire.z.s1.cueNsPRtbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[1.0 0.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,35:36);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

subplot(4,12,37:38) %Flp0tbtLineGraph

y = inhFlp.fire.z.s1.cue0tbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[0.0 1.0 1.0]);
set(h(2),'Color',[0.0 .95 .95]);
set(h(3),'Color',[0.0 0.9 0.9]);
set(h(4),'Color',[0.0 .85 .85]);
set(h(5),'Color',[0.0 0.8 0.8]);
set(h(6),'Color',[0.0 .75 .75]);
set(h(7),'Color',[0.0 0.7 0.7]);
set(h(8),'Color',[0.0 .65 .65]);
set(h(9),'Color',[0.0 0.6 0.6]);
set(h(10),'Color',[0.0 .55 .55]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,39:40) %Flp0tbtFirstFive

y1 = [inhFlp.fire.z.s1.cue0tbtMeanF5,...
      inhFlp.fire.z.s1.cue0tbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[0.0 1.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,39:40);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

subplot(4,12,41:42) %Flp0tbtLastFive

y1 = [inhFlp.fire.z.s1.cue0tbtMeanL5,...
      inhFlp.fire.z.s1.cue0tbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[0.0 1.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,41:42);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);


subplot(4,12,43:44) %Sus0tbtLineGraph

y = inhSus.fire.z.s1.cue0tbt;

axis([1 14 -1.25 1.25]);
vline(2,'k');
hold on;
vline(12,'k');
hold on;
hline(0,'k');
hold on;
h = plot(y');
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[0.0 1.0 1.0]);
set(h(2),'Color',[0.0 .95 .95]);
set(h(3),'Color',[0.0 0.9 0.9]);
set(h(4),'Color',[0.0 .85 .85]);
set(h(5),'Color',[0.0 0.8 0.8]);
set(h(6),'Color',[0.0 .75 .75]);
set(h(7),'Color',[0.0 0.7 0.7]);
set(h(8),'Color',[0.0 .65 .65]);
set(h(9),'Color',[0.0 0.6 0.6]);
set(h(10),'Color',[0.0 .55 .55]);
set(gca,'XTick',1:1:14);
set(gca,'XTickLabel',{'','0','','2','','4','','6','','8','','10','','12'},'fontsize',12);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'},'fontsize',12);
box off;
hold on;
axis([1 14 -1.25 1.25]);
hold on;
ylabel('Hz','fontsize',12);
xlabel('Time from Cue Onset (s)','fontsize',12);
set(gcf,'Position',[1350 200 1150 850]);

subplot(4,12,45:46) %Sus0tbtFirstFive

y1 = [inhSus.fire.z.s1.cue0tbtMeanF5,...
      inhSus.fire.z.s1.cue0tbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[0.0 1.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,45:46);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

subplot(4,12,47:48) %Sus0tbtLastFive

y1 = [inhSus.fire.z.s1.cue0tbtMeanL5,...
      inhSus.fire.z.s1.cue0tbtMeanB];

axis([0.1 10.9 -1.25 1.25]);
hline(0,'k');
hold on;
h = plot(y1);
set(h(1),'Color',[0.0 1.0 1.0]);
set(h(2),'Color',[0.8 0.8 0.8]);
set(h,'marker','o');
set(h,'markersize',10);
set(h,'linestyle','none');
set(gca,'XTick',1:1:11);
set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10'},'fontsize',12);
box off;
hold on;
g = subplot(4,12,47:48);
p = get(g,'position');
p(3) = p(3)*.8;
set(g,'position', p);
xlabel('Trial #','fontsize',12);
axis([0.1 10.9 -1.25 1.25]);

set(gcf,'Position',[1350 200 1150 850]);


%%%%%%%%%%%
%PIE CHART%
%%%%%%%%%%%
% onsetnumber = 29
% rampingnumber = 14
% flipnumber = 45
% sustainnumber = 46
% noncuenumber = 111

typetotals = [29 14 45 46 111];

figure;
explode = [1 1 1 1 0];
labels = {'Onset: 12%','Ramping: 6%','Flip: 18%','Sustain: 19%','Non-Cue-Responsive: 45%'};
pie(typetotals, labels);
title('Neuron Types','fontsize',12);
colormap([1.0 0.8 0.6
          0.6 0.0 0.0
          0.6 0.6 0.8
          0.2 0.8 0.8
          0.8 0.8 0.8])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POST CUE/SHOCK Population Line Graphs 100ms Bins %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; %Figure 2A - Sustain Population Line Graph 100ms bins

subplot (2,1,1); %Figure 2C - Flip Population Line Graph 100ms bins

x = 1:50;
y = [inhFlp.fire.z.ms100.cue100mean(1,301:350);...
     inhFlp.fire.z.ms100.cueSPRmean(1,301:350);...
     inhFlp.fire.z.ms100.cueNsPRmean(1,301:350);...
     inhFlp.fire.z.ms100.cue0mean(1,301:350)]; 
%variably to run for ANOVA below - NOT RIGHT NEEDS ADJUSTMENT
%  y = [inhFlp.fire.z.ms250.cue100(:,73:128),...
%       inhFlp.fire.z.ms250.cuePR(:,73:128),...
%       inhFlp.fire.z.ms250.cue0(:,73:128)];

title ({'Flip Population (n = 45)'},'fontsize',14)
axis([0.9 50 -1.1 1.1]);
hold on;
hline(0,'k');
hold on;
vline(20,'k');
hold on;
vline(120,'k');
hold on;
h = plot(x,y);
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0.2 0.2]);
set(h(2),'Color',[0.4 0.0 1.0]);
set(h(2),'Color',[0.4 0.0 1.0]);
set(h(3),'Color',[0.0 0.4 1.0]);
set(gca,'XTick',0:10:50);
set(gca,'XTickLabel',{'-2','-1','0','1','2','3'},'fontsize',14);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','-0.0','0.5','1.0'},'fontsize',14);
set(gca,'fontsize',14);
box off;
hold on;
axis([0.9 50 -1.1 1.1]);
hold on;
xlabel('Time from Shock Onset (s)','fontsize',16);
ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[200 400 250 790]);
clear h ii pos x y;

subplot (2,1,2);

x = 1:50;
y = [inhSus.fire.z.ms100.cue100mean(1,301:350);...
     inhSus.fire.z.ms100.cueSPRmean(1,301:350);...
     inhSus.fire.z.ms100.cueNsPRmean(1,301:350);...
     inhSus.fire.z.ms100.cue0mean(1,301:350)]; 
%variable to run for ANOVA below - NOT RIGHT NEEDS ADJUSTMENT
%  y = [inhSus.fire.z.ms250.cue100(:,73:128),...
%       inhSus.fire.z.ms250.cuePR(:,73:128),...
%       inhSus.fire.z.ms250.cue0(:,73:128)];
title ({'Sustain Population (n = 46)'},'fontsize',14)
axis([0.9 50 -1.1 1.1]);
hold on;
hline(0,'k');
hold on;
vline(20,'k');
hold on;
vline(120,'k');
hold on;
h = plot(x,y);
set(h,'linewidth',1.5);
set(h,'marker','none');
set(h,'markersize',10);
set(h(1),'Color',[1.0 0.2 0.2]);
set(h(2),'Color',[0.4 0.0 1.0]);
set(h(2),'Color',[0.4 0.0 1.0]);
set(h(3),'Color',[0.0 0.4 1.0]);
set(gca,'XTick',0:10:50);
set(gca,'XTickLabel',{'-2','-1','0','1','2','3'},'fontsize',14);
set(gca,'YTick',-1.0:0.5:1.0);
set(gca,'YTickLabel',{'-1.0','-0.5','-0.0','0.5','1.0'},'fontsize',14);
set(gca,'fontsize',14);
box off;
hold on;
axis([0.9 50 -1.1 1.1]);
hold on;
xlabel('Time from Shock Onset (s)','fontsize',16);
ylabel('Normalized Firing Rate','fontsize',14);
set(gcf,'Position',[200 400 250 600]);
clear h ii pos x y;

clearvars -except inhSus inhFlp vlPAGcube;