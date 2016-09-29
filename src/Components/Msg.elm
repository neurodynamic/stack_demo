module Components.Msg exposing (..)

import Animation


type Msg
    = NoOp
    | NewInputValue String
    | Push
    | Pop
    | FadeInNewItem
    | Animate Animation.Msg
