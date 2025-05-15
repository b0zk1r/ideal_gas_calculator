
- Program Name : Ideal Gas Calculator
- Author       : [b0zk1r] Tunga Kaya
- Released     : May 15, 2025
- Language     : MATLAB
 
   
A simple MATLAB tool to calculate one missing variable (P, V, n, or T) using the ideal gas law:

\[
PV = nRT
\]

## Functionality
- Input any 3 of: Pressure (P), Volume (V), Moles (n), Temperature (T)
- Automatically calculates the missing one
- Results are rounded based on the **significant figures (s.f.)** of the input values
- Includes helper functions for detecting and applying correct s.f. rounding

## How to Use
1. Open `ideal_gas_calculator.m` in MATLAB
2. Run the script
3. Enter values when prompted (leave one as empty `[]`)
4. Get the calculated result with proper scientific precision

## Units
- Pressure: Pascals (Pa)
- Volume: Cubic meters (m³)
- Temperature: Kelvin (K)
- Amount: Moles (mol)

## Note
- Uses the universal gas constant R = 8.314 J/mol·K
- Internally uses:
  - `count_sigfig()` to analyze individual input precision
  - `min_sigfig()` to select the limiting input
  - `round_sigfig()` for rounding to desired s.f.   
