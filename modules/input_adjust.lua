-- Lua module to adjust touch coordinates
-- to different window proportions.
IADJ = {}

IADJ.def_w = 640
IADJ.def_h = 1136

function IADJ.adjust(x, y)
	local wndw, wndh = window.get_size()

	local adjx = x
	local adjy = y
	
	if wndw / wndh > IADJ.def_w / IADJ.def_h then
		scale = wndw * IADJ.def_h / wndh / IADJ.def_w
		start_pos = IADJ.def_w * (scale - 1) / 2
		adjx = x * scale - start_pos
	else
		scale = wndh * IADJ.def_w / wndw / IADJ.def_h
		start_pos = IADJ.def_h * (scale - 1) / 2
		adjy = y * scale - start_pos
	end

	return adjx, adjy
end

return IADJ