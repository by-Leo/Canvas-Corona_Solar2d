# Canvas-Corona_Solar2d
A module for those who need to upload images of Corona and Solar2d without caching

# Initialization
```lua
local canvas = require 'canvas'
```

# Use variations
```lua 
canvas.newImage( path ) 
```
```lua
canvas.newImage( path, dir ) 
```
```lua
canvas.newImage( group, path, dir ) 
```
```lua
canvas.newImage( group, path, dir, x, y ) 
```
```lua
canvas.newImage( group, path, dir, x, y, width, height ) 
```

# Examples
```lua
canvas.newImage( 'image.png' ) 
```
```lua
canvas.newImage( 'image.png', system.DocumentsDirectory ) 
```
```lua
local menu_group = display.newGroup()
canvas.newImage( menu_group, 'image.png', system.DocumentsDirectory ) 
```
```lua
local menu_group = display.newGroup()
local obj_x, obj_y = 360, 640
canvas.newImage( menu_group, 'image.png', system.DocumentsDirectory, obj_x, obj_y ) 
```
```lua
local menu_group = display.newGroup()
local obj_x, obj_y = 360, 640
local obj_w, obj_h = 400, 300
canvas.newImage( menu_group, 'image.png', system.DocumentsDirectory, obj_x, obj_y, obj_w, obj_h ) 
```
