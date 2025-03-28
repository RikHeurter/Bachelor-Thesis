import Mathlib
import Mathlib.Analysis

-- ########################################
def hello := "world"


variable {a b x y: ℝ}

-- def Increasing (f : α → β) : Prop :=
--   ∀ ⦃a b⦄, a ≤ b → f a ≤ f b

-- def FnLessThanposyx (f : α → β) : Prop :=
--   ∀ x, x ≥ 0 → f x ≤ x

-- def FnHasub (f : α → β) : Prop :=
--   ∃ c, ∀ x ≥ 0 → f x ≤ c

-- def Sublinear (f : α → ) : Prop :=
--   FnHasub f ∧ FnLessThanposyx f ∧ Increasing f

def Linear (f : ℝ  → ℝ) : Prop :=
  ∀ {x: ℝ }, f x = x

def ConcaveOn (f : ℝ → ℝ ) : Prop := ∀ {a : ℝ},∀ {b : ℝ},∀ {x : ℝ}, ∀ {y : ℝ}, 0 ≤ a → 0 ≤ b → a + b = 1 →
  a * f x + b * f y ≤ f (a * x + b * y)

theorem sublin_imp_concave {h : Linear f} : ConcaveOn f := by
  intro a b x y h₁ h₂ h₃
  rw [h]
  rw [h]
  rw [h]
  -- intro h as
  -- rcases h with ⟨ x, ha⟩
  -- linarith [h, h₁, h₂]


theorem a_bt_b (h₀ : a ≥ 0) (h₁ : b ≤ 0) : a ≥ b := by
  sorry
  -- intro h₁ h
  -- ₂ h₃
