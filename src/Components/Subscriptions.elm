module Components.Subscriptions exposing (..)

import Animation
import Components.Messages exposing (..)
import Components.Model exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Animation.subscription Animate [ model.topItemStyle ]
