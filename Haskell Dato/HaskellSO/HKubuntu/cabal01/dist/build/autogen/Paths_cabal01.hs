module Paths_cabal01 (
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

bindir     = "/home/ubuntu/Escritorio/cabal01/.cabal-sandbox/bin"
libdir     = "/home/ubuntu/Escritorio/cabal01/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.3/cabal01-0.1.0.0-DZGiyqvNsXHGGf46yiUT3M"
datadir    = "/home/ubuntu/Escritorio/cabal01/.cabal-sandbox/share/x86_64-linux-ghc-7.10.3/cabal01-0.1.0.0"
libexecdir = "/home/ubuntu/Escritorio/cabal01/.cabal-sandbox/libexec"
sysconfdir = "/home/ubuntu/Escritorio/cabal01/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cabal01_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cabal01_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "cabal01_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cabal01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cabal01_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
