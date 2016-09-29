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
        [ div [] [ pushForm model.inputValue, popForm ]
        , items model.items
        ]


popForm : Html Msg
popForm =
    Html.form [ class "method-form", onSubmit Pop ]
        [ text "myStack.pop()"
        , button [] [ text "call" ]
        ]


pushForm : String -> Html Msg
pushForm inputValue =
    Html.form [ class "method-form", onSubmit Push ]
        [ text "myStack.push("
        , input [ class "method-input", onInput NewInputValue, value inputValue ] []
        , text ")"
        , button [] [ text "call" ]
        ]


items : List String -> Html Msg
items list =
    div [ class "items" ] ((h3 [] [ text "myStack" ]) :: (List.map stringToBox list))


stringToBox : String -> Html Msg
stringToBox str =
    div [ class "item" ] [ text str ]
