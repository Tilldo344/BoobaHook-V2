_DEBUG = True




local screen_size = render.screen_size()

local visuals_ui = ui.create("Indicators", "Indicators")




ref = {
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    autopeek  = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),


}

-- fonts
local font = {
    tahoma = render.load_font('tahoma',16,'b')
}

local font2 = {
    tahoma = render.load_font('tahoma',13.5,'b')
}




-- paste

local screensize = render.screen_size() / 2

local offsetx = visuals_ui:slider("MinDmg x", -50, 50, 0, 1)
local offsety = visuals_ui:slider("MinDmg y", -50, 50, 0, 1)
local dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")


-- aspect ratio
group = ui.create("Visuals", "AspectRatio")

aspect_ratio_switch = group:switch("Aspect ratio", false)


-- hide radar
group = ui.create("Visuals", "hide radar")
radar = group:switch("HideRadar", false)




aspectratio_ref = aspect_ratio_switch:create()
aspect_ratio_slider = aspectratio_ref:slider("Value", 0, 20, 0, 0.1)


-- visuals

local indicator = visuals_ui:switch("Indicators ", false)
local testmin = visuals_ui:switch("MinDamage Indicator ", false)


-- esp




-- indicators

local function indicators()
    if indicator:get() then
        render.text(font.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 15), color(40, 62, 1733), 'c', 'BoobaHook.Lua')


     if ref.doubletap:get() then
        render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 29), color(153, 51, 255), 'c', 'DoubleTap')
     end

        if ref.hideshots:get() and ref.doubletap:get() then
            render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 43), color(153, 51, 255), 'c', 'Hideshot')
         elseif ref.hideshots:get() and not ref.doubletap:get() then 
            render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 29), color(153, 51, 255), 'c', 'Hideshot')
          
        end


        if ref.autopeek:get() and ref.doubletap:get() and ref.hideshots:get() then
            render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 57), color(153, 51, 255), 'c', 'Autopeek')

         elseif ref.autopeek:get() and not ref.hideshots:get() and ref.doubletap:get() then
            render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 43), color(153, 51, 255), 'c', 'Autopeek')

         elseif ref.autopeek:get() and not ref.hideshots:get() and not ref.doubletap:get() then 
            render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 29), color(153, 51, 255), 'c', 'Autopeek')

        elseif ref.autopeek:get() and not ref.doubletap:get() and ref.hideshots:get() then
            render.text(font2.tahoma, vector(screen_size.x/2 + 3, screen_size.y/2 + 43), color(153, 51, 255), 'c', 'Autopeek')

        end
          

        
    end
end



-- aspect ratio

events.createmove:set(function()
    if aspect_ratio_switch:get() then
        cvar.r_aspectratio:float(aspect_ratio_slider:get()/10)
    else
        cvar.r_aspectratio:float(0)
    end
end)


-- mindmg

local function mindmg2()
if testmin:get() then


    local player = entity.get_local_player()
    if player == nil then return end
    if player.m_iHealth > 0 then
        render.text(1,vector(screensize.x + offsetx:get(),screensize.y - offsety:get()),color(255,255,255),nil," "..dmg:get())
    end
 end
 

 
end






events.render:set(function(ctx)
    indicators()
    mindmg2()




end)














    



