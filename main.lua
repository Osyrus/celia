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
  
  if raw_in.key.pressed["down"] then
    map_in.actions["zoomOut"] = true
  end
  
  if raw_in.key.released["down"] then
    map_in.actions["zoomIn"] = true
  end
  
  if raw_in.key.pressed["r"] then
    map_in.actions["reset"] = true
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

local littleTheme = gauge.music.new({file="little.ogg", volume=0, loop=true})
local bigTheme = gauge.music.new({file="big.ogg", volume=0, loop=true})
littleTheme.play()
bigTheme.play()

gauge.entity.registerType("player", {
  acceleration = { x = 0, y = g },
  width=30,
  height=30,
  scaled=false,
  update = function (object, self, dt)
    -- camera
    local camera = gauge.state.get().camera
    local player_x = nil
    local player_y = nil
    if camera.zoom then
      player_x = -object.position().x
      player_y = -object.position().y
    else
      player_x = object.position().x
      player_y = object.position().y
    end
    local dx = camera.position.x - player_x
    local dy = camera.position.y - player_y
    if math.abs(dx) > dx * camera.speed then
      camera.position.x = camera.position.x - (dx * camera.speed)
    else
      camera.position.x = player_x
    end
    if math.abs(dy) > dx * camera.speed then
      camera.position.y = camera.position.y - (dy * camera.speed)
    else
      camera.position.y = player_y
    end
    
    -- music
    if gauge.entity.scale > 1/2 then
      littleTheme.volume(1)
      bigTheme.volume(0)
    elseif gauge.entity.scale < 1/4 then
      littleTheme.volume(0)
      bigTheme.volume(1)
    else
      local s = ((1 / gauge.entity.scale) - 2) / 2
      littleTheme.volume(1 - s)
      bigTheme.volume(s)
    end
  end
})

gauge.event.notify("loadMap", {file="test_level.lua"})

local spawn = gauge.entity.getList({type="player_spawn"})[1]
local player = gauge.entity.new({
  type="player",
  position={x=spawn.position().x, y=spawn.position().y},
})

gauge.event.subscribe("input",
  function (input)
    if input.actions.jump then
      if not player.falling then
        player.velocity({y = -jump_v*math.sqrt(gauge.entity.scale)})
        player.falling = true
      end
    end
    if input.actions.left then
      player.velocity({x = -walk_v*math.sqrt(gauge.entity.scale)})
    end
    if input.actions.right then
      player.velocity({x = walk_v*math.sqrt(gauge.entity.scale)})
    end
    if input.actions.stop then
      player.velocity({x = 0})
    end
  end
)

local scale = gauge.entity.scale

--[[gauge.event.subscribe("input",
  function (input)
    if input.actions.grow then
      scale = 1/(1/scale + 1)
      tween(1,gauge.entity,{scale = scale})
    end
    if input.actions.shrink then
      scale = 1/(1/scale - 1)
      tween(1,gauge.entity,{scale = scale})
    end
  end
)]]

local scaleTween = nil

gauge.event.subscribe("entityCollision",
  function (entities)
    if entities[1] == player then
      if entities[2].type() == "grower" then
        tween.stop(scaleTween)
        scale = 1/(1/scale + 1)
        scaleTween = tween(1,gauge.entity,{scale = scale})
        entities[2].delete = true
      end
      if entities[2].type() == "shrinker" then
        tween.stop(scaleTween)
        scale = 1/(1/scale - 1)
        scaleTween = tween(1,gauge.entity,{scale = scale})
        entities[2].delete = true
      end
    end
  end
)

local cameraTween = nil
gauge.event.subscribe("input",
  function (input)
    if input.actions.zoomOut then
      gauge.state.get().camera.zoom = true
      local p = player.position()
      tween.stop(cameraTween)
      cameraTween = tween(1, gauge.state.get().camera,{
        scale = 0.2
      })
    end
  end
)

gauge.event.subscribe("input",
  function (input)
    if input.actions.zoomIn then
      gauge.state.get().camera.zoom = false
      local p = player.position()
      tween.stop(cameraTween)
      cameraTween = tween(1, gauge.state.get().camera,{
        scale = 1
      })
    end
  end
)

gauge.event.subscribe("input", function (input)
  if input.actions.reset then
    tween.stop(scaleTween)
    gauge.state.get().map.reset()
    player = gauge.entity.new({
      type="player",
      position={x=spawn.position().x, y=spawn.position().y},
    })
  end
end)
