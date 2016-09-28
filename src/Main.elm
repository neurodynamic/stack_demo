module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (program)
import Components.Layout.Base exposing (layout)


type alias Model =
    List String


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    layout [ div [ class "items" ] (List.map stringToBox model) ]


stringToBox : String -> Html Msg
stringToBox str =
    div [ class "item" ] [ text str ]


main : Program Never
main =
    program
        { init = ( [ "Third", "Second", "First" ], Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
