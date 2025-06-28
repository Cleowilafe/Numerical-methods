f = @(x) exp(-x.^2) - cos(x);               % Função original
phi = @(x) cos(x) - exp(-x.^2) + x;         % Função φ(x) do ponto fixo

x0 = 1.5;                   % Chute inicial (dentro do intervalo dado)
tol = 1e-4;                 % Tolerância
max_iter = 100;
k = 0;

fprintf("Iter |     x      |   f(x)     | |x_k+1 - x_k|\n");
fprintf("--------------------------------------------------\n");

while true
  k = k + 1;
  x1 = phi(x0);             % Iteração de ponto fixo
  erro = abs(x1 - x0);      % Erro absoluto
  fx1 = f(x1);

  fprintf("%4d | %10.6f | %10.6f | %14.6f\n", k, x1, fx1, erro);

  if erro < tol && abs(fx1) < tol
    break;
  end

  if k >= max_iter
    break;
  end

  x0 = x1;
end

fprintf("\nRaiz aproximada: %.8f\n", x1);
fprintf("Número de iterações: %d\n", k);
