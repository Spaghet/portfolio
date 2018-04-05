-- Entry Point for elm app.


module App exposing (main)

import Navigation
import State
import View
import Types exposing (..)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = State.init
        , update = State.update
        , view = View.root
        , subscriptions = State.subscriptions
        }
