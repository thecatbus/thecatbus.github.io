--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad ((>=>))
import Data.ByteString.Lazy.Char8 (pack, unpack)
import Data.Monoid (mappend)
import Data.Text (pack, unpack)
import Hakyll
import Hakyll.Core.Compiler
import qualified Network.URI.Encode as URI (encode)
import Text.Pandoc
import Text.Pandoc.Definition
import Text.Pandoc.Walk (walk, walkM)

myConfiguration :: Configuration
myConfiguration =
  defaultConfiguration
    { destinationDirectory = "docs"
    }

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith myConfiguration $ do
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "documents/*" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "preamble.tex" $ do 
    compile getResourceBody

  match "about.markdown" $ do
    route $ setExtension "html"
    compile $
      myPandocCompiler
        >>= loadAndApplyTemplate "templates/about.html" defaultContext

  postTags <- buildTags "posts/*" (fromCapture "posts/bytopic/*.html")

  gistTags <- buildTags "gists/*" (fromCapture "gists/bytopic/*.html")

  tagsRules postTags $ \tag pattern -> do
    let title = "Posts / " ++ tag
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAllSnapshots pattern "content"
      let ctx =
            constField "title" title
              <> field "allTags" (\_ -> renderTagList postTags)
              <> listField "posts" (postCtxWithTags postTags) (return posts)
              <> defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/post-list.html" ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx

  tagsRules gistTags $ \tag pattern -> do
    let title = "Gists / " ++ tag
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAllSnapshots pattern "content"
      let ctx =
            constField "title" title
              <> field "allTags" (\_ -> renderTagList gistTags)
              <> listField "posts" (postCtxWithTags gistTags) (return posts)
              <> defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/gist-list.html" ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx

  match "posts/*" $ do
    route $ setExtension "html"
    compile $
      myPandocCompiler
        >>= saveSnapshot "content"
        >>= loadAndApplyTemplate "templates/post.html" (postCtxWithTags postTags)
        >>= loadAndApplyTemplate "templates/default.html" defaultContext

  match "gists/*" $ do
    route $ setExtension "html"
    compile $
      myPandocCompiler
        >>= saveSnapshot "content"
        >>= loadAndApplyTemplate "templates/post.html" (postCtxWithTags gistTags)
        >>= loadAndApplyTemplate "templates/default.html" defaultContext

  create ["posts.html"] $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      let archiveCtx =
            listField "posts" (postCtxWithTags postTags) (return posts)
              <> field "allTags" (\_ -> renderTagList postTags)
              <> constField "title" "Posts / all"
              <> defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/post-list.html" archiveCtx
        >>= loadAndApplyTemplate "templates/default.html" archiveCtx

  create ["gists.html"] $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "gists/*"
      let archiveCtx =
            listField "posts" (postCtxWithTags gistTags) (return posts)
              <> field "allTags" (\_ -> renderTagList gistTags)
              <> constField "title" "Gists / all"
              <> defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/gist-list.html" archiveCtx
        >>= loadAndApplyTemplate "templates/default.html" archiveCtx

  match "index.html" $ do
    route idRoute
    compile $ do
      getResourceBody
        >>= applyAsTemplate defaultContext
        >>= loadAndApplyTemplate "templates/home.html" defaultContext

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------

postCtxWithTags :: Tags -> Context String
postCtxWithTags tags =
  teaserField "teaser" "content"
    <> tagsField "tags" tags
    <> dateField "date" "%B %e, %Y"
    <> defaultContext

pandocOptions :: WriterOptions
pandocOptions = defaultHakyllWriterOptions {writerHTMLMathMethod = MathJax ""}

--------------------------------------------------------------------------------

tikzFilter :: Block -> Compiler Block
tikzFilter (CodeBlock (id, "tikzpicture" : extraClasses, namevals) contents) =
  (imageBlock . ("data:image/svg+xml;utf8," ++) . URI.encode . filter (/= '\n') . itemBody <$>) $
    makeItem (Data.Text.unpack contents)
      >>= loadAndApplyTemplate (fromFilePath "templates/tikz.tex") (bodyField "body")
      >>= withItemBody
        ( return . Data.ByteString.Lazy.Char8.pack
            >=> unixFilterLBS "rubber-pipe" ["--pdf"]
            >=> unixFilterLBS "pdftocairo" ["-svg", "-", "-"]
            >=> return . Data.ByteString.Lazy.Char8.unpack
        )
  where
    imageBlock fname = Para [Image (id, "tikzpicture" : extraClasses, namevals) [] (Data.Text.pack fname, "")]
tikzFilter x = return x

myPandocCompiler = do 
  preamble <- loadBody "preamble.tex"
  item <- getResourceBody
  itemWithPreamble <- withItemBody (return . (preamble ++)) item
    
  pandocItem <- readPandocWith defaultHakyllReaderOptions itemWithPreamble
  transformedItem <- (walkM tikzFilter) `traverse` pandocItem
  return $ writePandocWith pandocOptions transformedItem
