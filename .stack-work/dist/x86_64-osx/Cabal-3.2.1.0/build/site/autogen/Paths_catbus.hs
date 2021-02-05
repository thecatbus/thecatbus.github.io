{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_catbus (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/parth/Projects/catbus/.stack-work/install/x86_64-osx/969ba4873cf2afacd4f7d006c1a916c60a3675bc21b574b7be15d90ae667144c/8.10.3/bin"
libdir     = "/Users/parth/Projects/catbus/.stack-work/install/x86_64-osx/969ba4873cf2afacd4f7d006c1a916c60a3675bc21b574b7be15d90ae667144c/8.10.3/lib/x86_64-osx-ghc-8.10.3/catbus-0.1.0.0-3fWYhN2q2stFcrC9x17FVR-site"
dynlibdir  = "/Users/parth/Projects/catbus/.stack-work/install/x86_64-osx/969ba4873cf2afacd4f7d006c1a916c60a3675bc21b574b7be15d90ae667144c/8.10.3/lib/x86_64-osx-ghc-8.10.3"
datadir    = "/Users/parth/Projects/catbus/.stack-work/install/x86_64-osx/969ba4873cf2afacd4f7d006c1a916c60a3675bc21b574b7be15d90ae667144c/8.10.3/share/x86_64-osx-ghc-8.10.3/catbus-0.1.0.0"
libexecdir = "/Users/parth/Projects/catbus/.stack-work/install/x86_64-osx/969ba4873cf2afacd4f7d006c1a916c60a3675bc21b574b7be15d90ae667144c/8.10.3/libexec/x86_64-osx-ghc-8.10.3/catbus-0.1.0.0"
sysconfdir = "/Users/parth/Projects/catbus/.stack-work/install/x86_64-osx/969ba4873cf2afacd4f7d006c1a916c60a3675bc21b574b7be15d90ae667144c/8.10.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "catbus_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "catbus_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "catbus_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "catbus_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "catbus_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "catbus_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
