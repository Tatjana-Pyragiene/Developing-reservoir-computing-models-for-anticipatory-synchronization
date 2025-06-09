%--------------------------------------------------------------------------
% readme_files.txt
%--------------------------------------------------------------------------
% In this directory we set the parameters for the case of the Roessler
% system;
%--------------------------------------------------------------------------
% Main_Rossler_Parameters.m -> this is the main file; it uses the following
% auxiliary functions:
%--------------------------------------------------------------------------
% Write_lam_icond.m -> this function sets the optimal CLE and the number of
% initial conditions;
%--------------------------------------------------------------------------
% set_parametersRS.m -> this functions sets the parameters for the case of 
% Roessler system (RS); we here set the parameters of the RS itself, 
% and the parameters for the NGRC; we also set the set of values of CLEs for 
% which we will compute the Fig1(a) and Fig1(b);
%--------------------------------------------------------------------------
% WriteParametersRS.m -> in this function we record the values of parameters 
% (which were set by function [set_parametersRS.m]) in the data *.mat files;
% the data files are recorded in two directories:
% /1_Fig1_Parameters/ParamDouble/ -> in this directory the data files are recorded as simple
% arrays; they can be easily inspected;
% /1_Fig1_Parameters/ParamStructure/ -> in this directory the data files are recorded as 
% structures; they can be easily accessed for computations, but during inspectation one 
% can only see the sizes of arrays;
%--------------------------------------------------------------------------
% ReadParametersRS.m -> this function opens the data *.mat files and reads the data
% from them; all the used data files are contained in the directory 
% /1_Fig1_Parameters/ParamStructure/
%--------------------------------------------------------------------------
% cell_mas.m -> this funtions is used by function [WriteParametersRS.m] when
% composing structures of data; these structures will be then recorded in the 
% data *.mat files;
%--------------------------------------------------------------------------
% Read_lam_icond.m -> this function opens the data file and reads the data
% from array lamIcond, containing the optimal CLE and the number of initial 
% conditions;
%--------------------------------------------------------------------------
