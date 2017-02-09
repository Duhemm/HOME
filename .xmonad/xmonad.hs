import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog

baseConfig = desktopConfig
myConfig = baseConfig { terminal = "xterm", modMask = mod4Mask }
myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
toggleStrutsKey XConfig { XMonad.modMask = mod4Mask } = (mod4Mask, xK_b)

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

