add_requires("libsdl", {system = false, configs = {shared = false}})

target("kurosu")
	set_kind("binary")
	add_files("src/main.cpp")
	add_packages("libsdl")
	add_defines("SDL_main=main")
	
	-- lvgl part
	add_defines("LV_LVGL_H_INCLUDE_SIMPLE")
	add_defines("LV_CONF_INCLUDE_SIMPLE")
	add_files("lvgl/src/**.c")
	
	-- this one exists in original cmakelists, but no such file exist
	--add_files("lvgl/src/*.S")
	
	add_files("lvgl/src/libs/thorvg/*.cpp")
	add_files("lvgl/src/others/vg_lite_tvg/*.cpp")
	add_includedirs("lvgl")
	add_includedirs(".") -- lvgl_conf.h here
	add_includedirs("lvgl/src/libs/thorvg")
