clear
clc
function ideal_gas_calculator()
    clc;
    disp('--- Ideal Gas Calculator ---');
    disp('Use SI units: P in Pascals, V in m^3, T in Kelvin, n in mol');
    
    R = 8.314; % Universal gas constant in J/mol·K
    
    % Inputs
    P = input('Enter pressure P (or leave empty as [] if unknown): ');
    V = input('Enter volume V (or leave empty as [] if unknown): ');
    n = input('Enter amount of substance n (or leave empty as [] if unknown): ');
    T = input('Enter temperature T (or leave empty as [] if unknown): ');
    
    % check for exactly one unknown
    known = [~isempty(P), ~isempty(V), ~isempty(n), ~isempty(T)];
 if sum(known) ~= 3
    error('Please provide exactly 3 known values and leave 1 as [].');
 end


    % Ideal Gas Law Calculation
    if isempty(P)
        sigfigs = min_sigfig([V,n,T]);
        P = (n*R*T)/V;
        P_rounded = round_sigfig(P,sigfigs);
        fprintf('Calculated Pressure: %g Pa (%d sig. fig)\n',P_rounded,sigfigs);

    elseif isempty(V)
        sigfigs = min_sigfig([P,n,T]);
        V = (n*R*T)/P;
        V_rounded = round_sigfig(V,sigfigs);
        fprintf('Calculated Volume: %g m³ (%d sig. fig)\n',V_rounded,sigfigs);

    elseif isempty(n)
        sigfigs = min_sigfig([P,V,T]);
        n = (P*V)/(R*T);
        n_rounded = round_sigfig(n,sigfigs);
        fprintf('Calculated amount of substance: %g mol (%d sig. fig)\n',n_rounded,sigfigs);

    elseif isempty(T)
        sigfigs = min_sigfig([P,V,n]);
        T = (P*V)/(n*R);
        T_rounded = round_sigfig(T,sigfigs);
        fprintf('Calculated Temperature: %g K (%d sig. fig)\n',T_rounded,sigfigs);

    else
        fprintf('All variables given. No calculation needed.\n');
    end
end

function sf = count_sigfig(val)   % Counts the significant figures of each input
    str = sprintf('%.16g', val);  % Write the number in decimal format with up to 16 significant figures
    str(str == '.') = '';         % Remove the decimal point
    str(str == '-') = '';         % If present remove the minus siign
    str(str == '0') = ' ';        % Replace zeros with spaces to help remove consecutive zeros
    sf = length(strtrim(str));
end

function min_sf = min_sigfig(values) % Finds the least significant figures
    min_sf = inf;
    for i = 1:length(values)
        val = values(i);
        if ~isempty(val)
            sf = count_sigfig(val);
            min_sf = min(min_sf, sf);
        end
    end
end

function y = round_sigfig(x, n) % Rounds to least significant figures
    if x == 0
        y = 0;
    else
        digits = floor(log10(abs(x))) + 1; 
        factor = 10^(n - digits);
        y = round(x * factor) / factor;
    end
end

