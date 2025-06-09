%--------------------------------------------------------------------------
% readme_files.txt
%--------------------------------------------------------------------------
% In this directory we set the parameters for the case of the Lorenz
% system;
%--------------------------------------------------------------------------
% Main_Lorenz_Parameters.m -> this is the main file; it use the following
% auxillary functions:
%--------------------------------------------------------------------------
% Write_lam_icond.m -> this function sets the optimal CLE and the number of
% initial conditions;
%--------------------------------------------------------------------------
% set_parametersRS.m -> this functions sets the parameters for the case of Lorenz system (LS);
% we here set the parameters of the LS itself, and the parameters for the NGRC;
% we also set the set of values of LCEs for which we will compute the Fig2(a) and
% Fig2(b);
%--------------------------------------------------------------------------
% WriteParametersLS.m -> in this function we record the values of parameters 
% (which were set by function [set_parametersLS.m]) in the data *.mat files;
% the data files are recorded in two directories:
% [/1_Fig2_Parameters/ParamStructure/] -> in this directory the data files are recorded as 
% structures; they can be easily accessed for computations, but during inspectation one 
% can only see the sizes of arrays;
% [/1_Fig2_Parameters/ParamDouble/] -> in this directory the data files are recorded as 
% arrays; they can be easily inspected by user; 
%--------------------------------------------------------------------------
% ReadParametersLS.m -> this function opens the data *.mat files and reads the data
% from them; all the used data files are contained in the directory 
% [/1_Fig2_Parameters/ParamDouble/]  
%--------------------------------------------------------------------------
% cell_mas.m -> this funtions is used by function [WriteParametersLS.m] when
% composing structures of data; these structures will be then recorded in the 
% data *.mat files;
%--------------------------------------------------------------------------
% Read_lam_icond.m -> this function opens the data file and reads the data
% from array lamIcond, containing the optimal CLE and the number of initial 
% conditions;
%--------------------------------------------------------------------------
