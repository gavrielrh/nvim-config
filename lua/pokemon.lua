M = {}

M.random_pokemon = function()
    local res = require("pokeapi").get_resources("pokemon", 100000, 0)
    if res then
        local results = res['results']
        local index = math.random(1, #results)
        return results[index]
    end
end

M.insert_random_pokemon = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row = pos[1] - 1
    local col = pos[2]
    local pokemon = M.random_pokemon()['name'] .. " "
    vim.api.nvim_buf_set_text(0, row, col, row, col, { pokemon })
    vim.api.nvim_win_set_cursor(0, { row + 1, col + #pokemon })
end

M.insert_random_pokemon_move = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row = pos[1] - 1
    local col = pos[2]
    local pokemon_name = M.random_pokemon()['name']
    local pokemon = require("pokeapi").get_resource("pokemon", pokemon_name)
    local moves = pokemon['moves']
    local index = math.random(1, #moves)
    local move = moves[index]['move']
    local move_name = move['name']
    local output = pokemon_name .. " used " .. move_name .. "!"
    vim.api.nvim_buf_set_text(0, row, col, row, col, { output })
    vim.api.nvim_win_set_cursor(0, { row + 1, col + #output })
end

return M
