-- | 3-address intermediate language, roughly a subset of some RISC
--   instruction set.  For full information, see
--   <http://www.cl.cam.ac.uk/teaching/1718/OptComp/3addrcode.txt>
module ThreeAddress where

import Types

data ThreeAddress =
    -- ALU with immediate
      AddI VRegister VRegister Immediate
    | SubI VRegister VRegister Immediate
    | MulI VRegister VRegister Immediate
    | DivI VRegister VRegister Immediate
    | AndI VRegister VRegister Immediate
    | OrI  VRegister VRegister Immediate
    | XorI VRegister VRegister Immediate

    -- ALU with register
    | AddR VRegister VRegister Immediate
    | SubR VRegister VRegister Immediate
    | MulR VRegister VRegister Immediate
    | DivR VRegister VRegister Immediate
    | AndR VRegister VRegister Immediate
    | OrR VRegister VRegister Immediate
    | XorR VRegister VRegister Immediate

    -- ALU2 omitted - will be replaced with equivalent
    -- ALU instructions.  mov -> add ? 0; neg -> sub 0 ?; not -> xor MAXINT ?

    -- Memory access
    | Ldi VRegister VRegister -- ^ r1 = *r2
    | Sti VRegister VRegister -- ^ *r1 = r2

    -- Branching
    | CmpEq VRegister VRegister Label
    | CmpNe VRegister VRegister Label
    | CmpLt VRegister VRegister Label
    | CmpLe VRegister VRegister Label
    | CmpGt VRegister VRegister Label
    | CmpGe VRegister VRegister Label
    | Call Label
    | CallI VRegister
    | Return VRegister -- Making assumption in EXIT explicit
    | Branch Label
    | BranchI VRegister
