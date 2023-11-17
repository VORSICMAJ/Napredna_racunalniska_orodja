#include <iostream>
#include <cmath>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// Fun. e^(3x)
double f(double x) {
    return exp(3 * x);
}

//  arctan(x/2) s pomocjo Taylorjeve vrste
double arctan(double x, int n) {
    double result = 0.0;
    for (int i = 0; i < n; ++i) {
        int exponent = 2 * i + 1;
        double term = pow(-1, i) * pow(x, exponent) / exponent;
        result += term;
    }
    return result;
}

// Trapezna metoda za oceno integrala
double trapezoidnaMetoda(double a, double b, int n) {
    double h = (b - a) / (n); 
    double integral = 0.0;

    for (int i = 0; i <= n; ++i) {
        double x = a + i * h;
        double fx = f(x) * arctan(x / 2, n);
        if (i == 0 || i == n) {
            integral += fx;
        }
        else {
            integral += 2 * fx;
        }
    }
    integral *= h / 2;
    return integral;
}

int main() {
    double a = 0.0; 
    double b = M_PI / 4.0; 
    int n = 1000; // Stevilo podintervalov

    double result = trapezoidnaMetoda(a, b, n);
    std::cout << "Ocena integrala: " << result << std::endl;

    return 0;
}
