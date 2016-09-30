module Utils.ItemStyles exposing (..)

import Animation exposing (px)
import Animation.Messenger
import Components.Messages exposing (..)


hiddenStyle : Animation.Messenger.State Msg
hiddenStyle =
    Animation.styleWith springSettings (invisible ++ collapsed)


visibleStyle : Animation.Messenger.State Msg
visibleStyle =
    Animation.styleWith springSettings (visible ++ expanded)


springSettings : Animation.Interpolation
springSettings =
    Animation.spring
        { stiffness = 600
        , damping = 35
        }


expanded : List Animation.Property
expanded =
    [ Animation.height (px 40)
    , Animation.paddingTop (px 5)
    , Animation.paddingBottom (px 5)
    , Animation.borderWidth (px 3)
    ]


collapsed : List Animation.Property
collapsed =
    [ Animation.height (px 0)
    , Animation.paddingTop (px 0)
    , Animation.paddingBottom (px 0)
    , Animation.borderWidth (px 0)
    ]


visible : List Animation.Property
visible =
    [ Animation.opacity 1 ]


invisible : List Animation.Property
invisible =
    [ Animation.opacity 0 ]
