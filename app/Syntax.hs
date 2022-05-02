module Syntax where

type Name = String

data Lit = LInt Int
         | LBool Bool
         deriving (Eq, Show)

data Expr = Var Name
          | App Expr Expr
          | Lam Name Expr
          | Lit Lit
          deriving (Eq, Show)

