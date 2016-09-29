module Components.ItemStyles exposing (..)

import Animation exposing (px)


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
