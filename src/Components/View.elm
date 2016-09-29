module Components.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.Model exposing (Model)
import Components.Msg exposing (Msg)
import Components.Layout.Base exposing (layout)


view : Model -> Html Msg
view model =
    layout
        [ Html.form [ class "push-form" ] [ text "push(", input [ class "push-input" ] [], text ")", button [] [ text "call" ] ]
        , div [ class "items" ] (List.map stringToBox model.items)
        ]


stringToBox : String -> Html Msg
stringToBox str =
    div [ class "item" ] [ text str ]
