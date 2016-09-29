module Components.Model exposing (..)

import Animation exposing (px)


type alias Model =
    { items : List String
    , inputValue : String
    , topItemStyle : Animation.State
    }


initialModel : Model
initialModel =
    { items = [ "Third", "Second", "First" ]
    , inputValue = "Fourth"
    , topItemStyle =
        Animation.style
            [ Animation.height (px 50.0)
            , Animation.opacity 1.0
            ]
    }
