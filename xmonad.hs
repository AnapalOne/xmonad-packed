---------------------------------------------------------
-- XMonad Config by Anapal
---------------------------------------------------------

import XMonad
import Data.Monoid
import System.Exit
import System.IO
import Graphics.X11.ExtraTypes.XF86

import XMonad.Config.Desktop

import XMonad.Actions.GridSelect
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatKeys

import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
--import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns

import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicProperty
--import XMonad.Hooks.ScreenCorners --have to configure myappgrid, mygridconfig, mycolorizer

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M



---------------------------------------------------------
-- Configs
---------------------------------------------------------

myTerminal              = "alacritty"
myModMask               = mod4Mask -- win key
myBorderWidth           = 3


myNormalBorderColor = "#849DAB"
myFocusedBorderColor = "#24788F"

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

toggleFloat :: Window -> X ()
toggleFloat w = windows
   ( \s -> if M.member w (W.floating s)
           then W.sink w s
           else (W.float w (W.RationalRect (0.01) (0.04) (0.55) (0.55)) s) )

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
   where
           doubleLts '<' = "<<"
           doubleLts x   = [x]



---------------------------------------------------------
-- Workspaces
---------------------------------------------------------

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape) 
          -- $ ["ter","doc","www","dev","vid","img","chat","mus","art"]
           $ ["\xf120", "\xf718", "\xe743", "\xf121", "\xf008", "\xf03e", "\xf1d7", "\xf886", "\xf1fc" ]
    where
          clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                        (i,ws) <- zip [1..9] l,
                        let n = i ]



---------------------------------------------------------
-- Key Binds
-- > modm = WinKey
--
-- Do xev | sed -ne '/^KeyPress/,/^$/p' for key maps.
---------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- //windows
    [ ((modm,            xK_BackSpace), kill)                               --close focused window
    , ((modm,               xK_space ), sendMessage NextLayout)             --rotate layout
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) --reset layout
    , ((modm,               xK_n     ), refresh)                            --resize window to correct size
    , ((modm,               xK_Tab   ), windows W.focusDown)                --rotate focus between windows
    , ((modm,               xK_m     ), windows W.focusMaster )             --focus to master window
    , ((modm,               xK_Return), windows W.swapMaster  )             --swap focus master and window
    , ((modm .|. shiftMask, xK_Right ), windows W.swapDown  )               --swap focused window to next window
    , ((modm .|. shiftMask, xK_Left  ), windows W.swapUp    )               --swap focused window to prev window
    , ((modm,               xK_comma ), sendMessage Shrink)                 --shrink master window
    , ((modm,               xK_period), sendMessage Expand)                 --expand master window

    -- //floating windows
    , ((modm .|. shiftMask, xK_Tab   ), withFocused toggleFloat)                        --toggle between tiled and floating window
    , ((modm,               xK_Up    ), withFocused (keysMoveWindow (0,-10)))           --move floating window
    , ((modm,               xK_Down  ), withFocused (keysMoveWindow (0,10)))            --
    , ((modm,               xK_Left  ), withFocused (keysMoveWindow (-10,0)))           --
    , ((modm,               xK_Right ), withFocused (keysMoveWindow (10,0)))            --
    , ((modm .|. controlMask, xK_Up    ), withFocused (keysResizeWindow (0,-10) (0,0))) --resize floating window
    , ((modm .|. controlMask, xK_Down  ), withFocused (keysResizeWindow (0,10) (0,0)))  --
    , ((modm .|. controlMask, xK_Left  ), withFocused (keysResizeWindow (-10,0) (0,0))) --
    , ((modm .|. controlMask, xK_Right ), withFocused (keysResizeWindow (10,0) (0,0)))  --

    -- //system commands
    , ((modm,               xK_b     ), sendMessage ToggleStruts)                      --toggle xmobar
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))                     --logout xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")  --recompiles xmonad
    , ((modm .|. shiftMask, xK_slash ), namedScratchpadAction myScratchpads "help")    -- show list of programs
    , ((modm .|. shiftMask, xK_F1    ), spawn "systemctl hibernate")
    , ((0,     xF86XK_MonBrightnessUp), spawn "lux -a 10%")
    , ((0,   xF86XK_MonBrightnessDown), spawn "lux -s 5%")
    , ((0,    xF86XK_AudioRaiseVolume), spawn "pamixer -i 5")
    , ((0,    xF86XK_AudioLowerVolume), spawn "pamixer -d 5")
    , ((0,           xF86XK_AudioMute), spawn "pamixer -t")

    -- // programs
    , ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)  --open terminal
    , ((modm,               xK_Print ), spawn "flameshot gui")         --equivelent to prntscr
    , ((modm,               xK_r     ), spawn "dmenu_run")             --run program
    , ((modm .|. shiftMask, xK_r     ), spawn "gmrun")                 --
    
    -- // scratchpad
    , ((modm .|. controlMask, xK_Return), namedScratchpadAction myScratchpads "ScrP_alacritty")
    , ((modm,                  xK_grave), namedScratchpadAction myScratchpads "ScrP_htop")
    , ((modm .|. shiftMask,    xK_grave), namedScratchpadAction myScratchpads "ScrP_ncdu")
    , ((modm .|. controlMask, xK_n     ), namedScratchpadAction myScratchpads "ScrP_vim")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
 


---------------------------------------------------------
-- Layouts
---------------------------------------------------------

myLayout = avoidStruts $ smartBorders
        (noBorders Full ||| tiled ||| Mirror tiled ||| threecol ||| Mirror threecol ||| Grid ||| spiral (6/7))
  where
     tiled = Tall nmaster delta ratio
     nmaster = 1
     delta = 3/100
     ratio = 1/2
     threecol = ThreeCol cnmaster cdelta cratio
     cnmaster = 1
     cdelta = 3/100
     cratio = 1/2



---------------------------------------------------------
-- Scratchpads
---------------------------------------------------------

myScratchpads = 
         [ NS "ScrP_alacritty" "alacritty -t scratchpad" (title =? "scratchpad") floatScratchpad
         , NS "ScrP_htop" "alacritty -t htop -e htop" (title =? "htop") floatScratchpad
         , NS "ScrP_vim" "alacritty -t vim -e vim" (title =? "vim") floatScratchpad
         , NS "ScrP_ncdu" "alacritty -t ncdu -e bash -c 'ncdu /'" (title =? "ncdu") floatScratchpad
         , NS "help" "~/.config/xmonad/scripts/help.sh" (title =? "list of programs") floatScratchpad
         ]
    where 
       floatScratchpad = customFloating $ W.RationalRect l t w h
                where
                    h = 0.9
                    w = 0.9
                    l = 0.95 -h
                    t = 0.95 -w



---------------------------------------------------------
-- Hooks
---------------------------------------------------------

        --Parameters for certain programs
        -- > doFloat to open in floating mode
        -- > doShift to open only in a specific workspace
myManageHook :: Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
        [ title     =? "alacritty"      --> doShift "<action=xdotool key super+1>\xf120</action>" --ter
        , className =? "Subl"           --> doShift "<action=xdotool key super+2>\xf718</action>" --txt
        , className =? "libreoffice-startcenter" --> doShift "<action=xdotool key super+2>\xf718</action>"
        , className =? "Chromium"       --> doShift "<action=xdotool key super+3>\xe743</action>" --www
        , className =? "Audacity"       --> doShift "<action=xdotool key super+4>\xf121</action>" --dev
        , className =? "GitHub Desktop" --> doShift "<action=xdotool key super+4>\xf121</action>"
        , className =? "vlc"            --> doShift "<action=xdotool key super+5>\xf008</action>" --vid
        , className =? "Gimp"           --> doShift "<action=xdotool key super+6>\xf03e</action>" --img
        , className =? "Mirage"         --> doShift "<action=xdotool key super+6>\xf03e</action>" 
        , className =? "discord"        --> doShift "<action=xdotool key super+7>\xf1d7</action>" --chat
        , className =? "krita"          --> doShift "<action=xdotool key super+9>\xf1fc</action>" --art
        , className =? "Mirage"         --> doFloat
        ]

spotifyWindowNameFix = dynamicPropertyChange "WM_NAME" (title =? "Spotify" --> doShift "<action=xdotool key super+8>\xf886</action>") --mus

        --event handling
myEventHook = fullscreenEventHook <+> spotifyWindowNameFix

        --Executes whenever xmonad starts
myStartupHook = do
        spawnOnce "nitrogen --restore &"
        spawnOnce "picom --vsync &"
        spawnOnce "~/.config/xmonad/scripts/startup_screen.sh &"
        spawnOnce "xsetroot -cursor_name left_ptr"
        spawnOnce "libinput-gestures &"



---------------------------------------------------------
-- XMonad Main
---------------------------------------------------------

main = do
   xmproc <- spawnPipe "xmobar -x 0 /home/anapal/.xmobarrc/xmobar"
   xmonad $ docks desktopConfig
        { terminal           = myTerminal
        , modMask            = myModMask
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor

        , keys               = myKeys
        -- , mouseBindings	     = myMouseBinds

        , layoutHook         = myLayout
        , manageHook         = myManageHook <+> namedScratchpadManageHook myScratchpads
        , handleEventHook    = spotifyWindowNameFix <+> myEventHook
        , logHook            = dynamicLogWithPP . namedScratchpadFilterOutWorkspacePP $ def
                                   { ppOutput = hPutStrLn xmproc
                                   , ppCurrent = xmobarColor "#4381fb" "" . wrap "[" "]"
                                   , ppVisible = xmobarColor "#4381fb" ""
                                   , ppHidden = xmobarColor "#d1426e" "" . wrap "*" ""
                                   , ppHiddenNoWindows = xmobarColor "#061d8e" ""
                                   , ppTitle = xmobarColor "#ffffff" "" . shorten 60
                                   , ppSep = "<fc=#666666> | </fc>"
                                   , ppWsSep = "<fc=#666666> . </fc>"
                                   , ppExtras = [windowCount]
                                   , ppOrder = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                                }

        , startupHook        = myStartupHook
     }