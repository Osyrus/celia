local walk_v = 100
local jump_height = 75
local jump_length = 96

local jump_v = 4*walk_v*jump_height/jump_length
local g = jump_v*jump_v/(2*jump_height)

local context = gauge.input.context.new({active = true})
context.map = function (raw_in, map_in)
  if raw_in.key.pressed["up"] then
    map_in.actions["jump"] = true
  end

  -- Left Key
  if raw_in.key.pressed["left"] then
    if raw_in.key.down["right"] then
      map_in.actions["stop"] = true
    else
      map_in.actions["left"] = true
    end
  end
  if raw_in.key.released["left"] then
    if raw_in.key.down["right"] then
      map_in.actions["right"] = true
    else
      map_in.actions["stop"] = true
    end
  end

  -- Right Key
  if raw_in.key.pressed["right"] then
    if raw_in.key.down["left"] then
      map_in.actions["stop"] = true
    else
      map_in.actions["right"] = true
    end
  end
  if raw_in.key.released["right"] then
    if raw_in.key.down["left"] then
      map_in.actions["left"] = true
    else
      map_in.actions["stop"] = true
    end
  end
  
  -- Map Scale
  if raw_in.key.pressed["e"] then
    map_in.actions["grow"] = true
  end
  if raw_in.key.pressed["q"] then
    map_in.actions["shrink"] = true
  end
  
  return map_in
end


local player = gauge.entity.new{
  position = { x = 200, y = 200 },
  velocity = { x = 0, y = 0 },
  acceleration = { x = 0, y = g},
}
player.lifetime = 0

local update = player.update
player.update = function (dt)
  update(dt)
  player.lifetime = player.lifetime + dt
  
  -- camera
  local camera = gauge.state.get().camera
  local player = player.position()
  local dx = camera.position.x - player.x
  local dy = camera.position.y - player.y
  if math.abs(dx) > camera.max_distance then
    camera.position.x = camera.position.x - (dx * camera.speed)
  end
  if math.abs(dy) > camera.max_distance then
    camera.position.y = camera.position.y - (dy * camera.speed)
  end
end


gauge.event.subscribe("input",
  function (input)
    if input.actions.jump then
      if not player.falling then
        player.velocity({y = -jump_v})
        player.falling = true
      end
    end
    if input.actions.left then
      player.velocity({x = -walk_v})
    end
    if input.actions.right then
      player.velocity({x = walk_v})
    end
    if input.actions.stop then
      player.velocity({x = 0})
    end
  end
)

gauge.event.subscribe("input",
  function (input)
    if input.actions.grow then
      gauge.state.get().map.scale(0.5)
      local x = ((player.position().x + (player.width() / 2)) * 0.5) - (player.width() / 2)
      local y = ((player.position().y + player.height()) * 0.5) - player.height()
      player.position({x = x, y = y})
      local camera = gauge.state.get().camera
      camera.position.x = x
      camera.position.y = y
    end
    if input.actions.shrink then
      gauge.state.get().map.scale(2)
      local x = ((player.position().x + (player.width() / 2)) * 2) - (player.width() / 2)
      local y = ((player.position().y + player.height()) * 2) - player.height()
      player.position({x = x, y = y})
      local camera = gauge.state.get().camera
      camera.position.x = x
      camera.position.y = y
    end
  end
)
