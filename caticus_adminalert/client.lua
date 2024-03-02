RegisterNetEvent('adminAnnounce:showMessage', function(message)
    SendNUIMessage({
        type = "adminAnnounce",
        message = message
    })
    PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false)

end)
