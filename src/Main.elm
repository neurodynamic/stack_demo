module Main exposing (..)

import Html exposing (h1, text)
import Components.Layout.Base exposing (layout)


main =
    layout (h1 [] [ text "Hello" ])
