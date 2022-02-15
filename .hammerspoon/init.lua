hs.window.animationDuration = 0
units = {
  left30        = { x = 0.00, y = 0.00, w = 0.35, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  left60        = { x = 0.00, y = 0.00, w = 0.60, h = 1.00 },
  left70        = { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
  right30       = { x = 0.70, y = 0.00, w = 0.30, h = 1.00 },
  right40       = { x = 0.60, y = 0.00, w = 0.40, h = 1.00 },
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  right70       = { x = 0.35, y = 0.00, w = 0.65, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upleft70      = { x = 0.00, y = 0.00, w = 0.70, h = 0.50 },
  botleft70     = { x = 0.00, y = 0.50, w = 0.70, h = 0.50 },
  upright30     = { x = 0.70, y = 0.00, w = 0.30, h = 0.50 },
  botright30    = { x = 0.70, y = 0.50, w = 0.30, h = 0.50 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

mash = { 'cmd', 'ctrl', 'alt' }
hs.hotkey.bind(mash, 'Left',  function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
hs.hotkey.bind(mash, 'Right', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
hs.hotkey.bind(mash, 'l',     function() hs.window.focusedWindow():move(units.right70,    nil, true) end)
hs.hotkey.bind(mash, 'h',     function() hs.window.focusedWindow():move(units.left30,     nil, true) end)
hs.hotkey.bind(mash, 'k',     function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'j',     function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, ']',     function() hs.window.focusedWindow():move(units.right40,    nil, true) end)
hs.hotkey.bind(mash, '[',     function() hs.window.focusedWindow():move(units.left60,     nil, true) end)
hs.hotkey.bind(mash, ';',     function() hs.window.focusedWindow():move(units.botleft70,  nil, true) end)
hs.hotkey.bind(mash, "'",     function() hs.window.focusedWindow():move(units.botright30, nil, true) end)
hs.hotkey.bind(mash, 'm',     function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)
