function calc_pi()

num_points = 100:100:10000; % Naključne točke naraščajo po 100
estimated_pi = zeros(1, length(num_points));
error_pi = zeros(1, length(num_points));

% y kordinate na loki krožnice, anonimna funkcija
kroznica = @(x, r) sqrt(r^2 - x.^2);

for i = 1:length(num_points)
    [points_in_circle, points_in_square] = mcc_pi(num_points(i));
    
    % Ocena za π in napaka
    estimated_pi(i) = area_pi(points_in_circle, points_in_square);
    error_pi(i) = abs(estimated_pi(i) - pi);
    
    fprintf('Število točk: %d, Ocena za π: %.6f, Napaka: %.6f\n', num_points(i), estimated_pi(i), error_pi(i));
    
    % Izris grafa samo za 1000 točk
    if num_points(i) == 5000
        % Preveri, ali so točke znotraj loka krožnice
        y_values = kroznica(points_in_square(1, :), 1);
        inside_circle = abs(points_in_square(2, :)) <= abs(y_values);
        
        % Izris točk znotraj in zunaj kroga ter loka krožnice
        figure;
        plot(points_in_square(1, inside_circle), points_in_square(2, inside_circle), 'co', 'MarkerSize', 6); % Točke znotraj kroga (modra barva)
        hold on;
        plot(points_in_square(1, ~inside_circle), points_in_square(2, ~inside_circle), 'mx', 'MarkerSize', 6); % Točke zunaj kroga (rdeča barva)
        
        % Risanje loka krožnice
        r = 1;
        x = linspace(-r, r, 1000); % Interval x od -r do r
        y_positive = kroznica(x, r); % Pozitivna y vrednost krožnice
        y_negative = -kroznica(x, r); % Negativna y vrednost krožnice

        plot(x, y_positive, 'k', 'LineWidth', 2); % Del krožnice z y > 0
        plot(x, y_negative, 'k', 'LineWidth', 2); % Del krožnice z y < 0
        
        axis equal;
      ....................................
        hold off;
    end
end

% Izris rezultatov
figure;
plot(num_points, error_pi, '-o');
xlabel('Število naključnih točk');
ylabel('Napaka od π');
title('Približevanje vrednosti π z Monte Carlo metodo');
grid on;

end

function estimated_pi = area_pi(points_in_circle, points_in_square)
    ratio = size(points_in_circle, 2) / size(points_in_square, 2);
    estimated_pi = ratio * 4; % Ker je razmerje ploščin kroga in kvadrata π/4
end

