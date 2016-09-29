module Utils.HtmlWrappers exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


hreflessLink : String -> Html msg
hreflessLink name =
    textLink name "#!"


textLink : String -> String -> Html msg
textLink name url =
    a [ href url ] [ text name ]


ulWrap : List (Html msg) -> Html msg
ulWrap listItems =
    ul [] (List.map liWrap listItems)


liWrap : Html msg -> Html msg
liWrap html =
    li [] [ html ]
