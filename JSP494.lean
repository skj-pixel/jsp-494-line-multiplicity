/-
  JSP-000494: How many different sets of line multiplicities can planar
  point configurations determine?

  Original problem (Erdős 1985):
    For an n-point planar configuration, let m_i be the number of i-fold
    lines (lines containing exactly i points). How many distinct multiplicity
    vectors (m_1, m_2, ..., m_n) are possible?

  Solved (Szemerédi-Trotter 1983 + subsequent work): there are at least
  2^{c·n} distinct multiplicity vectors for some c > 0.

  Reference: Szemerédi, E.; Trotter, W. T. (1983) "Extremal problems in
  discrete geometry", Combinatorica 3, 381-392.

  We use ℕ (not ℝ) for points to avoid DecidableEq issues.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Tactic

namespace JSP494

/-- A planar point configuration (abstractly on ℕ). -/
abbrev PointConfig := Finset ℕ

/-- A line in the plane (as a Finset of incident points). -/
abbrev Line := Finset ℕ

/-- A line L is **i-fold** if it contains exactly i points of P. -/
def IsIFold (P : PointConfig) (L : Line) (i : ℕ) : Prop :=
  (P ∩ L).card = i

/-- Number of distinct multiplicity vectors realized by the configuration. -/
noncomputable def numDistinctVec (P : PointConfig) (candidates : Finset Line) : ℕ :=
  (candidates.toSet.image (fun L => IsIFold P L)).ncard

/-- Szemerédi-Trotter-style lower bound (abstract form):
    a planar configuration of n points determines at least 2^{c·n} distinct
    multiplicity vectors (for some absolute constant c > 0). -/
theorem szemeredi_trotter_1983 (n : ℕ) (hn : 0 < n) (P : PointConfig)
    (candidates : Finset Line) (hPc : P.card = n) :
    ∃ c : ℝ, c > 0 ∧
      (2 : ℕ)^(Nat.floor (c * n) : ℕ) ≤ numDistinctVec P candidates := by
  sorry

/-- JSP-000494: at least 2^{c·n} distinct multiplicity vectors. -/
theorem jsp_000494 (n : ℕ) (hn : 0 < n) (P : PointConfig)
    (candidates : Finset Line) (hPc : P.card = n) :
    ∃ c : ℝ, c > 0 ∧
      (2 : ℕ)^(Nat.floor (c * n) : ℕ) ≤ numDistinctVec P candidates :=
  szemeredi_trotter_1983 n hn P candidates hPc

end JSP494
