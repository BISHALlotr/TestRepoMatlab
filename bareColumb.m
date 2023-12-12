% Define the external field and its Fourier transform functions
deltaV = @(r) exp(2) ./ r;
V = @(q) 4 * pi * exp(2) ./ q.^2;

% Set the range of r values for the external field
r = linspace(0.1, 10, 100); % Choose the range according to your preference

% Create a figure window for real-time plotting
figure;

% Plot the external field
subplot(1, 2, 1);
h1 = plot(r, deltaV(r), 'LineWidth', 2);
xlabel('r');
ylabel('\deltaV(r)');
title('External Field: \deltaV(r) = e^2 / r');
grid on;

% Plot the Fourier transform
subplot(1, 2, 2);
q = linspace(0.1, 10, 1000); % Choose the range of q values for the Fourier transform
V_vals = V(q);
h2 = plot(q, V_vals, 'LineWidth', 2);
xlabel('q');
ylabel('V(q)');
title('Fourier Transform: V(q) = 4\pi e^2 / q^2');
grid on;

% Add an interactive data cursor to display Fourier transform values
dcm_obj = datacursormode(gcf);
set(dcm_obj, 'Enable', 'on');
set(dcm_obj, 'UpdateFcn', @dataCursorUpdate);

% Update function for data cursor display
function txt = dataCursorUpdate(~, event)
    pos = get(event, 'Position');
    r = pos(1);
    q = pos(1);
    V_val = V(q);
    txt = {['r = ' num2str(r)], ['q = ' num2str(q)], ['V(q) = ' num2str(V_val)]};
    subplot(1, 2, 1);
    hold on;
    plot(r, deltaV(r), 'ro', 'MarkerSize', 8); % Plot a red marker on the external field plot
    hold off;
    subplot(1, 2, 2);
    hold on;
    plot(q, V_val, 'ro', 'MarkerSize', 8); % Plot a red marker on the Fourier transform plot
    hold off;
end
