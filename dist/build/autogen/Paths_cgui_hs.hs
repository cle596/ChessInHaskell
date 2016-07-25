module Paths_cgui_hs (
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

bindir     = "/home/ch/.cabal/bin"
libdir     = "/home/ch/.cabal/lib/i386-linux-ghc-7.10.3/cgui-hs-0.1.0.0-BK4UcagmrIl7DNkGB1M0sA"
datadir    = "/home/ch/.cabal/share/i386-linux-ghc-7.10.3/cgui-hs-0.1.0.0"
libexecdir = "/home/ch/.cabal/libexec"
sysconfdir = "/home/ch/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cgui_hs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cgui_hs_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "cgui_hs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cgui_hs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cgui_hs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
