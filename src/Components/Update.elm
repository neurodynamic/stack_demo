module Components.Update exposing (..)

import List exposing (..)
import Task exposing (..)
import Dom exposing (focus)
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
                , popping = []
                , inputValue = ""
                , topItemStyle = hiddenStyle
              }
            , postPush
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
                | items = List.drop 1 model.items
                , popping = List.take 1 model.items
                , inputValue = ""
                , topItemStyle = visibleStyle
              }
            , fadeOutTopItem
            )

        FadeOutTopItem ->
            let
                newStyle =
                    Animation.queue
                        [ Animation.to invisible
                        , Animation.to collapsed
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


postPush : Cmd Msg
postPush =
    Task.perform wtfCrash identity ((focus "push-method") `andThen` (\_ -> Task.succeed FadeInNewItem))


fadeOutTopItem : Cmd Msg
fadeOutTopItem =
    Task.perform wtfCrash identity (Task.succeed FadeOutTopItem)


removeTopItem : Cmd Msg
removeTopItem =
    Task.perform wtfCrash identity (Task.succeed Pop)


wtfCrash : a -> b
wtfCrash =
    \_ -> Debug.crash "This failure shouldn't be possible. WTF is even happening?"
