module Components.Update exposing (..)

import List exposing (..)
import Task exposing (..)
import Animation exposing (px)
import Components.Msg exposing (..)
import Components.Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NewInputValue str ->
            ( { model | inputValue = str }, Cmd.none )

        Push ->
            ( { model
                | items = model.inputValue :: model.items
                , inputValue = ""
                , topItemStyle = Animation.style [ Animation.height (px 50.0), Animation.opacity 0.0 ]
              }
            , fadeInNewItem
            )

        Pop ->
            ( { model | items = Maybe.withDefault [] (tail model.items) }, Cmd.none )

        FadeInNewItem ->
            let
                newStyle =
                    Animation.interrupt
                        [ Animation.to
                            [ Animation.opacity 1.0
                            ]
                        ]
                        model.topItemStyle
            in
                ( { model
                    | topItemStyle = newStyle
                  }
                , Cmd.none
                )

        Animate animationMsg ->
            ( { model | topItemStyle = Animation.update animationMsg model.topItemStyle }, Cmd.none )


fadeInNewItem =
    Task.perform (\_ -> Debug.crash "This failure cannot happen.") identity (Task.succeed FadeInNewItem)
