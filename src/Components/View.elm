module Components.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Components.Model exposing (Model)
import Components.Msg exposing (..)
import Components.Layout.Base exposing (layout)


view : Model -> Html Msg
view model =
    layout
        [ pushForm model.inputValue
        , items model.items
        ]


pushForm : String -> Html Msg
pushForm inputValue =
    Html.form [ class "push-form", onSubmit Push ]
        [ text "push("
        , input [ class "push-input", onInput NewInputValue, value inputValue ] []
        , text ")"
        , button [] [ text "call" ]
        ]


items : List String -> Html Msg
items list =
    div [ class "items" ] (List.map stringToBox list)


stringToBox : String -> Html Msg
stringToBox str =
    div [ class "item" ] [ text str ]
