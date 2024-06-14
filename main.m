% This some sections will take longer time
% please run it section by section
%% Section I: Checkerboard model
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
fontsize = 12;
load checkerboard_map.mat
I=double(kron(checkerboard_map(1:2:100,1:2:100),ones(10)));
I_lr = I-0.5;
h = fspecial('gaussian',50,13);
ds = [h,-h;-h,h];
ds = ds / max(max(ds));
I_hr = kron(ones(5),ds) + 2.5;

min_lon = 0;
max_lon = 100;
min_lat = 0;
max_lat  = 100;
class_number=6;
potential=0.9;
maxIter=100;

checkerboard_overlap = I_lr;
checkerboard_overlap(151:350,151:350) = I_hr(151:350,151:350);

axes(ha(1));
%load checkerboard_seg.mat
seg=reshape(ICM(checkerboard_overlap,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(checkerboard_overlap,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('Initial model')

%% Example after 50 iterations:
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
beta = 0.3;  % Smoothness control parameter
num_iterations = 50;  % Number of iterations for smoothing

% Call the GMRF smoothing function
smoothed_model = pgm_smoothing(checkerboard_overlap, beta, num_iterations);

% Display the results
axes(ha(1));
%load checkerboard_seg.mat
seg=reshape(ICM(smoothed_model,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(smoothed_model,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('After 50 iterations')

%% Example after 500 iterations:
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
beta = 0.3;  % Smoothness control parameter
num_iterations = 500;  % Number of iterations for smoothing

% Call the GMRF smoothing function
smoothed_model = pgm_smoothing(checkerboard_overlap, beta, num_iterations);

% Display the results
axes(ha(1));
seg=reshape(ICM(smoothed_model,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(smoothed_model,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('After 500 iterations')

%% Example after 5000 iterations:
% This section might take longer time to run
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
beta = 0.3;  % Smoothness control parameter
num_iterations = 5000;  % Number of iterations for smoothing

% Call the GMRF smoothing function
smoothed_model = pgm_smoothing(checkerboard_overlap, beta, num_iterations);

% Display the results
axes(ha(1));
seg=reshape(ICM(smoothed_model,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(smoothed_model,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('After 5000 iterations')

%% Section II: Ridgecrest model

ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
fontsize = 12;
load 1Hz_map_smoothed.mat
load Ridgecrest_LR.mat
Ridgecrest_overlap = I_lr;
Ridgecrest_overlap(53:244,57:280) = pre1;

min_lon = 0;
max_lon = 100;
min_lat = 0;
max_lat  = 100;
class_number=6;
potential=0.9;
maxIter=100;

axes(ha(1));
seg=reshape(ICM(Ridgecrest_overlap,class_number,potential,maxIter), size(Ridgecrest_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [min_lat, max_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(Ridgecrest_overlap,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
set(gca,'clim',[1.5,3.5]);
title(c,'(km/s)')

sgtitle('Initial model')

%% Example after 50 iterations:
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
beta = 0.3;  % Smoothness control parameter
num_iterations = 50;  % Number of iterations for smoothing

% Call the GMRF smoothing function
smoothed_model = pgm_smoothing(Ridgecrest_overlap, beta, num_iterations);

% Display the results
axes(ha(1));
%load checkerboard_seg.mat
seg=reshape(ICM(smoothed_model,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(smoothed_model,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('After 50 iterations')

%% Example after 500 iterations:
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
beta = 0.3;  % Smoothness control parameter
num_iterations = 500;  % Number of iterations for smoothing

% Call the GMRF smoothing function
smoothed_model = pgm_smoothing(Ridgecrest_overlap, beta, num_iterations);

% Display the results
axes(ha(1));
seg=reshape(ICM(smoothed_model,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(smoothed_model,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('After 500 iterations')

%% Example after 5000 iterations:
% This section might take longer time to run
ha = tightPlots(1, 2, 24, [2 2], [1.0 0.8], [3 1.5], [2.5 3], 'centimeters');
beta = 0.3;  % Smoothness control parameter
num_iterations = 10000;  % Number of iterations for smoothing

% Call the GMRF smoothing function
smoothed_model = pgm_smoothing(Ridgecrest_overlap, beta, num_iterations);

% Display the results
axes(ha(1));
seg=reshape(ICM(smoothed_model,class_number,potential,maxIter), size(checkerboard_overlap));
imagesc(seg,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]);
set(gca,'colormap',flipud(gray));
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[0 50 100])
ylabel('South-North (km)');
xlabel('West-East (km)');
set(gca,'colormap',flipud(gray));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Discrete Label Map')

axes(ha(2));
imagesc(smoothed_model,'XData', [min_lon, max_lon], 'YData', [max_lat, min_lat]); hold on;
set(gca,'YDir','normal','FontSize', fontsize);
set(gca, 'xtick',0:50:100);
set(gca, 'ytick',0:50:100);
set(gca,'xticklabel',[0 50 100])
set(gca,'yticklabel',[])
xlabel('West-East (km)');
set(gca,'colormap',flipud(jet));
box on
set(gca,'FontSize',fontsize);
set(gca,'TickDir','out');
title(gca,'Continuous Velocity Map')
c = colorbar(gca);
set(c,'Position',[0.93 0.168 0.022 0.7])
colormap(c,'jet')
title(c,'(km/s)')

sgtitle('After 5000 iterations')