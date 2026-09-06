local M = {}

function M.style(style)
    local result = {}
    if style then
        for _, name in ipairs({ 'bold', 'italic', 'underline', 'undercurl', 'strikethrough' }) do
            if style[name] then
                result[name] = true
            end
        end
    end
    return result
end

function M.hex_to_rgb(hex)
    hex = hex:gsub('#', '')
    return {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16),
    }
end

function M.rgb_to_hex(rgb)
    return string.format('#%02x%02x%02x', rgb.r, rgb.g, rgb.b)
end

function M.blend(foreground, background, opacity)
    local fg = M.hex_to_rgb(foreground)
    local bg = M.hex_to_rgb(background)
    return M.rgb_to_hex({
        r = math.floor(fg.r * opacity + bg.r * (1 - opacity)),
        g = math.floor(fg.g * opacity + bg.g * (1 - opacity)),
        b = math.floor(fg.b * opacity + bg.b * (1 - opacity)),
    })
end

function M.solid(hex, background)
    if #hex == 7 then
        return hex
    end
    return M.blend(hex:sub(1, 7), background, tonumber(hex:sub(8, 9), 16) / 255)
end

return M
