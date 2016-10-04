module Components.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Animation
import Animation.Messenger
import Components.Model exposing (Model)
import Components.Messages exposing (..)
import Components.Layout.Base exposing (layout)


view : Model -> Html Msg
view model =
    layout
        [ div [] [ pushForm model.inputValue, popForm ]
        , stack model
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
        , input [ class "method-input", id "push-method", onInput NewInputValue, value inputValue ] []
        , text ")"
        , button [] [ text "call" ]
        ]


stack : Model -> Html Msg
stack model =
    div [ class "items" ] ((h3 [] [ text "stack" ]) :: (itemList model))


itemList : Model -> List (Html Msg)
itemList model =
    if List.isEmpty model.popping then
        List.map (stringToTopItemDiv (model.topItemStyle)) (List.take 1 model.items)
            ++ List.map stringToItemDiv (List.drop 1 model.items)
    else
        List.map (stringToTopItemDiv (model.topItemStyle)) (model.popping)
            ++ List.map stringToItemDiv model.items


stringToTopItemDiv : Animation.Messenger.State Msg -> String -> Html Msg
stringToTopItemDiv topItemStyle str =
    let
        properties =
            [ class "item top-item" ] ++ Animation.render topItemStyle
    in
        div properties [ text str ]


stringToItemDiv : String -> Html Msg
stringToItemDiv str =
    div [ class "item" ] [ text str ]
