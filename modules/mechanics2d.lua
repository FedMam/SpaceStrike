-- Lua module to implement simple 2d mechanics
-- using model of a 2D vector with absolute value
-- and angle (relative to Y axis, clockwise) as properties.
-- this will save from having to mess up with
-- quaternions and vmath 3D vectors.
MECH = {}

MECH.polar = {
	abs = 1,
	angle = 0
}

function MECH.polar:new(o)
	o = o or {}   -- create object if user does not provide one
	setmetatable(o, self)
	self.__index = self

	o.abs = math.abs(o.abs)
	o.angle = o.angle % 360.0
	return o
end

function MECH.polar:extend(val)
	self.abs = math.max(0, self.abs + val)
end

function MECH.polar:mul(val)
	self.abs = self.abs * val
end

function MECH.polar:rotate(degrees)
	self.angle = (self.angle + degrees) % 360.0
end

function MECH.polar:rotate_to(ang, da)
	local diff = (self.angle - ang) % 360.0
	if diff < da or (360.0 - diff) < da then
		self.angle = ang
	elseif diff < 180 then
		-- rotate counter-clockwise
		self:rotate(-da)
	else
		-- rotate clockwise
		self:rotate(da)
	end
end

function MECH.polar:normalize(degrees)
	self.abs = 1
end

function MECH.polar:quaternion()
	return vmath.quat_rotation_z(-self.angle * math.pi / 180)
end

function MECH.polar:to_vector()
	return vmath.rotate(self:quaternion(), vmath.vector3(0, self.abs, 0))
end

function MECH.angle_of_vec2(x, y)
	-- angle between 2D vectors (x, y) and (0, 1)
	local cos = y / math.sqrt(x ^ 2 + y ^ 2)
	local ang = (math.acos(cos) * 180 / math.pi) % 360.0
	if x < 0 then
		ang = 360.0 - ang
	end
	return ang
end

function MECH.angle_of_vec3(vec)
	-- angle between vmath vectors vec (without counting the Z coordinate) and (0, 1, 0)
	return MECH.angle_of_vec2(vec.x, vec.y)
end
	
return MECH