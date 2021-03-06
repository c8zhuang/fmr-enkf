% function [prm, fmt] = model_getprmstruct
%
% Reads custom parameter structure for L40 model.
%
% @return prm - system parameters
% @return fmt - parameter formats
%
% Description of individual fields in the parameter file:
%
% field = integrator
%   - integrator tag
% values =
%   rk4 - for Runge-Kutta 4-order integrator
%   dp5 - for Dorman-Prince 5-order integrator
%
% field = dt
%   - time step for one model step
% values =
%   <value> (0.05*)
%
% field = use_compiled
%   - flag; whether ot use compiled C code or Matlab code for stepping the
%     model
% values =
%   0
%   1*
%
% field = fname_samples
%   - name of the file with samples for initial ensemble
% values =
%   <file name>

% File:           model_getprmstruct.m
%
% Created:        31/08/2007
%
% Last modified:  26/08/2010
%
% Author:         Pavel Sakov
%                 CSIRO Marine and Atmospheric Research
%                 NERSC
%
% Last modified:  18/01/2008
%
% Purpose:        Creates two structures: prm -- to hold the system parameters;
%                 and fmt -- to hold the format strings for each parameter,
%                 used while reading from a file
%
% Description:    
%
% Revisions:      26/08/2010 PS:
%                   - removed field "approx" (it is now alway assumed
%                     that approx = 1)
%                   - set default values integrator = 'rk4', dt = 0.01 to
%                     get in line with the literature
%

%% Copyright (C) 2008 Pavel Sakov
%% 
%% This file is part of EnKF-Matlab. EnKF-Matlab is a free software. See 
%% LICENSE for details.

function [prm, fmt] = model_getprmstruct
    
    prm = struct(                            ...
        'integrator',    {'rk4'},            ...
        'dt',            {0.01},             ...
        'use_compiled',  {1},                ...
        'fname_samples', {'L3_samples.mat'}  ...
        );
  
    fmt = struct(                            ...
        'integrator',    {'%s'},             ...
        'dt',            {'%g'},             ...
        'use_compiled',  {'%d'},             ...
        'fname_samples', {'%s'}              ...
        );
    
    return
