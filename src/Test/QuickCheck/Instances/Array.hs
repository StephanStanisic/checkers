{-# OPTIONS_GHC -Wall -fno-warn-orphans #-}
module Test.QuickCheck.Instances.Array where

import Control.Applicative ((<$>))
import Test.QuickCheck
import Data.Array

instance (Ix a, Integral a, Arbitrary b) => Arbitrary (Array a b) where
  arbitrary   =
    (\x -> listArray (0,fromIntegral (length x - 1)) x) <$> arbitrary

instance (Ix a, Integral a, CoArbitrary b) => CoArbitrary (Array a b) where
  coarbitrary = coarbitrary . elems
