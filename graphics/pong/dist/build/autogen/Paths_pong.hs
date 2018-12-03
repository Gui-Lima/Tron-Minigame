module Paths_pong (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ggfl/Github/snakeCode/graphics/pong/.cabal-sandbox/bin"
libdir     = "/home/ggfl/Github/snakeCode/graphics/pong/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.3/pong-0.1.0.0-BdkbTBTEYO60hD36ckvjba"
datadir    = "/home/ggfl/Github/snakeCode/graphics/pong/.cabal-sandbox/share/x86_64-linux-ghc-7.10.3/pong-0.1.0.0"
libexecdir = "/home/ggfl/Github/snakeCode/graphics/pong/.cabal-sandbox/libexec"
sysconfdir = "/home/ggfl/Github/snakeCode/graphics/pong/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pong_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pong_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "pong_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pong_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pong_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
