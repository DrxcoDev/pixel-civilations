#include <SDL2/SDL.h>

int main(int argc, char* args[]) {
    SDL_Init(SDL_INIT_VIDEO); // Inicializa SDL2

    SDL_Window* window = SDL_CreateWindow(
        "SDL2 Window",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        640, 480,
        SDL_WINDOW_SHOWN
    );

    SDL_Delay(3000); // Mantiene la ventana abierta por 3 segundos

    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
