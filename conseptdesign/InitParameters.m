
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
alt = 500; % Initial altitude [m]
alt_array = [0, 1000, 2000, 4000, 6000, 10000, 15000, 20000, 25000, 30000];
rho_array = [1.224, 1.11, 1.006, 0.819, 0.659, 0.413, 0.192, 0.087, 0.039, 0.017];
rho = spline(alt_array, rho_array,20000);  % Airdensity at 500m [kg/m^3]

%=========== Irradiance conditions ==============
I_max = 950;       % Maximum irradiance [W/m^2]
% T_day = 13.2*3600;
T_day = 23.0*3600; % Duration of the day [s]
n_wthr = 0.9;      % Margin factor <1 take clouds into account [-]

%================ Aerodynamics ==================
C_L = 0.8;        % Airfoil lift coefficient [-]
C_D_afl = 0.0126; % Airfoil drag coefficient [-]
C_D_par = 0.0065; % Fuselage drag coefficient [-]
e = 0.9;          % Constant depending on wing shape [-]

%======= Wing & fuselage Structure ==============
k_af = 0.44 / 9.81; % Constant [~Kg/m3]
x1 = 3.1;           % Scaling exponent for b [-]
x2 = -0.25;         % Scaling exponent for AR [-]

%============= Propulsion group =================
n_ctrl = 0.95; % Efficiency of motor controller [-]
n_mot = 0.85;  % Efficiency of motor [-]
n_grb = 0.97;  % Efficiency of gearbox [-]
n_plr = 0.85;  % Efficiency of propeller [-]
k_prop = 0.008;% Mass/Power ration of propulsion group [kg/W]

%======= Battery and Stepdown converter =========
n_chrg = 0.95;    % Efficiency of charge process [-]
n_dchrg = 0.95;   % Efficiency of discharge process [-]
n_bec = 0.65;     % Efficiency of bec (5V stepdown) [-]
k_bat = 190*2600; % Energy density of LiPo [J/Kg]

%================ Solar cells ===================
k_sc = 0.32;     % Mass density of solar cells [Kg/m2]
k_enc = 0.26;    % Mass density of encapsulation [Kg/m2]
k_mppt = 1/2368; % Mass/Power ratio of mppt [kg/W]
n_sc = 0.169;    % Efficiency of solar cells [-]
n_cbr = 0.9;     % Efficiency of cambered configuration [-]
n_mppt = 0.97;   % Efficiency of mppt [-]

%============== Avionics & Payload ==============
m_av = 0.15;  % Mass of controler and electronics [kg]
m_pld = 0.05; % Mass of payload [kg]
p_av = 1.5;   % Power required for control [W]
p_pld = 0.5;  % Power required for payload [W]