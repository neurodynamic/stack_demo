module Main exposing (..)

import Html exposing (h1, text)
import Layout.Base exposing (layout)


main =
    layout (h1 [] [ text "Hello" ])
