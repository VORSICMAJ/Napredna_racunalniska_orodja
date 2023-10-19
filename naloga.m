function izracunaj_oceno_pi()
    stevilo_tock = 6000;
    polmer = 1;
    
    [ocenjena_vrednost_pi, napaka] = izracunaj_oceno_pi_vrednosti(stevilo_tock, polmer);
    disp(['Ocenjena vrednost π: ', num2str(ocenjena_vrednost_pi)]);
    disp(['Napaka: ', num2str(napaka)]);
    
    narisi_krog_in_tocke(stevilo_tock, polmer);
end

function [ocenjena_vrednost_pi, napaka] = izracunaj_oceno_pi_vrednosti(stevilo_tock, polmer)
    tocke_v_krogu = 0;
    
    for i = 1:stevilo_tock
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        
        if x^2 + y^2 <= polmer^2
            tocke_v_krogu = tocke_v_krogu + 1;
        end
    end
    
    ocenjena_vrednost_pi = 4 * tocke_v_krogu / stevilo_tock;
    napaka = abs(ocenjena_vrednost_pi - pi);
end

function narisi_krog_in_tocke(stevilo_tock, polmer)
    x = 2 * rand(stevilo_tock, 1) - 1;
    y = 2 * rand(stevilo_tock, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    
    tocke_notri = razdalja <= polmer;
    tocke_ven = razdalja > polmer;
    
    scatter(x(tocke_notri), y(tocke_notri), 50, 'k', 'filled');
    hold on;
    scatter(x(tocke_ven), y(tocke_ven), 50, 'm', '+');
    
    narisi_krog(polmer);
    axis equal;
    
    title('Naključno generirane točke na lokaciji kroga');
    xlabel('X-os');
    ylabel('Y-os');
    legend('Znotraj kroga', 'Izven kroga', 'Krožnica');
end

function narisi_krog(polmer)
    kot = linspace(0, 2*pi, 1000);
    x = polmer * cos(kot);
    y = polmer * sin(kot);
    
    plot(x, y, 'r', 'LineWidth', 4);
end