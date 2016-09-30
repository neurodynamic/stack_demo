module Components.Model exposing (..)

import Components.Messages exposing (..)
import Components.ItemStyles exposing (..)
import Animation exposing (px)
import Animation.Messenger


type alias Model =
    { items : List String
    , inputValue : String
    , topItemStyle : Animation.Messenger.State Msg
    }


initialModel : Model
initialModel =
    { items = [ "Third", "Second", "First" ]
    , inputValue = "Fourth"
    , topItemStyle =
        Animation.style (visible ++ expanded)
    }
