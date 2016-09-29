module Main exposing (..)

import Html.App exposing (program)
import Components.View exposing (view)
import Components.Model exposing (initialModel)
import Components.Update exposing (update)
import Components.Subscriptions exposing (subscriptions)


main : Program Never
main =
    program
        { init = ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
