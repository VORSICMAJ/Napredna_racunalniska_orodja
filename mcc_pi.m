function [points_in_circle, points_in_square] = mcc_pi(num_points)
    % V kvadratu naključne generirane točke
    x = 2 * rand(1, num_points) - 1;
    y = 2 * rand(1, num_points) - 1;

    % Preverimo, če so točke znotraj kroga
    r = sqrt(x.^2 + y.^2);
    inside_circle = r <= 1;

    % Ločimo točke znotraj kvadrata in kroga
    points_in_circle = [x(inside_circle); y(inside_circle)];
    points_in_square = [x; y];

end