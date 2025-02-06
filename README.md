# False Position Method

This repository contains an implementation of the False Position Method to find the roots of a mathematical function, given a search interval. The code uses the False Position method and plots the graph of the function with the found root.

## Features

The code consists of three main functions:

1. **`false_position_method`**: The main function that defines the function and the interval and calls the False Position method to find the root.
2. **`findRoot`**: A function that implements the False Position method to find the root of the function within the provided interval.
3. **`plotFunction`**: A function that plots the function graph, highlighting the found root.

## How It Works

The code solves the problem of finding the root of a function using the False Position method. Given an initial interval, the function calculates the intersection of the lines connecting the function values at the endpoints of the interval, iteratively refining the interval until the root is found with sufficient accuracy.

- **Input Function**: \( f(x) = x^2 + 3x - 4 \)
- **Search Interval**: [0, 3]
- **Tolerance**: 1e-6 (precision for the found root)

The code also plots the function and marks the root on the graph for visualization.

## How to Use

1. **Clone this repository**:

   ```bash
   git clone https://github.com/cleowilafe/false_position_method.git
   ```

2. **Run the main function** in MATLAB or Octave:
   
   ```matlab
   false_position_method()
   ```

3. **Modify the function or interval**:
   - To use a different function, change the line in the `false_position_method` function where the function is defined:
   
     ```matlab
     func = @(x) x.^2 + 3*x - 4; % Change to your function
     ```
   
   - To modify the search interval, change the `interval` variable:
   
     ```matlab
     interval = [0, 3]; % Change the interval as needed
     ```

## Example Output

When running the code, you will see the following output in the console (if the root is found):

```
Root found: 0.7321
```

Additionally, a graph of the function will be generated, with the root highlighted:

![Example Graph](graph.png)

## Functions

### `false_position_method`

The main function that sets up the function and the search interval and calls the False Position method to find the root.

### `findRoot`

This function uses the False Position method to find the root of the function within the given interval.

**Parameters**:
- `func`: An anonymous function representing the equation to be solved.
- `interval`: A two-element vector representing the search interval.

**Return**:
- The found root (or NaN if the maximum number of iterations is reached).

### `plotFunction`

This function plots the function graph and highlights the found root.

**Parameters**:
- `func`: The function to be plotted.
- `root`: The root found by the `findRoot` function.
- `interval`: The search interval for which the graph is generated.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
