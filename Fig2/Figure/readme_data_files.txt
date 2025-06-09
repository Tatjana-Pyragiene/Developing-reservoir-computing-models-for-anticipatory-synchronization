%---------------------------------------------------------------------------
% readme_data_files.txt
%---------------------------------------------------------------------------
% Here we describe the way in which the data files are 
% produced, copied, and loaded;
%---------------------------------------------------------------------------
% The whole figure Fig.2 is plotted by function [Main_Lorenz_Fig2.m]; 
%---------------------------------------------------------------------------
% All necessary data files for plotting are stored in the directory
% [\Fig2\Figure\Structure\];
%---------------------------------------------------------------------------
% The contents of data files are computed in three directories:
% [\Fig2\1_Fig2_Parameters\];
% [Fig2\2_Fig2_DynData\];
% [Fig2\3_Fig2_Statistics\];
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% [\Fig2\1_Fig2_Parameters\] -> in this directory we set the values of necessary 
% parameters, and put them in data files into directory
% [\Fig2\1_Fig2_Parameters\ParamStructure\]; this directory will be used 
% subsequently in computations;
%---------------------------------------------------------------------------
% [\Fig2\2_Fig2_DynData\] -> in this directory we compute the dynamics which
% will be plotted in Fig.2(c); 
% Here we take the necessary parameters from directory 
% [\Fig2\2_Fig2_DynData\ParamStructure]; 
%--------------------------!!!NOTE!!!---------------------------------------
% The directory [\Fig2\2_Fig2_DynData\ParamStructure] is obtained by copying
% the contents from directory [\Fig2\1_Fig2_Parameters\ParamStructure\];
%---------------------------------------------------------------------------
% Correspondigly, the directory [\Fig2\2_Fig2_DynData\ParamDouble] is 
% obtained by copying the contents from directory 
% [\Fig2\1_Fig2_Parameters\ParamDouble\];
% This directory can be used by user for visualization of contents;
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% Directory [\Fig1\2_Fig2_DynData\DynStructure\] contains the data obtained by 
% computations of program [\Fig2\2_Fig2_DynData\Main_Lorenz_Y_dyn.m];
%---------------------------------------------------------------------------
% Correspondingly, the directory [\Fig2\2_Fig2_DynData\DynDouble\] contains the
% same data as [\Fig2\2_Fig2_DynData\DynStructure\], but its contents can be 
% easily visualized;
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% Directory [\Fig2\3_Fig2_Statistics\Fig2a\Structure1\] contains data file which
% is computed by the function 
% [\Fig2\3_Fig2_Statistics\Fig2a\Main_Lorenz_Y_RMSEj.m];
%---------------------------------------------------------------------------
% Correspondingly, the directory [\Fig2\3_Fig2_Statistics\Fig2a\Double1\] 
% contains the same data as [\Fig2\3_Fig2_Statistics\Fig2a\Structure1\], 
% but its contents can be easily visualized;
%---------------------------------------------------------------------------
% Directory [\Fig2\3_Fig2_Statistics\Fig2b\Structure1\] contains data file 
% which is computed by the function 
% [\Fig2\3_Fig2_Statistics\Fig2b\Main_Lorenz_X_RMSE_lam.m];
%---------------------------------------------------------------------------
% Correspondingly, the directory [\Fig2\3_Fig2_Statistics\Fig2a\Double1\] 
% contains the same data as [\Fig2\3_Fig2_Statistics\Fig2a\Structure1\], 
% but its contents can be easily visualized;
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
%------------------------!!!FINALY!!!--------------------------------------- 
% All the data files from directories 
% [\Fig2\1_Fig2_Parameters\ParamStructure\], 
% [\Fig2\2_Fig2_DynData\DynStructure\], and
% must be copied into directory 
% [\Fig2\Figure\Structure\];
% The data files from
% [\Fig2\3_Fig2_Statistics\Fig2a\Structure1\] and
% [\Fig2\3_Fig2_Statistics\Fig2b\Structure1\]
% must be also copied into directory
% [\Fig2\Figure\Structure\];
%---------------------------------------------------------------------------
