--- @sync entry
--- @since 26.1.22
local DEFAULT = { parent = 0, current = 16, preview = 12 }
local MIN_CURRENT = 8
local MIN_PREVIEW = 6
local STEP = 1

local function number(value, fallback)
	value = tonumber(value)
	return value and math.floor(value) or fallback
end

local function normalize(ratio)
	local parent = number(ratio and ratio.parent, 0)
	local current = number(ratio and ratio.current, 4)
	local preview = number(ratio and ratio.preview, 3)
	local total = parent + current + preview

	if total > 0 and total < 24 then
		local factor = math.max(1, math.floor(28 / total))
		parent = parent * factor
		current = current * factor
		preview = preview * factor
	end

	return parent, current, preview
end

local function apply(parent, current, preview)
	rt.mgr.ratio = { parent, current, preview }
	ui.render()
end

return {
	entry = function(_, job)
		local direction = job.args and job.args[1] or nil
		if direction == "reset" then
			apply(DEFAULT.parent, DEFAULT.current, DEFAULT.preview)
			return
		end

		local parent, current, preview = normalize(rt.mgr.ratio)
		local delta = direction == "wider" and STEP or direction == "narrower" and -STEP or tonumber(direction) or 0
		if delta == 0 then
			return
		end

		local next_current = current + delta
		local next_preview = preview - delta
		if next_current < MIN_CURRENT or next_preview < MIN_PREVIEW then
			return
		end

		apply(parent, next_current, next_preview)
	end,
}
