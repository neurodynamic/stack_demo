module Components.Subscriptions exposing (..)

import Animation
import Components.Msg exposing (..)
import Components.Model exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Animation.subscription Animate [ model.topItemStyle ]
