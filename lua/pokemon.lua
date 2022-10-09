local ok, pokeapi = pcall(require, 'pokeapi')
if not ok then
  return
end

M = {}

M.random_pokemon = function()
  local res = pokeapi.get_resources('pokemon', 100000, 0)
  if res then
    local results = res['results']
    local index = math.random(1, #results)
    return results[index]
  end
end

local insert_text = function(text)
  local pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1] - 1
  local col = pos[2]
  vim.api.nvim_buf_set_text(0, row, col, row, col, { text })
  vim.api.nvim_win_set_cursor(0, { row + 1, col + #text })
end

M.insert_random_pokemon = function()
  local pokemon = M.random_pokemon()['name'] .. ' '
  insert_text(pokemon)
end

M.insert_random_pokemon_move = function()
  local pokemon_name = M.random_pokemon()['name']
  local pokemon = pokeapi.get_resource('pokemon', pokemon_name)
  local moves = pokemon['moves']
  local index = math.random(1, #moves)
  local move = moves[index]['move']
  local move_name = move['name']
  local output = pokemon_name .. ' used ' .. move_name .. '!'
  insert_text(output)
end

return M
