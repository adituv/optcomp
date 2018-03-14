module Types where

import Data.Int(Int32)
import Data.Word(Word32)

newtype Immediate = Immediate Int32
  deriving Show

newtype Label = Label String
  deriving Show

-- | A virtual register.  Does not correspond to a phyiscal register.
newtype VRegister = VRegister Word32
  deriving Show
