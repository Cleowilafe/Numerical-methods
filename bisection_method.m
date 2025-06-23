f = @(x) (x + 1)^2 * exp(x^2 - 2) - 1;

a = 0;
b = 1;
k = 1;
tol = 1e-3; 

fprintf("Iter |     a      |     b      |    med     |   f(med)   \n");
fprintf("----------------------------------------------------------\n");

while true
  med = (a + b) / 2;
  k = k + 1;

  fa = f(a);
  fmed = f(med);

  % Tabela
  fprintf("%4d | %10.6f | %10.6f | %10.6f | %10.6f\n", k, a, b, med, fmed);

  % Atualiza intervalo
  if fa * fmed <= 0
    b = med;
  else
    a = med;
  end

  % Critério de parada
  if abs(fmed) < tol || abs(b - a) < tol
    break;
  end
end

fprintf("\nRaiz aproximada: %.8f\n", med);
fprintf("Número de iterações: %d\n", k);
