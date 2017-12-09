module Common.ViewComponents exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Common.Styling exposing (..)
import Common.Types exposing (..)


tab : List (Attribute msg) -> String -> String -> String -> String -> Html msg
tab attrs imgUrl href_ englishText japaneseText =
    a
        (List.append
            [ href href_
            , class "columns is-vcentered is-mobile is-marginless is-paddingless"
            ]
            attrs
        )
        [ div [ class "column is-7" ]
            [ figure [ class "image is-128x128" ]
                [ img
                    [ src imgUrl
                    , alt imgUrl
                    ]
                    []
                ]
            ]
        , div [ class "column is-vertical has-text-centered" ]
            [ h1 [] [ text englishText ]
            , h1 [] [ text japaneseText ]
            ]
        ]


navBar : NavModel -> Html NavMsg
navBar model =
    nav
        [ class "navbar"
        , radialCosineGradient waveform "bottom left"
        ]
        [ div
            [ class "navbar-brand" ]
            [ div [ class "navbar-item" ] [ nameLogo ]
            , button
                [ class "button navbar-burger"
                , onClick ToggleMenuActive
                ]
                [ span [] []
                , span [] []
                , span [] []
                ]
            ]
        , div
            [ class "navbar-menu"
            , class
                (if model.menuActive then
                    "is-active"
                 else
                    ""
                )
            ]
            [ div [ class "navbar-start" ] []
            , div [ class "navbar-end" ]
                [ works
                , blog
                , about
                ]
            ]
        ]



-- NAME


nameLogo : Html msg
nameLogo =
    a
        [ href "#"
        ]
        [ figure
            [ class "image"
            , width 400
            , height 128
            ]
            [ img [ src "assets/img/icons/title_white.svg" ] []
            ]
        ]



-- nameLogo =
--     a
--         [ href "#"
--         , class "columns is-multiline is-gapless is-mobile"
--         , class "is-marginless is-paddingless"
--         ]
--         [ h1
--             [ class "column is-5 is-offset-1"
--             , class "is-size-2-widescreen is-size-4-desktop"
--             ]
--             [ text "Rikuo" ]
--         , h1
--             [ class "column is-6"
--             , class "is-size-2-widescreen is-size-4-desktop"
--             ]
--             [ text "Hasegawa" ]
--         , h1
--             [ class "column is-6 is-offset-1"
--             , class "is-size-2-widescreen is-size-4-desktop"
--             ]
--             [ text "長谷川" ]
--         , h1
--             [ class "column is-5"
--             , class "is-size-2-widescreen is-size-4-desktop"
--             ]
--             [ text "陸央" ]
--         ]
-- WORKS


works : Html msg
works =
    tab
        [ id "works"
        , class "navbar-item"
        ]
        "assets/img/icons/works.png"
        "#works"
        "Works"
        "作品"



-- Blog


blog : Html msg
blog =
    tab
        [ id "blog"
        , class "navbar-item"
        ]
        "assets/img/icons/blog.png"
        "https://goonytoons.com/blog"
        "Blog"
        "ブログ"



-- About me


about : Html msg
about =
    tab
        [ id "about"
        , class "navbar-item"
        ]
        "assets/img/icons/about.png"
        "#about"
        "About Me"
        "自己紹介"


copyrightFooter : Html msg
copyrightFooter =
    footer
        [ class "footer" ]
        [ div
            [ class "container" ]
            [ div
                [ class "has-text-centered"
                , class "content"
                ]
                [ p []
                    [ text "© Copyright 2017 Rikuo Hasegawa. This work is released under a "
                    , a
                        [ href "http://creativecommons.org/licenses/by-nc-sa/4.0/"
                        , style [ ( "color", "#00F" ) ]
                        ]
                        [ text "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License"
                        ]
                    ]
                ]
            ]
        ]
