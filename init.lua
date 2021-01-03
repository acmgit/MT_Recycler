--[[
            Recycler
            Written by (?) A.C.M.
            License: Example for Free

]]--

recycler = {}


--[[
    **************************************************************
    **                    Table for Items                       **
    **************************************************************
]]--

-- Table with default Mats to recycle
recycler.item = {
                    ["wool:white"]          = "farming:cotton",
                    ["default:furnace"]     = "default:cobble 4",
                    ["default:pick_stone"]  = {"default:stick", "default:cobble"},
                }


--[[
    **************************************************************
    **                    Core-Function for Recycling           **
    **************************************************************
]]--

-- Function of the Recycler
function recycler.work(to_recycle)
local mats = nil                                    -- Result can be a String or Table!!!
    if(recycler.item[to_recycle]) then              -- Exists the Item in the List?
        mats = recycler.item[to_recycle]         
                                   
    end -- if(recycler.item
    
    return mats                                     -- if the Item isn't in the List, it's not recycleable
    
end -- function recycler.work

--[[
    **************************************************************
    **                Register-Function for Recycling           **
    **************************************************************
]]--

function recycler.register_item(Itemname, Material) -- Material can be a string or a table
    local mats = recycler.item[Itemname]            -- Exist the Item?
    
    if(mats) then
        print("Item exists or do you want to change it?")
        return
             
    else
        recycler.item[Itemname] = Material
    
    end -- if(mats)

end -- function recycler.register_item

--[[
    **************************************************************
    **                Check mats for later                      **
    **************************************************************
]]--
    
function recycler.check_mats(mat)
    if(type(mat) == "string") then                           -- Only 1 Mat to give
        print(mat)

    elseif(type(mat) == "table") then                      -- More then 1 Mat to give back.
        for key, value in pairs(mat) do
        print(value)
      
        end -- for
           
    else
        print("Item is not recycleable!!")

    end -- if(is_text
    print("------------------------")
    
end -- function check_mats

--[[
    **************************************************************
    **                    Testcode                              **
    **************************************************************
]]--

local item = "wool:white"
mats = recycler.work(item)
recycler.check_mats(mats)

item = "default:pick_stone"
mats = recycler.work(item)
recycler.check_mats(mats)

recycler.register_item("default:chest", "default:wood 3")
item = "default:chest"
mats = recycler.work(item)
recycler.check_mats(mats)

recycler.register_item("default:shovel_steel", {"default:stick", "default:steel_ingot"})
item = "default:shovel_steel"
mats = recycler.work(item)
recycler.check_mats(mats)
                                       
            
