function LinearInterpolation()
    % Define the function and the interval
    func = @(x) x.^2 + 3*x - 4; % Function to be solved
    interval = [0, 3]; % Search interval

    % Find the root using the linear interpolation method
    root = findRoot(func, interval);

    % Plot the function with the root
    plotFunction(func, root, interval);
end

function root = findRoot(func, interval)
    a_val = interval(1);
    b_val = interval(2);
    tolerance = 1e-6;
    max_iterations = 1000; % Maximum iterations limit
    iter = 0; % Iteration counter

    % Linear interpolation method
    while true
        c = (a_val * func(b_val) - b_val * func(a_val)) / (func(b_val) - func(a_val));

        % Check if the root has been found within the tolerance
        if abs(func(c)) < tolerance
            root = c;
            disp(['Root found: ', num2str(root)]);
            return;
        elseif func(a_val) * func(c) < 0
            b_val = c; % Update b_val
        elseif func(b_val) * func(c) < 0
            a_val = c; % Update a_val
        end

        iter = iter + 1;
        if iter > max_iterations
            disp('Maximum iterations reached, root not found.');
            root = NaN; % Return NaN if the root is not found
            return;
        end
    end
end

function plotFunction(func, root, interval)
    % Create a vector of points for plotting
    plot_margin = 0.2; % Plotting interval expansion
    x_range = (interval(2) - interval(1)) * plot_margin;
    x = linspace(interval(1) - x_range, interval(2) + x_range, 400);
    y = func(x); % Evaluate the function at points x

    % Plot the function
    figure;
    plot(x, y, 'b-', 'LineWidth', 2); % Function in blue
    hold on;

    % Highlight the found point
    if ~isnan(root)
        plot(root, func(root), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Point in red
    end
    grid on;
    xlabel('x');
    ylabel('f(x)');
    title(['Graph of the function f(x)']); % Title adjustment
    legend('f(x)', 'Point found');

    % Adjust the y-axis limits
    ylim([min(y) - abs(min(y)) * 0.1, max(y) + abs(max(y)) * 0.1]);

    hold off;
end
