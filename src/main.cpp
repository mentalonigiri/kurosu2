#include "lib.cpp"

#ifdef EMSCRIPTEN
#include <emscripten.h>
#endif

int SDL_main(int argc, char* argv[]) {
	init();
	#ifdef EMSCRIPTEN
		emscripten_set_main_loop(cycle, 0, 1);
	#else
		while (!closeme) {
			cycle();
			SDL_Delay(1);
		}
	#endif
	quit();
	return 0;
}
