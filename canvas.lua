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
    os.rename( system.pathForFile( self_path, self_dir ), system.pathForFile( self_path .. '.txt', self_dir ) )
    local path = system.pathForFile( self_path .. '.txt', self_dir )
    local file = io.open( path, 'rb' )
    if file then
      data = file:read('*a')
      io.close( file )
    end
    os.rename( system.pathForFile( self_path .. '.txt', self_dir ), system.pathForFile( self_path, self_dir ) )

    -- Create new file
    local self_name = tostring(math.random(111111111, 999999999))
    local path2 = system.pathForFile( self_name .. '.txt', system.DocumentsDirectory )
    local file2 = io.open( path2, 'wb' )
    if file2 then
      file2:write(data)
      io.close( file2 )

      os.rename( system.pathForFile( self_name .. '.txt', system.DocumentsDirectory ), system.pathForFile( self_name .. '.jpg', system.DocumentsDirectory ) )
    end

    -- Create new image
    if self_group then
      a = display.newImage( self_group, self_name .. '.jpg', system.DocumentsDirectory )
    else
      a = display.newImage( self_name .. '.jpg', system.DocumentsDirectory )
    end

    -- Set position
    if self_x or self_y then
      a.x, a.y = self_x, self_y
    end
    if self_width then
      a.width, a.height = self_width, self_height
    end

    -- Remove file
    timer.performWithDelay(100, function()
      os.remove( system.pathForFile( self_name .. '.jpg', system.DocumentsDirectory ) )
    end)
  end)
  return a
end

return canvas
