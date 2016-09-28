module Layout.Base exposing (..)

import Html exposing (Html, div, main')
import Html.Attributes exposing (class)
import Layout.Header
import Layout.Footer


layout : Html msg -> Html msg
layout html =
    div [ class "page-flexbox-wrapper" ]
        [ Layout.Header.render
        , main' [] [ html ]
        , Layout.Footer.render
        ]
