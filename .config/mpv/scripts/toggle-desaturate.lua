local enabled = false

mp.register_script_message("toggle-desaturate", function()
    if enabled then
        mp.commandv("apply-profile", "desaturate", "restore")
        enabled = false
        mp.osd_message("Desaturate: off")
    else
        mp.commandv("apply-profile", "desaturate", "apply")
        enabled = true
        mp.osd_message("Desaturate: on")
    end
end)
