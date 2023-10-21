function oceni_vrednost_pi()
    stevilo_tock = 6000;
    polmer = 1;
    
    [ocenjena_vrednost_pi, napaka] = mcc_pi(stevilo_tock);
    disp(['Ocenjena vrednost π: ', num2str(ocenjena_vrednost_pi)]);
    disp(['Napaka: ', num2str(napaka)]);
    
    prikazi_krog_in_tocke(stevilo_tock, polmer);
end

function [ocenjena_vrednost_pi, napaka] = mcc_pi(num_points)
    inside_circle = 0;

   
    for i = 1:num_points
        x = rand();
        y = rand();
        if x^2 + y^2 <= 1
            inside_circle = inside_circle + 1;
        end
    end

    
    ocenjena_vrednost_pi = 4 * (inside_circle / num_points);
    napaka = abs(ocenjena_vrednost_pi - pi);
end

function prikazi_krog_in_tocke(stevilo_tock, polmer)
    x = 2 * rand(stevilo_tock, 1) - 1;
    y = 2 * rand(stevilo_tock, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    
    tocke_notri = razdalja <= polmer;
    tocke_ven = razdalja > polmer;
    
    scatter(x(tocke_notri), y(tocke_notri), 50, 'c', 'filled');
    hold on;
    scatter(x(tocke_ven), y(tocke_ven), 50, 'm', '+');
    
    prikazi_krog(polmer);
    axis equal;
    
    title('Naključno generirane točke znotraj in izven kroga');
    xlabel('X-osa');
    ylabel('Y-osa');
    legend('Znotraj kroga', 'Izven kroga', 'Krožnica');
end

function prikazi_krog(polmer)
    koti = linspace(0, 2*pi, 1000);
    x = polmer * cos(koti);
    y = polmer * sin(koti);
    
    plot(x, y, 'r', 'LineWidth', 4);
end