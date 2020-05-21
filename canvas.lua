local canvas = {}
 
function canvas.newImage( self_group, self_path, self_dir, self_x, self_y, self_width, self_height )
    if not self_path then
      self_path, self_group, self_dir = self_group, nil, system.ResourceDirectory
    elseif not self_dir then
      self_path, self_dir, self_group = self_group, self_path, nil
    end
    local data
    local file = io.open( system.pathForFile( self_path, self_dir ), 'rb' )
    if file then
      data = file:read('*a')
      io.close( file )
    end
    local self_name = tostring(math.random(-999999999, 999999999))
    local file = io.open( system.pathForFile( self_name, system.TemporaryDirectory ), 'wb' )
    if file then
      file:write(data)
      io.close( file )
    end
    local a = display.newImage( self_group, self_name, system.TemporaryDirectory )
    if self_x or self_y then
      a.x, a.y = self_x, self_y
    end
    if self_width then
      a.width, a.height = self_width, self_height
    end
    os.remove( system.pathForFile( self_name, system.TemporaryDirectory ) )
end

return canvas
