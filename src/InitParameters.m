
%==========================================================================
%=== Global Design of Sky-Sailor Airplane
%=== - Initialization of Parameters -
%=== A. Noth, 2008
%===
%=== This code initialize parameters for the design program of Sky-Sailor
%=== (or other solar airplane in general). Please read "Design of Solar
%=== Powered Airplanes for Continuous Flight" for more information about
%=== the calculations and for equations reference.

%==========================================================================
g = 9.81;  % Gravitational acceleration [m/s^2]
alt = 20000; % Initial altitude [m]
alt_array = [0, 1000, 2000, 4000, 6000, 10000, 15000, 20000, 25000, 30000];
rho_array = [1.224, 1.11, 1.006, 0.819, 0.659, 0.413, 0.192, 0.087, 0.039, 0.017];
% rho = spline(alt_array, rho_array, alt);  % Airdensity at 500m [kg/m^3]
rho = 0.087;
%=========== Irradiance conditions ==============
I_max = 1305;       % Maximum irradiance [W/m^2]
% T_day = 13.2*3600;
T_day = 13.2*3600; % Duration of the day [s]
% T_day = 24*3600; % Duration of the day [s]
n_wthr = 1.0;      % Margin factor <1 take clouds into account [-]

%================ Aerodynamics ==================
C_L = 0.85;        % Airfoil lift coefficient [-]
C_D_afl = 0.0110; % Airfoil drag coefficient [-]
C_D_par = 0.003; % Fuselage drag coefficient [-]
e = 0.9;          % Constant depending on wing shape [-]

%======= Wing & fuselage Structure ==============
% == Noth model == 
%k_af = 0.44 / 9.81; % Constant [~Kg/m3] 
%x1 = 3.1;           % Scaling exponent for b [-]
%x2 = -0.25;         % Scaling exponent for AR [-]
% == Rizzo model ==
% k_af = 1.548 / 9.81;
% k_af = 1.548;
% x1 = 1.312;
% x2 = -0.0046;
% == Fujiwara model ==
% k_af = 0.2990665364378257;
% x1 = 4.299239203700969;
% x2 = -3.186783616805698;
% == NEW Fujiwara Model ==
k_af = 0.03403897055438197;
x1 = 4.901820144074797;
x2 = -3.2990408991199884;

%============= Propulsion group =================
n_ctrl = 0.95;  % Efficiency of motor controller [-]
n_mot = 0.85;   % Efficiency of motor [-]
n_grb = 0.97;   % Efficiency of gearbox [-]
n_plr = 0.85;   % Efficiency of propeller [-]
%k_prop = 0.008  % Mass/Power ration of propulsion group [kg/W]
k_prop = 0.008; % Mass/Power ration of propulsion group [kg/W]

%======= Battery and Stepdown converter =========
n_chrg = 0.95;    % Efficiency of charge process [-]
n_dchrg = 0.95;   % Efficiency of discharge process [-]
n_bec = 0.65;% Efficiency of bec (5V stepdown) [-]
% n_bec = 1.0;
k_bat = 200*3600; % Energy density of LiPo [J/Kg]

%================ Solar cells ===================
k_sc = 0.32;     % Mass density of solar cells [Kg/m2]
k_enc = 0.26;    % Mass density of encapsulation [Kg/m2]
k_mppt = 1/2368; % Mass/Power ratio of mppt [kg/W]
n_sc = 0.3265;    % Efficiency of solar cells [-]
n_cbr = 0.9;     % Efficiency of cambered configuration [-]
n_mppt = 0.97;   % Efficiency of mppt [-]

%============== Avionics & Payload ==============
m_av = 0.15;  % Mass of controler and electronics [kg]
m_pld = 5; % Mass of payload [kg]
p_av = 1.5;   % Power required for control [W]
p_pld = 50;  % Power required for payload [W]