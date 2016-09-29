module Components.Update exposing (..)

import List exposing (..)
import Task exposing (..)
import Time exposing (second)
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
                , topItemStyle =
                    Animation.styleWith
                        (Animation.spring
                            { stiffness = 600
                            , damping = 35
                            }
                        )
                        [ Animation.height (px 0.0), Animation.opacity 0.0 ]
              }
            , fadeInNewItem
            )

        Pop ->
            ( { model | items = Maybe.withDefault [] (tail model.items) }, Cmd.none )

        FadeInNewItem ->
            let
                newStyle =
                    Animation.queue
                        [ Animation.to
                            [ Animation.height (px 40.0)
                            ]
                        , Animation.to
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
