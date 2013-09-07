import XMonad hiding ( (|||) )  -- don't use the normal ||| operator

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.NamedScratchpad

import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.BoringWindows
import XMonad.Layout.LayoutCombinators 
import XMonad.Layout.Named

import XMonad.Actions.NoBorders
import XMonad.Actions.TopicSpace

import XMonad.Util.EZConfig
import XMonad.ManageHook

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myManageHook = composeAll
    [ className =? "MPlayer" --> nonFloating
    ]

scratchpads =
  [ NS "notes" "xterm -fa pragmata -fs 8 -e vi ~/Dropbox/good.txt" (title =? "vi") defaultFloating
  ]

main = do
  xmonad $ defaultConfig
          { manageHook         = manageDocks <+> myManageHook <+> namedScratchpadManageHook scratchpads
          , layoutHook         = avoidStruts $ smartBorders myLayout
          , workspaces         = myTopics
          , modMask            = mod1Mask
          , borderWidth        = 3
          , terminal           = "xterm -ls +sb -fb fixed"
          , normalBorderColor  = "#262626"
          , focusedBorderColor = "#ff8700" 
          } `additionalKeysP` (myKeys defaultConfig)
    where
      myLayout = boringWindows (tiled ||| Full ||| Mirror tiled ||| Full)
        where
          tiled = ResizableTall nmaster delta ratio []
          nmaster = 1
          ratio = 1/2
          delta = 3/100

      myTopics =
        [ "chat"
        , "office"
        , "monitor"
        , "4" , "5" , "6" , "7" , "8" , "9"
        ]
      myTopicConfig = TopicConfig
        { topicDirs = M.fromList $ []
        ,	defaultTopicAction = const $ xterm >*> 2
        , defaultTopic = "chat"
        , maxTopicHistory = 10
        , topicActions = M.fromList $
          [ ("chat",    xterm >> terminal "irssi")
          , ("monitor", terminal "ssh -t rs mumtop" >>
                        terminal "ssh -t rs mumtop")
          ]
        }

      xterm :: X ()
      xterm = do
        dir <- currentTopicDir myTopicConfig
        spawn $ "xterm -ls" 

      tmux :: X ()
      tmux = do
        dir <- currentTopicDir myTopicConfig
        spawn $ "xterm -ls -e tmux -2 new-session" 

      terminal :: String -> X ()
      terminal app = do
        dir <- currentTopicDir myTopicConfig
        spawn $ "xshell " ++ app

      myKeys conf@(XConfig {XMonad.modMask = modm}) =
        [ ("M-u"  , sendMessage MirrorShrink)
        , ("M-m"  , sendMessage MirrorExpand)
        , ("M-b"  , sendMessage ToggleStruts)
        , ("M-j"  , focusDown)
        , ("M-k"  , focusUp)
        , ("M-g"  , withFocused toggleBorder)
        , ("M-S-t", tmux)
        , ("M-S-g", markBoring)
        , ("M-S-b", clearBoring)
        , ("M-S-h", namedScratchpadAction scratchpads "notes")
        , ("M-a"  , currentTopicAction myTopicConfig)
        ]
        ++
        [ ("M-"++m++[k], windows $ f i)
        | (i, k) <- zip myTopics "123456789" 
        , (f, m) <- [(W.greedyView, "")]]
        ++
        [ ("M-"++m++[k], windows $ f i)
        | (i, k) <- zip myTopics "123456789" 
        , (f, m) <- [(W.shift, "S-")]]
        ++
        [ ("M-"++m++[k], screenWorkspace sc >>= flip whenJust (windows . f))
        | (k, sc) <- zip "wre" [0..]
        , (f, m) <- [(W.view, "")]]
        ++
        [ ("M-"++m++[k], screenWorkspace sc >>= flip whenJust (windows . f))
        | (k, sc) <- zip "wre" [0..]
        , (f, m) <- [(W.shift, "S-")]]

