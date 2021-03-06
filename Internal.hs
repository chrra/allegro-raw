{-# LANGUAGE ForeignFunctionInterface #-}
module Internal where

import Control.Applicative
import Control.Monad.Instances ()
import Data.Bits
import Data.List
import Foreign

-- |Convert a Haskell enumeration to C.
cFromEnum :: (Enum e, Integral i) => e -> i
cFromEnum = fromIntegral . fromEnum

-- | Convert a C integral to a Haskell enumeration.
cToEnum :: (Enum e, Integral i) => i -> e
cToEnum = toEnum . fromIntegral

-- |Convert a list of haskell enumerations to C
cFromEnumFlags :: (Enum e, Integral i, Bits i) => [e] -> i
cFromEnumFlags = foldl' (.|.) 0 . map cFromEnum

cToEnumFlags :: (Enum e, Bounded e, Integral i) => i -> [e]
cToEnumFlags i = filter (\e -> fromEnum e .&. fromIntegral i > 0) [minBound..maxBound]

peekEnumConv :: (Storable a, Integral a, Enum e) => Ptr a -> IO e
peekEnumConv = fmap fmap fmap cToEnum peek

maybePeek' :: Storable a => Ptr a -> IO (Maybe a)
maybePeek' = maybePeek peek

ptrAndBoolToMaybe :: Storable a => IO (Bool, Ptr a) -> IO (Maybe a)
ptrAndBoolToMaybe f = do (b, p) <- f
                         if b then Just `fmap` peek p <* free p
                              else Nothing <$ free p

withMalloc :: Storable a => (Ptr a -> IO b) -> IO b
withMalloc = (>>=) malloc

withMallocedForeign :: Storable a => (Ptr a -> IO b) -> IO (ForeignPtr a)
withMallocedForeign f = do x <- mallocForeignPtr
                           _ <- withForeignPtr x f
                           return x

maybeNewForeignPtr_ :: Storable a => Ptr a -> IO (Maybe (ForeignPtr a))
maybeNewForeignPtr_ p = if p == nullPtr then return Nothing
                                        else Just <$> newForeignPtr_ p

ptrToMaybePtr :: Ptr a -> Maybe (Ptr a)
ptrToMaybePtr p = if p == nullPtr then Nothing else Just p
