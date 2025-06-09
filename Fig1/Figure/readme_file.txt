%---------------------------------------------------------------------------
% readme_file.txt
%---------------------------------------------------------------------------
% In this directory we plot the graph [Fig.1] for the case of the Roessler 
% system;
%---------------------------------------------------------------------------
% Main_Roessler_Fig1.m -> this is the main function in this directory; it plots
% the whole [Fig.1] graph;
% This function uses the following functions:
% Roessler_Fig1a.m -> plots the graph Fig.1(a);
% Roessler_Fig1b.m -> plots the graph Fig.1(b);
% Roessler_Fig1c.m -> plots the graph Fig.1(c);
% Roessler_Fig1d.m -> plots the graph Fig.1(d);
%---------------------------------------------------------------------------
% Here we describe these functions in details;
%---------------------------------------------------------------------------
% Roessler_Fig1a.m -> this function plots the dependence of errors vs the time 
% of prediction for various values of CLEs;
%---------------------------------------------------------------------------
% Roessler_Fig1b.m -> this function plots the statistics of errors vs various 
% values of CLEs; for each value of CLE there have been taken many initial
% conditions; this graph shows the quartiles for each value of CLE;
% the data are loaded from data file [\Structure\RMSEls.mat];
%---------------------------------------------------------------------------
% Roessler_Fig1c.m -> this function plots the graph of dynamics of three variables:
% u(t) -> current dynamics of the Roessler system time series, y(t);
% nu50(t) -> output of anticipatory synchronization;
% u(t+50*tau) -> the Roessler system output, anticipated by 50*tau;
% The difference between  nu50(t) and u(t+50*tau) is almost invisible;
%---------------------------------------------------------------------------
% Roessler_Fig1d.m -> this function plots the dynamics of difference between the
% 50-th output of synchronization, and the Roessler system anticipated output, by 50*tau:
% eps(t)=nu50(t)-u(t+50*tau); -> error of prediction;
%---------------------------------------------------------------------------
% In the above functions, we also use the following auxillary functions:
%---------------------------------------------------------------------------
% ReadFiles1.m -> this function reads from data files [\Fig1\Figure\Structure\lamNs.mat]
% and [\Fig1\Figure\Structure\RMSEjs.mat] and the array of CLEs [lamN],
% and the array of corresponding errors [RMSEjs]; this function is used by
% function [Roessler_Fig1a.m];
%---------------------------------------------------------------------------
% These auxillary functions are used in the functions [Roessler_Fig1c.m]
and [Roessler_Fig1d.m]:
%---------------------------------------------------------------------------
% ReadParameters.m -> this function reads from data files the parameters
% for the case of Roessler system, for the chaotic system, and for
% the NGRC;
% Read_lam_icond.m -> reads from the data file the CLE, and the number of
% initial conditions;
% ReadFiles.m -> reads from the data file the dynamics of the Roessler system,
% and the dynamics of the NGRC system; 
%---------------------------------------------------------------------------
%--------------------------!!!NOTE!!!---------------------------------------
% Read [\Fig1\Figure\readme_data_files.txt] for information about composing 
% directories containing data files;
%---------------------------------------------------------------------------



