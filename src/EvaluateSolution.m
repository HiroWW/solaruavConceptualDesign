C_D_ind = C_L^2 / (e*pi*AR);
C_D = C_D_afl + C_D_ind + C_D_par;

a0 = C_D/ (C_L^1.5) *sqrt (2*AR* (g^3) /rho);
a1 = 1/ (n_ctrl * n_mot * n_grb * n_plr);
a1 = 1; % そういう仮定をおきます
a2 = 1/ (n_bec) * (p_av+p_pld);
a3 = m_av + m_pld;
a4 = k_af*AR^x2;
a5 = k_sc + k_enc;
a6 = k_mppt * I_max * n_sc * n_cbr * n_mppt;
a7 = T_night/ (n_dchrg * k_bat);
a8 = k_prop;
a9 = pi/(2*n_sc* n_cbr*n_mppt*n_wthr) * ...
     (1 + T_night/ (T_day*n_chrg*n_dchrg)) *1/I_max;
a10 = a0 * a1* (a7 + a8 + a9* (a5+a6));
a11 = a2 * (a7+a9* (a5+a6)) +a3;
a12 = a10 * 1/b;
a13 = a11 + a4*(b^x1);
% a13 = a11 + 36;
z = roots([a12 -1 0 a13]);
Sol_m = MinimumPositive(z)^2;

if (isnan(Sol_m) == 0)
    disp('SOLVED!OK b is ');
    disp(b);
    disp('AR is ');
    disp(AR);
    Sol_P_level = a0*Sol_m^1.5/b
    Sol_m_af = a4*b^x1
    % Sol_m_af = 36;
    Sol_P_elec_tot = a1*Sol_P_level+a2
    Sol_m_bat = a7*Sol_P_elec_tot
    Sol_A_sc = a9*Sol_P_elec_tot
    Sol_m_sc = a5*Sol_A_sc
    Sol_m_mppt = a6*Sol_A_sc
    Sol_P_sc = a6*Sol_A_sc/k_mppt
    Sol_m_prop = a8*a1*Sol_P_level
    Sol_v = sqrt(2*Sol_m*g/(C_L*rho*b*b/AR))
    Sol_D = Sol_m*g/C_L*C_D
    Sol_A = b^2/AR
end

if ( (isnan(Sol_m)==1)||(Sol_A_sc>b*b/AR))
    % disp('NAN CALLED');
    % disp('cannnot solve b is : ');
    % disp(b);
    Sol_m = NaN;
    Sol_P_level = NaN;
    Sol_m_af = NaN;
    Sol_P_elec_tot = NaN;
    Sol_m_bat = NaN;
    Sol_A_sc = NaN;
    Sol_m_sc = NaN;
    Sol_m_mppt = NaN;
    Sol_P_sc = NaN;
    Sol_m_prop = NaN;
    Sol_v = NaN;
    Sol_D = NaN;
    Sol_A = NaN;
end