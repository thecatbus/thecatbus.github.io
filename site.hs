--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

myConfiguration :: Configuration
myConfiguration = defaultConfiguration
    { destinationDirectory = "docs"
    }

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith myConfiguration $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "about.markdown" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext

    postTags <- buildTags "posts/*" (fromCapture "posts/bytopic/*.html")

    gistTags <- buildTags "gists/*" (fromCapture "gists/bytopic/*.html")

    tagsRules postTags $ \tag pattern -> do
        let title = "Posts / " ++ tag 
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAllSnapshots pattern "content"
            let ctx = constField "title" title
                      <> field "allTags" (\_->renderTagList postTags) 
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
            let ctx = constField "title" title
                      <> field "allTags" (\_->renderTagList gistTags) 
                      <> listField "posts" (postCtxWithTags gistTags) (return posts)
                      <> defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/gist-list.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= saveSnapshot "content" 
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags postTags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags postTags)

    match "gists/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= saveSnapshot "content" 
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags gistTags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags gistTags)

    create ["posts.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx = listField "posts" (postCtxWithTags postTags) (return posts) 
                             <> field "allTags" (\_->renderTagList postTags) 
                             <> constField "title" "Posts / all"
                             <> defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/post-list.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx

    create ["gists.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "gists/*"
            let archiveCtx = listField "posts" (postCtxWithTags gistTags) (return posts) 
                             <> field "allTags" (\_->renderTagList gistTags) 
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
postCtxWithTags tags = teaserField "teaser" "content" 
                       <> tagsField "tags" tags 
                       <> dateField "date" "%B %e, %Y"
                       <> defaultContext
