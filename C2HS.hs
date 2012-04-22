--  C->Haskell Compiler: Marshalling library
--
--  Copyright (c) [1999...2005] Manuel M T Chakravarty
--
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions are met:
-- 
--  1. Redistributions of source code must retain the above copyright notice,
--     this list of conditions and the following disclaimer. 
--  2. Redistributions in binary form must reproduce the above copyright
--     notice, this list of conditions and the following disclaimer in the
--     documentation and/or other materials provided with the distribution. 
--  3. The name of the author may not be used to endorse or promote products
--     derived from this software without specific prior written permission. 
--
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
--  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
--  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
--  NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
--  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
--  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
--  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
--  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
--  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--- Description ---------------------------------------------------------------
--
--  Language: Haskell 98
--
--  This module provides the marshaling routines for Haskell files produced by 
--  C->Haskell for binding to C library interfaces.  It exports all of the
--  low-level FFI (language-independent plus the C-specific parts) together
--  with the C->HS-specific higher-level marshalling routines.
--

module C2HS (

  -- * Re-export the language-independent component of the FFI 
  module Foreign,

  -- * Re-export the C language component of the FFI
  module Foreign.C,

  module C2HS
) where


import Foreign
import Foreign.C

import Control.Monad (liftM)


-- Composite marshalling functions
-- -------------------------------

-- Strings with explicit length
--
withCStringLenIntConv :: Num n => String -> ((CString, n) -> IO a) -> IO a
withCStringLenIntConv s f    = withCStringLen s $ \(p, n) -> f (p, fromIntegral n)

peekCStringLenIntConv :: Integral n => (CString, n) -> IO String
peekCStringLenIntConv (s, n) = peekCStringLen (s, fromIntegral n)

-- Marshalling of numerals
--

withIntConv   :: (Storable b, Integral a, Integral b) 
              => a -> (Ptr b -> IO c) -> IO c
withIntConv    = with . fromIntegral

withFloatConv :: (Storable b, RealFloat a, RealFloat b) 
              => a -> (Ptr b -> IO c) -> IO c
withFloatConv  = with . realToFrac

peekIntConv   :: (Storable a, Integral a, Integral b) 
              => Ptr a -> IO b
peekIntConv    = liftM fromIntegral . peek

peekFloatConv :: (Storable a, RealFloat a, RealFloat b) 
              => Ptr a -> IO b
peekFloatConv  = liftM realToFrac . peek


withT :: Storable a => a -> (Ptr a -> IO b) -> IO b
withT = with
