#include "SDL.h"

#include <lvgl/lvgl.h>
#include <lvgl/src/drivers/sdl/lv_sdl_window.h>

#include <iostream>


SDL_Renderer *renderer;
lv_display_t *window;
uint64_t last_tick = 0;
bool closeme = false;

void cycle() {
	uint64_t current_tick = SDL_GetTicks64();
	uint64_t diff = current_tick - last_tick;
	lv_tick_inc(diff);
	lv_timer_handler();
	last_tick = current_tick;
}

void init() {
	SDL_Init(SDL_INIT_EVERYTHING);  // Initialize SDL2
    lv_init();
	window = lv_sdl_window_create(640, 480);
	// Check that the window was successfully created
    if (window == NULL) {
        // In the case that the window could not be made...
        SDL_Log("Could not create window: %s\n", SDL_GetError());
        return;
    }
    
    renderer = (SDL_Renderer *)lv_sdl_window_get_renderer(window);
    
     // Create a simple label
    lv_obj_t * label = lv_label_create(lv_scr_act());
    lv_label_set_text(label, "Hello LVGL!");
    lv_obj_align(label, LV_ALIGN_CENTER, 0, -50);
}

void quit() {
	lv_sdl_quit();
}
