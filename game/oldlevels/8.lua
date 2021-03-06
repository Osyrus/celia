return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 26,
  height = 16,
  tilewidth = 128,
  tileheight = 128,
  properties = {
    ["bgm"] = "ost/hedgemaze.ogg",
    ["parallax1"] = "Background_Maze_Layer1.png",
    ["parallax2"] = "Background_Maze_Layer2.png",
    ["parallax3"] = "Background_Maze_Layer3.png",
    ["wrap"] = "true"
  },
  tilesets = {
    {
      name = "default",
      firstgid = 1,
      tilewidth = 128,
      tileheight = 128,
      spacing = 0,
      margin = 0,
      image = "HedgeMaze.png",
      imagewidth = 1152,
      imageheight = 640,
      properties = {},
      tiles = {
        {
          id = 15,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 16,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 31,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 32,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 35,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 37,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 38,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 39,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 40,
          properties = {
            ["solid"] = "true"
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 26,
      height = 16,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        34, 34, 34, 34, 34, 0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 34, 0, 0, 0, 0, 0, 0,
        34, 34, 34, 34, 34, 0, 0, 34, 34, 34, 34, 34, 34, 34, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 34, 34, 34, 0, 0, 0, 0, 34, 34, 34, 34, 0, 0, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 34, 34, 34, 0, 0, 0, 0, 34, 34, 34, 34, 0, 0, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 34, 34, 34, 0, 0, 0, 0, 34, 34, 34, 34, 34, 0, 0, 0, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 34, 34, 34, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0,
        4, 34, 34, 34, 2, 3, 4, 34, 34, 34, 34, 34, 34, 0, 0, 0, 0, 0, 2, 3, 4, 34, 34, 34, 2, 3,
        13, 34, 34, 34, 11, 12, 13, 34, 34, 34, 34, 34, 0, 0, 0, 0, 0, 0, 11, 12, 13, 34, 34, 34, 11, 12,
        22, 34, 34, 34, 20, 21, 22, 34, 34, 34, 34, 34, 34, 0, 0, 0, 0, 0, 20, 21, 22, 34, 34, 34, 20, 21,
        31, 34, 8, 34, 29, 30, 31, 34, 34, 34, 34, 34, 34, 29, 0, 29, 0, 0, 29, 30, 31, 34, 25, 25, 29, 30,
        40, 38, 17, 38, 38, 39, 40, 34, 34, 34, 34, 34, 34, 0, 0, 0, 0, 0, 38, 39, 40, 38, 38, 38, 38, 39,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "Object Layer 1",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "shrinker",
          x = 896,
          y = 1792,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "shrinker",
          x = 1152,
          y = 1792,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "shrinker",
          x = 1920,
          y = 1792,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "shrinker",
          x = 1408,
          y = 1792,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "shrinker",
          x = 1664,
          y = 1792,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "grower",
          x = 640,
          y = 1664,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "player_spawn",
          x = 384,
          y = 1664,
          width = 128,
          height = 128,
          properties = {}
        },
        {
          name = "",
          type = "door",
          x = 2560,
          y = 1536,
          width = 256,
          height = 256,
          properties = {}
        },
        {
          name = "",
          type = "shrinker",
          x = 2176,
          y = 1792,
          width = 128,
          height = 128,
          properties = {}
        }
      }
    }
  }
}
