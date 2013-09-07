waxClass{"AppDelegate", protocols = {"UIApplicationDelegate"}}


function turnRandom()
math.randomseed( os.time() )
red = math.random()
green = math.random()
blue = math.random()
local frame = UIScreen:mainScreen():bounds()
self.window = UIWindow:initWithFrame(frame)
self.window:setBackgroundColor(UIColor:colorWithRed_green_blue_alpha(red, green, blue, 1))
self.window:makeKeyAndVisible()
end

function applicationDidFinishLaunching(self, application)
  local frame = UIScreen:mainScreen():bounds()
  self.window = UIWindow:initWithFrame(frame)
  self.window:makeKeyAndVisible()

  turnRandom()
  NSTimer:scheduledTimerWithTimeInterval_target_selector_userInfo_repeats(0.5,self,"turnRandom:",nil,true)


end