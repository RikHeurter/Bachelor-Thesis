import Mathlib

structure rate_matrix where
  Q : ℕ → ℕ → ℝ
  sum_eq_zero_at_zero : Q 0 1 = -(Q 0 0)
  sum_eq_zero_at_non_zero : ∀ n, n ≠ 0 → (Q n (n+1)) + (Q n (n-1)) = -(Q n n)
  non_nbr_eq_zero : ∀n, ∀k, k ≥ n + 2 → (Q n k) = 0 ∧ (Q k n) = 0

def myConcave (n : ℕ ) (s : Set (EuclideanSpace ℝ  (Fin n))) (f : (EuclideanSpace ℝ  (Fin n)) → ℝ) : Prop :=
  ∀ x, x ∈ s → ∀ y, y ∈ s → ∀ ⦃a b : ℝ⦄, 0 ≤ a → 0 ≤ b → a + b = 1 →
    a • f x + b • f y ≤ f (a • x + b • y)

def Sublinear (n : ℕ) (f : (EuclideanSpace ℝ  (Fin n)) → ℝ) : Prop :=
  ∀ x, ‖x‖ ≥ 0 → ‖f x‖  ≤ ‖x‖

def SpeedUpFunction (n : ℕ ) (s : Set (EuclideanSpace ℝ  (Fin n))) (f : (EuclideanSpace ℝ  (Fin n)) → ℝ) : Prop :=
  Sublinear n f ∧ myConcave n s f

structure schedule_policy where
  dim : ℕ
  μ : ℝ
  s : Set (EuclideanSpace ℝ  (Fin dim))
  speedupF : (EuclideanSpace ℝ  (Fin dim)) → ℝ
  policy: ℕ → (EuclideanSpace ℝ  (Fin dim))
  departurerates : ℕ → ℝ
  speedupF_is_speedup : SpeedUpFunction dim s speedupF
  departurerates_uses_speedup: ∀ n, μ * speedupF (policy n) = (departurerates n)

def IsStable (P : schedule_policy) (Λ : ℝ) : Prop :=
  (⨆ (z : ℕ), P.departurerates z)/Λ < 1

structure queue where
  state_space : ℕ
  Λ : ℝ
  μ : ℝ
  Q : rate_matrix
  P : schedule_policy
  policy_mu_eq_queue_mu : P.μ = μ
  stable_policy : IsStable P Λ
