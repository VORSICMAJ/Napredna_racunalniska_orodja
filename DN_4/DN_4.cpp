#include <fstream>
#include <vector>
#include <iostream>

struct PodatkovnaTocka {
    double x;
    double fx;
};

int main() {
    std::ifstream vhodnaDatoteka("poly.txt");
    std::ofstream izhodnaDatoteka("diff_poly.txt");

    if (!vhodnaDatoteka) {
        std::cerr << "Ne morem odpreti datoteke poly.txt";
        return 1;
    }

    int steviloVrstic;
    vhodnaDatoteka >> steviloVrstic;

    std::vector<PodatkovnaTocka> podatki(steviloVrstic);

    for (int i = 0; i < steviloVrstic; ++i) {
        vhodnaDatoteka.ignore(10, ':');
        vhodnaDatoteka >> podatki[i].x >> podatki[i].fx;
    }

    double delta_x = podatki[1].x - podatki[0].x;

    std::vector<double> odvodi(steviloVrstic);
    odvodi[0] = (-3 * podatki[0].fx + 4 * podatki[1].fx - podatki[2].fx) / (2 * delta_x);
    for (int i = 1; i < steviloVrstic - 1; ++i) {
        odvodi[i] = (podatki[i + 1].fx - podatki[i - 1].fx) / (2 * delta_x);
    }
    odvodi[steviloVrstic - 1] = (3 * podatki[steviloVrstic - 1].fx - 4 * podatki[steviloVrstic - 2].fx + podatki[steviloVrstic - 3].fx) / (2 * delta_x);

    for (const auto& odvod : odvodi) {
        izhodnaDatoteka << odvod << '\n';
    }

    vhodnaDatoteka.close();
    izhodnaDatoteka.close();

    return 0;
}
