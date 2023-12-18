%==========================================================================
%=== Global Design of Sky-Sailor Airplane
%=== - Plot Example for Unmanned Aerial Vehicle -
%=== A. Noth, ASL, ETHZ, 2008
%===
%=== This code tries different combinations of wingspan and aspect ratio
%=== and then evaluates the feasibility or not of the solution. It uses the
%=== technological & mission parameters from Initparameters. The results
%=== are plotted on graph where one can also see the mass distribution.
%=== SCENARIO: Solar Unmanned Aerial Vehicle for 24h Flight
%==========================================================================
clc;clear;clf;
cmap = colormap ("hot");
j = 0;

InitParameters;
T_night = 24*3600-T_day;

for AR = [8,9,10,11,12,13,14,16,18,20]
    j = j+1;
    col = cmap (floor(((100-20) -0) / (20-8) * (AR-8)) +1,:);

    i = 0;
    b_max = 6;
    b_step = .1;

    for b=b_step:b_step:b_max
        EvaluateSolution;
        i = i+1;
        m(i) = Sol_m;
        P_level (i) = Sol_P_level;
        m_af (i) = Sol_m_af;
        P_elec_tot (i) = Sol_P_elec_tot;
        m_bat (i) = Sol_m_bat;
        A_sc (i) = Sol_A_sc;
        m_sc (i) = Sol_m_sc;
        m_mppt (i) = Sol_m_mppt;
        P_sc (i) = Sol_P_sc;
        m_prop (i) = Sol_m_prop;
        v(i) = Sol_v;
        D (i) = Sol_D;
        A(i) = Sol_A;
    end
    width = 2;
    b=b_step:b_step:b_max;
    
    figure (1) ;set (gcf,'Position',[1056 204 560 420]);
    hold on;
        plot(b, m, 'Color', col, 'LineWidth', width);
        [m_min.m(j),index] = min(m);
        m_min.b(j) = b(index);
        grid on;
            xlabel('wingspan [m]');
            ylabel('Total mass of solar Airplane [kg]');
        
    figure(2);set(gcf,'Position',[487 704 800 420]);
    subplot(2,2,1);hold on;
        plot(b, v, 'Color', col, 'Linewidth', width);
        [v_min.v(j),index] = min(v);
        v_min.b(j) = b(index);
        grid on;
        ylabel('speed [m/s]');
    subplot(2,2,3);hold on;
        plot(b, P_level, 'Color', col, 'LineWidth', width);
        grid on;
        ylabel('Power at propeller [W]');
        xlabel('Wingspan [m]');
    subplot(2,2,2);hold on;
        plot(b, A, 'Color', col, 'LineWidth',width);
        grid on;
        ylabel('Wing Area [m^2]');
    subplot(2,2,4);hold on;
        plot(b,A_sc./A*100,'Color',col,'LineWidth', width);
        [ratio_area_min.ratio_area(j),index] = min(A_sc./(b.^2/AR)*100);
        ratio_area_min.b(j) = b(index);
        grid on;
        xlabel('Wingspan[m]');
        ylabel('Solar Area Ratio [%]');

    if (AR == 13)
        figure (3); set (gcf,'Position' , [487 204 560 420]);
        area (b, [m./m*m_pld;m./m*m_av;m_af;m_bat;m_sc;m_mppt;m_prop]');
        legend('Payload','Avionics','Airframe','Batteries','Solar Panels','Mppt',...
                'Propulsion group','Location','NorthWest');
        xlabel('Wingspan[m]');
        ylabel('Mass [kg]');
        colormap(gray(100));
    end
end

figure (1);
    plot(m_min.b,m_min.m,'xk','MarkerSize', 4);
    legend('8','9','10','11','12','13','14','16','18','20','Location','NorthWest');

figure(2);
    subplot (2, 2, 1);
        plot(v_min.b,v_min.v,'xk','MarkerSize',4);
    subplot(2, 2, 4);
        plot(ratio_area_min.b,ratio_area_min.ratio_area,'xk','MarkerSize', 4);
        legend('8','9','10','11','12','13','14','16','18','20','Location','NorthWest');












