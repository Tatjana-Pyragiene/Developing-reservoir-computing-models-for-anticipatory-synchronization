%---------------------------------------------------------------------------
% readme_data_files.txt
%---------------------------------------------------------------------------
% Here we describe the way in which the data files are 
% produced, copied, and loaded;
%---------------------------------------------------------------------------
% The whole figure Fig.1 is plotted by function [Main_Roessler_Fig1.m]; 
%---------------------------------------------------------------------------
% All necessary data files for plotting are stored in the directory
% [\Fig1\Figure\Structure\];
%---------------------------------------------------------------------------
% The contents of data files are computed in three directories:
% [\Fig1\1_Fig1_Parameters\];
% [Fig1\2_Fig1_DynData\];
% [Fig1\3_Fig1_Statistics\];
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% [\Fig1\1_Fig1_Parameters\] -> in this directory we set the values of necessary 
% parameters, and put them in data files into directories
% [\Fig1\1_Fig1_Parameters\ParamStructure\] and [\Fig1\1_Fig1_Parameters\ParamDouble\];
% Directory [\ParamStructure\] will be used subsequently in computations;
% Directory [\ParamDouble\] is left for user to facilitate the visualization of 
% contents of the data files;
%---------------------------------------------------------------------------
% [\Fig1\2_Fig1_DynData\] -> in this directory we compute the dynamics which
% will be plotted in Fig.1(c,d); 
% Here we take the necessary parameters from directory 
% [\Fig1\2_Fig1_DynData\ParamStructure]; 
%--------------------------!!!NOTE!!!---------------------------------------
% The directory [\Fig1\2_Fig1_DynData\ParamStructure] is obtained by copying
% the contents from directory [\Fig1\1_Fig1_Parameters\ParamStructure\];
%---------------------------------------------------------------------------
% Correspondigly, the directory [\Fig1\2_Fig1_DynData\ParamDouble] is 
% obtained by copying the contents from directory 
% [\Fig1\1_Fig1_Parameters\ParamDouble\];
% This directory can be used by user for visualization of contents;
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% Directory [\Fig1\2_Fig1_DynData\DynStructure\] contains the data obtained by 
% computations of program [\Fig1\2_Fig1_DynData\Main_Rossler_Y_dyn.m];
%---------------------------------------------------------------------------
% Correspondingly, the directory [\Fig1\2_Fig1_DynData\DynDouble\] contains the
% same data as [\Fig1\2_Fig1_DynData\DynStructure\], but its contents can be 
% easily visualized;
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% Directory [\Fig1\3_Fig1_Statistics\Fig1a\StatStructure\] contains data file which
% is computed by the function 
% [\Fig1\3_Fig1_Statistics\Fig1a\Main_Roessler_Y_RMSEj\];
%---------------------------------------------------------------------------
% Directory [\Fig1\3_Fig1_Statistics\Fig1b\StatStructure\] contains data file which
% is computed by the function 
% [\Fig1\3_Fig1_Statistics\Fig1b\Main_Roessler_Y_RMSE_lam\];
%---------------------------------------------------------------------------
% Correspondingly, the directory [\Fig1\3_Fig1_Statistics\Double\] contains the
% same data as [\Fig1\3_Fig1_Statistics\Structure\], but its contents can be 
% easily visualized;
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
%------------------------!!!FINALY!!!--------------------------------------- 
% All the data files from directories 
% [\Fig1\1_Fig1_Parameters\ParamStructure\], 
% [\Fig1\2_Fig1_DynData\DynStructure\], and
% [\Fig1\3_Fig1_Statistics\Fig1a\StatStructure\],
% [\Fig1\3_Fig1_Statistics\Fig1b\StatStructure\] 
% must be copied into directory 
% [\Fig1\Figure\Structure\];
%---------------------------------------------------------------------------
