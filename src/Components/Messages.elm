module Components.Messages exposing (..)

import Animation


type Msg
    = NoOp
    | NewInputValue String
    | Push
    | Pop
    | FadeInNewItem
    | FadeOutTopItem
    | Animate Animation.Msg
