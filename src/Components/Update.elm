module Components.Update exposing (..)

import List exposing (..)
import Task exposing (..)
import Animation exposing (px)
import Animation.Messenger
import Components.Messages exposing (..)
import Components.Model exposing (..)
import Utils.ItemStyles exposing (..)


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
                , topItemStyle = hiddenStyle
              }
            , fadeInNewItem
            )

        FadeInNewItem ->
            let
                newStyle =
                    Animation.queue
                        [ Animation.to expanded
                        , Animation.to visible
                        ]
                        model.topItemStyle
            in
                ( { model
                    | topItemStyle = newStyle
                  }
                , Cmd.none
                )

        Pop ->
            ( { model
                | items = Maybe.withDefault [] (tail model.items)
                , topItemStyle =
                    Animation.style (visible ++ expanded)
              }
            , Cmd.none
            )

        FadeOutTopItem ->
            let
                newStyle =
                    Animation.queue
                        [ Animation.to invisible
                        , Animation.to collapsed
                        , Animation.Messenger.send Pop
                        ]
                        model.topItemStyle
            in
                ( { model
                    | topItemStyle = newStyle
                  }
                , Cmd.none
                )

        Animate animationMsg ->
            let
                ( style, command ) =
                    Animation.Messenger.update animationMsg model.topItemStyle
            in
                ( { model | topItemStyle = style }, command )


fadeInNewItem : Cmd Msg
fadeInNewItem =
    Task.perform (\_ -> Debug.crash "This failure cannot happen.") identity (Task.succeed FadeInNewItem)


removeTopItem : Cmd Msg
removeTopItem =
    Task.perform (\_ -> Debug.crash "This failure cannot happen.") identity (Task.succeed Pop)
