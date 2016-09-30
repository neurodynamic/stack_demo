module Components.Layout.Footer exposing (..)

import Html exposing (Html, div, footer, a, i, text)
import Html.Attributes exposing (style, class, href)


render =
    footer []
        [ a [ href "https://github.com/neurodynamic/stack_demo" ]
            [ div [] [ githubIcon ]
            , div [] [ text "source on github" ]
            ]
        ]


githubIcon =
    i [ class "fa fa-github-alt" ] []
