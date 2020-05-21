local canvas = {}

function canvas.newImage( self_group, self_path, self_dir, self_x, self_y, self_width, self_height )
  local a = display.newRect(0,0,0,0)
  pcall(function()
    -- Sorting
    if not self_path then
      self_path, self_dir = self_group, system.ResourceDirectory
    elseif not self_dir then
      if type(self_group) == 'string' then
        self_path, self_dir = self_group, self_path
      else
        self_dir = system.ResourceDirectory
      end
    end

    -- Read file
    local data
    os.rename( self_path, self_path .. '.txt' )
    local file = io.open( system.pathForFile( self_path .. '.txt', self_dir ), 'rb' )
    if file then
      data = file:read('*a')
      io.close( file )
      os.rename( self_path .. '.txt', self_path )
    end

    -- Create new file
    local self_name = tostring(math.random(-999999999, 999999999))
    local file = io.open( system.pathForFile( self_name, system.TemporaryDirectory ), 'wb' )
    if file then
      file:write(data)
      io.close( file )
    end

    -- Create new image
    if self_group then
      a = display.newImage( self_group, self_name, system.TemporaryDirectory )
    else
      a = display.newImage( self_name, system.TemporaryDirectory )
    end

    -- Set position
    if self_x or self_y then
      a.x, a.y = self_x, self_y
    end
    if self_width then
      a.width, a.height = self_width, self_height
    end

    -- Remove file
    os.remove( system.pathForFile( self_name, system.TemporaryDirectory ) )
  end)
  return a
end

return canvas
