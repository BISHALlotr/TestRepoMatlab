% Define parameters
L = 10; % Define the length of the spatial domain (adjust as needed)
N = 1024; % Number of sample points
x = linspace(-L, L, N); % Define the spatial domain
dx = x(2) - x(1); % Calculate the spatial step size

% Define the potential in real space
r = abs(x); % Distance in real space
e = 1;
V_real = e^2./r.*exp(-3*r); % Potential e^2/r

% Calculate the Fourier transform in reciprocal space
k = 2*pi*fftshift((-N/2:N/2-1)/(N*dx)); % Define the reciprocal space
V_reciprocal = fftshift(fft(V_real));

figure;
% Plot in real space
subplot(2, 1, 1);
plot(x, V_real);
title('Potential in Real Space');
xlabel('Distance (r)');
ylabel('Potential (e^2/r)');

% Plot in reciprocal space
subplot(2, 1, 2);
plot(k, 4*pi^2./k.^2); % Analytical Fourier transform (4*pi^2/q^2)
hold on;
%plot(k, real(V_reciprocal));
title('Fourier Transform in Reciprocal Space');
xlabel('Reciprocal Space (k)');
ylabel('Transformed Potential');
legend('Analytical', 'Numerical');

% Adjust plot limits for reciprocal space
xlim([-10, 10]); % Adjust as needed

% Display the plots
sgtitle('Fourier Transform of Potential');
