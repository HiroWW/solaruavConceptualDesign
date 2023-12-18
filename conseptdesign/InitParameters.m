
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
g = 9.81;
alt = 500;
alt_array = [0, 1000, 2000, 4000, 6000, 10000, 15000, 20000, 25000, 30000];
rho_array = [1.224, 1.11, 1.006, 0.819, 0.659, 0.413, 0.192, 0.087, 0.039, 0.017];
rho = spline(alt_array, rho_array,500); 
%=========== Irradiance conditions ==============
I_max = 950;
T_day = 13.2*3600;
n_wthr = 0.9;
%================ Aerodynamics ==================
C_L = 0.8;
C_D_afl = 0.0126;
C_D_par = 0.0065;
e = 0.9;
%======= Wing & fuselage Structure ==============
k_af = 0.44 / 9.81;
x1 = 3.1;
x2 = -0.25;
%============= Propulsion group =================
n_ctrl = 0.95;
n_mot = 0.85;
n_grb = 0.97;
n_plr = 0.85;
k_prop = 0.008;
%======= Battery and Stepdown converter =========
n_chrg = 0.95;
n_dchrg = 0.95;
n_bec = 0.65;
k_bat = 190*2600;
%================ Solar cells ===================
k_sc = 0.32;
k_enc = 0.26;
k_mppt = 1/2368;
n_sc = 0.169;
n_cbr = 0.9;
n_mppt = 0.97;
%============== Avionics & Payload ==============
m_av = 0.15;
m_pld = 0.05;
p_av = 1.5;
p_pld = 0.5;