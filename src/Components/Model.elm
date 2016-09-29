module Components.Model exposing (..)


type alias Model =
    { items : List String
    , inputValue : String
    }


initialModel : Model
initialModel =
    { items = [ "Third", "Second", "First" ]
    , inputValue = "Fourth"
    }
