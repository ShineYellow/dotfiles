require 'modules.shortcut'

hs.fnutils.each(applications, function(item)
    hs.hotkey.bind(item.prefix, item.key, item.message, function()
        toggleAppByBundleId(item.bundleId)
    end)
end)

function toggleAppByBundleId(appBundleID)

   hs.application.launchOrFocusByBundleID(appBundleID)

end
