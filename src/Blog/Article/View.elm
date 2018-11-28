module Blog.Article.View exposing (root)

import Blog.Article.Types exposing (..)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (navBar)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Encode
import Markdown


root : Model -> Html Msg
root model =
    div []
        [ Html.map Nav (navBar model.navModel)
        , div
            [ class "article-container"
            , class "container is-widescreen"
            ]
          <|
            List.append
                [ div
                    [ class "content"
                    , class "container is-widescreen"
                    , style
                        [ ( "width", "80%" )
                        , ( "padding-top", "3vh" )
                        ]
                    ]
                    [ h1
                        [ class "is-size-1-desktop"
                        , style [ ( "color", "white" ) ]
                        ]
                        [ text model.article.title ]
                    ]
                ]
            <|
                List.map render model.article.body
        ]


render : Content -> Html msg
render content =
    let
        rendered =
            case content of
                Words markdown ->
                    Markdown.toHtml [ class "is-size-5-desktop" ] markdown

                Picture imgUrl ->
                    img
                        [ class "project-picture"
                        , src imgUrl
                        ]
                        []

                Video url ->
                    video
                        [ autoplay True
                        , loop True
                        , controls True
                        , property "muted" (Encode.bool True)
                        ]
                        [ source
                            [ src url
                            , type_ "video/mp4"
                            ]
                            []
                        , text "No video support"
                        ]

                Youtube videoId ->
                    div
                        [ class "video-container"
                        ]
                        [ iframe
                            [ attribute "allow" "encrypted-media"
                            , attribute "allowfullscreen" ""
                            , attribute "frameborder" "0"
                            , attribute "gesture" "media"
                            , src ("https://www.youtube-nocookie.com/embed/" ++ videoId ++ "?rel=0&showinfo=0")
                            ]
                            []
                        ]
    in
        div
            [ class "content"
            , class "container"
            , style
                [ ( "width", "80%" )
                ]
            ]
            [ rendered
            ]
