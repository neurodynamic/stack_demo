module Components.Update exposing (..)

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
            ( { items = model.inputValue :: model.items, inputValue = "" }, Cmd.none )
