module Components.Model exposing (..)

import Components.Messages exposing (..)
import Utils.ItemStyles exposing (..)
import Animation exposing (px)
import Animation.Messenger


type alias Model =
    { items : List String
    , animatingAction : Action
    , animatingItem : String
    , animatingStyle : Animation.Messenger.State Msg
    , inputValue : String
    }


type Action
    = Pop
    | Push
    | None


initialModel : Model
initialModel =
    { items = [ "Third", "Second", "First" ]
    , fadingItem = Nothing
    , inputValue = "Fourth"
    , topItemStyle =
        Animation.style (visible ++ expanded)
    }
