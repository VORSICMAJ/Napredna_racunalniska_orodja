function narisi_krog_in_tocke()
    stevilo_tock = 10000;  
    polmer = 1;
    
    x = 2 * rand(stevilo_tock, 1) - 1;
    y = 2 * rand(stevilo_tock, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    
    tocke_notri = razdalja <= polmer;
    tocke_ven = razdalja > polmer;
    
    scatter(x(tocke_notri), y(tocke_notri), 50, 'c', 'filled');
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
