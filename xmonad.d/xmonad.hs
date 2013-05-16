import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad =<< xmobar defaultConfig
    {
      terminal = "urxvt",
      normalBorderColor = "#839496",
      focusedBorderColor = "#6c71c4",
      manageHook = manageDocks <+> manageHook defaultConfig,
      layoutHook = avoidStruts  $  layoutHook defaultConfig,
      modMask = controlMask .|. mod1Mask
    }
