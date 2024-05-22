-- use xmake run build-something to build for something

local function generate_target_for(platform)
	target("build-" .. platform)
	set_kind("phony")
	on_run(function()
		os.exec("xmake f -p " .. platform .. " -F "
			.. platform .. ".xmake.lua -vy")
		os.exec("xmake build -F " .. platform .. ".xmake.lua")
	end)
end

local function include_target_for(platform)
	if is_plat(platform) then
		includes(platform .. ".xmake.lua")
	end
end

local function handle_target_for(platform)
	generate_target_for(platform)
	include_target_for(platform)
end

for _, platform in ipairs({"wasm", "linux", "mingw"}) do
	handle_target_for(platform)
end

-- android handled a bit different way
target("build-android")
	set_kind("phony")
	on_run(function()
		os.exec("xmake run build-android -F android.xmake.lua")
	end)

target("clean-all")
	set_kind("phony")
	on_run(function()
		os.exec("rm -rf *.apk *.aab *.idsig .xmake build")
	end)