--------------------------------------------------------------------------
 readme_files.txt
--------------------------------------------------------------------------
 Here we use the NGRC DDE system (slave system) in order to predict the driving
 system (in this case it is the Rossler system time series).
 The first part of the Rossler system time series is used for learning of the
 NGRC system; After learning, the output vector W is computed, an we then
 use the rest part of the Roessler system time series in order to drive the
 NGRC system in such a way that the NGRC predicts the behaviour of the Roessler system  time series.  
=============================================================================
Subdirectories of Fig1\
    \Figure\             - Plotting the Fig1 graph for the Ressler system
    \1_Fig1_Parameters\  - Creating *.mat files with parameters 
	                       that are used by many programs
						   
	\2_Fig1_Dynamics\    - Creating *.mat files containing information 
	                       about the system dynamics
    \3_Fig1_Statistics\  - Creating *.mat file with dependence of error (RMSE)
                           vs time of prediction for various values of transversal
                           LE; the statistics of errors vs transversal LE are
                           also computed, and results are put into *.mat file;
--------------------------------------------------------------------------




