f = @(x) 80 + 90*cos((pi*x)/3);  % Qualquer função
x0 = 4;                        % Chute inicial
tol = 1e-3;                    % Tolerância
h = 1e-8;                      % Passo pequeno para derivada numérica
max_iter = 100;
k = 0;

fprintf("Iter |     x      |   f(x)     |  Erro Relativo\n");
fprintf("--------------------------------------------------\n");

while true
  k = k + 1;

  fx = f(x0);

  % Derivada numérica centrada: f'(x) ≈ (f(x+h) - f(x-h)) / (2h)
  dfx = (f(x0 + h) - f(x0 - h)) / (2 * h);

  if abs(dfx) < 1e-10
    error("Derivada muito próxima de zero. Método falhou.");
  end

  x1 = x0 - fx / dfx;                % Passo de Newton
  erro = abs((x1 - x0) / x1);        % Erro relativo

  fprintf("%4d | %10.6f | %10.6f | %14.6f\n", k, x1, f(x1), erro);

  if erro < tol || k >= max_iter
    break;
  end

  x0 = x1;
end

fprintf("\nRaiz aproximada: %.8f\n", x1);
fprintf("Número de iterações: %d\n", k);
