#include <iostream>
#include <fstream> // Para std::ifstream
#include <cstdlib> 

bool archivoExiste(const std::string& nombre_archivo) {
    std::ifstream archivo(nombre_archivo.c_str());
    return archivo.good(); // Devuelve true si el archivo se abre correctamente
}

int main() {

    std::string comando = "python3 main.py"; // Usa 'python' si estás en Windows o si 'python3' no está disponible

    // Ejecutar el comando
    int resultado = std::system(comando.c_str());

    std::string nombre_archivo = "../main.pyx";

    if (archivoExiste(nombre_archivo) && resultado == 0) {
        std::cout << "El archivo " << nombre_archivo << " existe." << std::endl;
        std::cout << "El script Python se ejecutó correctamente." << std::endl;
        
        
    } else {
        std::cout << "El archivo " << nombre_archivo << " no existe." << std::endl;
    }

    return 0;
}
