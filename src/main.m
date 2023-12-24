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
cmap = colormap ("jet");
j = 0;

InitParameters;
T_night = 24*3600-T_day;

AR_values = {}; % ARの値を文字列として保存する配列
AR_min = 8; % アスペクト比の最小値
AR_max = 30; % アスペクト比の最大値
for AR = AR_min:AR_max
    j = j + 1;
    col = cmap(floor(((length(cmap)-1) - 0) / (AR_max - AR_min) * (AR - AR_min)) + 1, :);

    i = 0;
    b_max = 75;
    %b_step = .1;
    b_step = .5;


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
    ARforplot = 13;
    if (AR == ARforplot)
        figure (3); set (gcf,'Position' , [487 204 560 420]);
        area (b, [m./m*m_pld;m./m*m_av;m_af;m_bat;m_sc;m_mppt;m_prop]');
        title(['AR = ',num2str(ARforplot)]);
        legend('Payload','Avionics','Airframe','Batteries','Solar Panels','Mppt',...
                'Propulsion group','Location','NorthWest');
        xlabel('Wingspan[m]');
        ylabel('Mass [kg]');
        colormap(gray(100));
    end
    AR_values{end+1} = num2str(AR); % ARの値を文字列として配列に追加
end

% 総質量の最小値を最小化するAR
[m_min_value, m_min_index] = min(m_min.m);
m_min_AR = m_min.b(m_min_index);
disp(['総質量の最小値を最小化するAR: ', num2str(m_min_AR)]);

% 速度の最小値を最小化するAR
[v_min_value, v_min_index] = min(v_min.v);
v_min_AR = v_min.b(v_min_index);
disp(['速度の最小値を最小化するAR: ', num2str(v_min_AR)]);

% 太陽電池面積比率の最小値を最小化するAR
[ratio_area_min_value, ratio_area_min_index] = min(ratio_area_min.ratio_area);
ratio_area_min_AR = ratio_area_min.b(ratio_area_min_index);
disp(['太陽電池面積比率の最小値を最小化するAR: ', num2str(ratio_area_min_AR)]);

% 各カテゴリの最小値のポイントにマーカーを付ける
figure(1);
    plot(m_min.b, m_min.m, 'xk', 'MarkerSize', 4);
    hold on;
    plot(m_min_AR, m_min_value, 'xr', 'MarkerSize', 6);
    legend(AR_values,'Location','NorthWest');

figure(2);
    % 凡例を作成
    lgd.Layout.Tile = 'east';
    legend(AR_values)
    subplot(2, 2, 1);
    plot(v_min.b, v_min.v, 'xk', 'MarkerSize', 4);
    hold on;
    plot(v_min_AR, v_min_value, 'xr', 'MarkerSize', 6);
    subplot(2, 2, 4);
    plot(ratio_area_min.b, ratio_area_min.ratio_area, 'xk', 'MarkerSize', 4);
    hold on;
    plot(ratio_area_min_AR, ratio_area_min_value, 'xr', 'MarkerSize', 6);