%---------------------------------------------------------------------------
% readme_file.txt
%---------------------------------------------------------------------------
% In this directory we plot the graph [Fig.2] for the case of the Lorenz 
% system;
%---------------------------------------------------------------------------
% Main_Lorenz_Fig2.m -> this is the main function in this directory; it plots
% the whole [Fig.2] graph;
% This function uses the following functions:
% Lorenz_Fig2a.m -> plots the graph Fig.2(a);
% Lorenz_Fig2b.m -> plots the graph Fig.2(b);
% Lorenz_Fig2c.m -> plots the graph Fig.2(c);
%---------------------------------------------------------------------------
% Here we describe these functions in details;
%---------------------------------------------------------------------------
% Lorenz_Fig2a.m -> this function plots the dependence of errors vs the time 
% of prediction for various values of CLEs;
%---------------------------------------------------------------------------
% Lorenz_Fig2b.m -> this function plots the statistics of errors vs various 
% values of CLEs; for each value of CLE there have been taken 100 initial
% conditions; this graph shows the quartiles for each value of CLE;
% the data are loaded from data file [Structure\RMSEls.mat];
%---------------------------------------------------------------------------
% Lorenz_Fig2c.m -> this function plots the graph of dynamics of three variables:
% u(t) -> current dynamics of the Roessler system time series, x(t);
% nu30(t) -> output of anticipatory synchronization;
% u(t+30*tau) -> the Lorenz system output, anticipated by 30*tau;
% The difference between  nu30(t) and u(t+30*tau) is almost invisible;
%---------------------------------------------------------------------------
% In the above functions, we also use the following auxillary functions:
%---------------------------------------------------------------------------
% ReadFiles.m -> this function reads data files from directory [\Fig2\Figure\Structure\]
% this function is used by function [Lorenz_Fig2c.m];
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% ReadParameters.m -> this function reads from data files the parameters
% for the case of Lorenz system, for the chaotic system, and for
% the NGRC; this function is used by function [Main_Lorenz_Fig2.m];
%---------------------------------------------------------------------------
% Read_lam_icond.m -> reads from the data file the CLE, and the number of
% initial conditions; this function is used by function [Lorenz_Fig2c.m];
%---------------------------------------------------------------------------
%--------------------------!!!NOTE!!!---------------------------------------
% Read [\Fig1\Figure\readme_data_files.txt] for information about composing 
% directories containing data files;
%---------------------------------------------------------------------------



