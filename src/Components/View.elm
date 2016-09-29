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
        , stack model.items
        ]


popForm : Html Msg
popForm =
    Html.form [ class "method-form", onSubmit Pop ]
        [ text "stack.pop()"
        , button [] [ text "call" ]
        ]


pushForm : String -> Html Msg
pushForm inputValue =
    Html.form [ class "method-form", onSubmit Push ]
        [ text "stack.push("
        , input [ class "method-input", onInput NewInputValue, value inputValue ] []
        , text ")"
        , button [] [ text "call" ]
        ]


stack : List String -> Html Msg
stack items =
    div [ class "items" ] ((h3 [] [ text "stack" ]) :: (itemList items))


itemList : List String -> List (Html Msg)
itemList items =
    List.map stringToTopItemDiv (List.take 1 items)
        ++ List.map stringToItemDiv (List.drop 1 items)


stringToTopItemDiv : String -> Html Msg
stringToTopItemDiv str =
    div [ class "item top-item" ] [ text str ]


stringToItemDiv : String -> Html Msg
stringToItemDiv str =
    div [ class "item" ] [ text str ]
