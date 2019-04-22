

function [CD209_bin_img] = Lvr_hist_analysis_Poon(segmented_img,darkfield_img,save_dir,sample_name);
    tic
shortfile = sample_name; 
display(['Processing ' shortfile])

%Assign segmented image and darkfield image
DF_file = darkfield_img;
seg_file = segmented_img;

%Define different tissue areass from images
bin_tissue = seg_file;
tissue_bin = bin_tissue>0;
seg_file(seg_file~=1) = 0;
seg_bin = seg_file>0;
noCD209area = tissue_bin - seg_bin;
DF_gray = DF_file(:,:,3);
NP_bin = threshold(DF_gray);

%%Erosion to more accurately define CD209+ areas
SE_erode_1 = strel('square',2); 
eroded_1 = imerode(seg_bin,SE_erode_1);
eroded_2 = imerode(eroded_1,SE_erode_1);
eroded_3 = imerode(eroded_2,SE_erode_1);

%Calculating area sizes 
CD209_area = sum(seg_bin(:));
CD209_area_erode_3 = sum(eroded_3(:));
noCD209area_erode_3 = tissue_bin - eroded_3;
Non_CD209_area = sum(noCD209area(:));
Non_CD209_area_erode_3 = sum(noCD209area_erode_3(:));
Tissue_area = sum(tissue_bin(:));

%%Calulations for percentage of CD209 positive and CD209 areas with
%%nanoparticles
NP_bin_CD209 = NP_bin.*seg_bin;
NP_bin_non_CD209 = NP_bin.*noCD209area;
NP_inCD209 = DF_gray.*uint8(seg_bin);
NP_innonCD209 = DF_gray.*uint8(noCD209area);

Pecnt_NP_pos_CD209_area = sum(NP_bin_CD209(:))/CD209_area*100;
Pecnt_NP_pos_non_CD209_area = sum(NP_bin_non_CD209(:))/Non_CD209_area*100;
CD209_mean_int = sum(NP_inCD209(:))/CD209_area;
nonCD209_mean_int = sum(NP_innonCD209(:))/Non_CD209_area;

%%Calculations with the CD209+ mask after erosion step
NP_bin_CD209_er3 = NP_bin.*eroded_3;
NP_bin_non_CD209_er3 = NP_bin.*noCD209area_erode_3;
NP_inCD209_er3 = DF_gray.*uint8(eroded_1);
NP_innonCD209_er3 = DF_gray.*uint8(noCD209area_erode_3);

%Output variabes 
Pecnt_NP_pos_CD209_area_er3 = sum(NP_bin_CD209_er3(:))/CD209_area_erode_3*100;
Pecnt_NP_pos_non_CD209_area_er3 = sum(NP_bin_non_CD209_er3(:))/Non_CD209_area_erode_3*100;
CD209_mean_int_er3 = sum(NP_inCD209_er3(:))/CD209_area_erode_3;
nonCD209_mean_int_er3 = sum(NP_innonCD209_er3(:))/Non_CD209_area_erode_3;
CD209_bin_img = eroded_3;

T = table(Pecnt_NP_pos_CD209_area,Pecnt_NP_pos_non_CD209_area,CD209_mean_int,nonCD209_mean_int,Pecnt_NP_pos_CD209_area_er3,Pecnt_NP_pos_non_CD209_area_er3,CD209_mean_int_er3,nonCD209_mean_int_er3);
table_name = strcat(shortfile,'_NP_stats_erode_analysis.csv');

%Writing files to defined save directory (save_dir)
cd(save_dir)
writetable(T,table_name)

erode_img_3_name = strcat(shortfile,'_erodeimg_3.tif');

imwrite(uint8(eroded_3),erode_img_3_name);

toc
