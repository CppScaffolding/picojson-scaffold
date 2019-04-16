-- scaffold geniefile for picojson

picojson_script = path.getabsolute(path.getdirectory(_SCRIPT))
picojson_root = path.join(picojson_script, "picojson")

picojson_includedirs = {
	path.join(picojson_script, "config"),
	picojson_root,
}

picojson_libdirs = {}
picojson_links = {}
picojson_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { picojson_includedirs }
	end,

	_add_defines = function()
		defines { picojson_defines }
	end,

	_add_libdirs = function()
		libdirs { picojson_libdirs }
	end,

	_add_external_links = function()
		links { picojson_links }
	end,

	_add_self_links = function()
		links { "picojson" }
	end,

	_create_projects = function()

project "picojson"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		picojson_includedirs,
	}

	defines {}

	files {
		path.join(picojson_script, "config", "**.h"),
		path.join(picojson_root, "**.h"),
		path.join(picojson_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
