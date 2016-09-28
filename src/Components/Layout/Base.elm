module Components.Layout.Base exposing (..)

import Html exposing (Html, div, main')
import Html.Attributes exposing (class)
import Components.Layout.Header as Header
import Components.Layout.Footer as Footer


layout : Html msg -> Html msg
layout html =
    div [ class "page-flexbox-wrapper" ]
        [ Header.render
        , main' [] [ html ]
        , Footer.render
        ]
