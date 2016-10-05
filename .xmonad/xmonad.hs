import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Grid
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import qualified XMonad.StackSet as SS
import XMonad.Util.Run(spawnPipe,runInTerm)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO
import Data.Ratio ((%))
import XMonad.Hooks.SetWMName

-- Three layouts used: tall, mirror tall and grid.  Plus sets up toggle for fullscreen of active window
myTiled = Tall nmaster delta ratio 
  where
  	nmaster = 1
	ratio = 1/2
	delta = 3/100
-- mylayouts = avoidStruts ( onWorkspace "video" Full $ onWorkspace "chat" chatLayout $ mkToggle ( single FULL ) ( myTiled ||| horizon ||| Grid ) )
mylayouts = avoidStruts ( onWorkspace "video" Full $ mkToggle ( single FULL ) ( myTiled ||| horizon ||| Grid ) )
  where
	chatLayout = withIM (18/100) (Role "buddy_list") (spacing 8 Grid)
	horizon = Mirror myTiled

myNormalBorderColor = "#444444"

xmobarEscape = concatMap doubleLts
  where doubleLts '<' = "<<"
        doubleLts x   = [x]

clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                 (i,ws) <- zip [1..(length l)] l,
                 let n = i ]

-- Define custom workspace names and numbered extras
myWorkSpaces = clickable . map xmobarEscape $ xs
        where xs = ["code", "term", "data", "slack", "web"] ++ (map show [6..8]) ++ ["social"]

-- Define my custom logHook
myLogHook bar = dynamicLogWithPP $ defaultPP
	{ ppCurrent = xmobarColor "#b2b81a" "" . pad,
	  ppVisible = xmobarColor "#9e0505" "" . pad,
	  ppHidden  = xmobarColor "#909090" "" . pad,
	  ppLayout  = xmobarColor "#909090" "" .  
	  							(\x -> case x of
										"Tall" -> " | "
										"Mirror Tall" -> " - "
										"Grid" -> " + "
										--"IM Spacing 8 Grid" -> " * "
										-- ASCII box character, in case this ever breaks
										"Full" -> " ■ "
										_ -> x
							    ),
	  ppUrgent  = xmobarColor "#ff0000" "" . pad,
	  ppTitle   = xmobarColor "#9e0505" "" . shorten 50 . pad,
	  ppWsSep   = "",
	  ppSep     = ":",
	  ppOutput  = hPutStrLn bar
	}

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ ewmh defaultConfig {
	  -- This is a weirdly hacky workaround for Java GUI applications; JRE doesn't recognise XMonad properly
	  -- so it needs to be "renamed" so JRE code works properly.
	  startupHook = setWMName "LG3D",
	  -- handles full screen things being properly full screen
	  manageHook = manageDocks <+> composeOne [-- className =? "Pidgin" -?> doShift "chat", 
												title =? "MOC" -?> doShift "music",
	  											isFullscreen -?> doFullFloat
	  ] <+> manageHook defaultConfig,
	  -- Add custom workspaces
	  workspaces = myWorkSpaces,
	  -- Add custom layouts
	  layoutHook = mylayouts,
	  -- Do output to XMobar
	  logHook = myLogHook xmproc,
	  -- Window border colours; only for unfocused so I can override it to black
	  normalBorderColor = myNormalBorderColor,
	  -- Terminal?
	  XMonad.terminal = "xterm -class XTerm-color",
	  -- Change 'mod' key to super/windows/meta
	  modMask = mod4Mask
  	  } `additionalKeys`
	  -- Lock screen with screensaver
	  [ ((mod4Mask .|. shiftMask , xK_l), spawn "xscreensaver-command -lock"), 
	    ((noModMask, xK_Print), spawn "scrot ~/dropbox/Public/screenshots/%Y-%m-%d-%T-shot.png"),
	  -- Application shortcuts
	    ((mod4Mask, xK_o), spawn "libreoffice"),
	    ((mod4Mask, xK_c), spawn "google-chrome"),
		((mod4Mask .|. shiftMask , xK_m), spawn "xterm -class XTerm-color -title MOC -name MOC -e mocp"),
		--((mod4Mask .|. shiftMask , xK_s), spawn "steam"),
        -- work machine, so switching out Steam for Slack
		((mod4Mask .|. shiftMask , xK_s), spawn "slack"),
		((mod4Mask, xK_s), spawn "skype"),
	  --((mod4Mask , xK_e), spawn "krusader"),
		((mod4Mask, xK_v), spawn "vlc"),
		((mod4Mask, xK_p), spawn "pidgin"),
	  -- Additional binding for switching master window
	    ((mod4Mask .|. shiftMask , xK_a), windows SS.swapMaster),
		((mod4Mask .|. shiftMask , xK_f), sendMessage $ Toggle FULL),
	  -- Keys to control volume
	    ((shiftMask .|. mod1Mask, xK_Return), spawn "/home/zaphod/.xmobin/doMute" ),
	    ((shiftMask .|. mod1Mask, xK_Down), spawn "/home/zaphod/.xmobin/volDown"),
		((shiftMask .|. mod1Mask, xK_Up), spawn "/home/zaphod/.xmobin/volUp"),
	  -- Media keys
	    ((shiftMask .|. mod1Mask, xK_space), spawn "/home/zaphod/.xmobin/pause"),
		((noModMask, xF86XK_AudioStop), spawn "/home/zaphod/.xmobin/stop"),
		((shiftMask .|. mod1Mask, xK_Left), spawn "/home/zaphod/.xmobin/previous"),
		((shiftMask .|. mod1Mask, xK_Right), spawn "/home/zaphod/.xmobin/next") ]
