module Layout.Header exposing (..)

import Html exposing (header, h1, text)
import Html.Attributes exposing (style)


render =
    header []
        [ h1 [] [ Html.text "Stack Demo" ]
        ]
