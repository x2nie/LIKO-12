local perpath = select(1,...) --The path to the GPU folder.
--/Peripherals/GPUN/

return function(config) --A function that creates a new GPU peripheral.
  
  --Create appdata directories:
  if not love.filesystem.getInfo("Shaders","directory") then
    love.filesystem.createDirectory("Shaders")
  end
  
  if not love.filesystem.getInfo("Screenshots","directory") then
    love.filesystem.createDirectory("Screenshots")
  end
  
  if not love.filesystem.getInfo("GIF Recordings","directory") then
    love.filesystem.createDirectory("GIF Recordings")
  end
  
  --GPU: the non-yielding APIS of the GPU.
  --yGPU: the yield APIS of the GPU.
  --GPUKit: Shared data between the GPU files.
  --DevKit: Shared data between the peripherals.
  local GPU, yGPU, GPUKit, DevKit = {}, {}, {}
  
  local function loadModule(name)
    love.filesystem.load(perpath.."modules/"..name..".lua")(config, GPU, yGPU, GPUKit, DevKit)
  end
  
  loadModule("window")
  
end