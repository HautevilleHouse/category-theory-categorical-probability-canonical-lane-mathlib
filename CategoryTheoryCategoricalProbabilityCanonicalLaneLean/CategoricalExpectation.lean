import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure CategoricalExpectationPackage where
  markovCategory : Type u
  randomVariableSpace : Type v
  expectationOperator : (randomVariableSpace → ℝ) → ℝ
  expectationLinear : Prop
  expectationNonnegative : Prop
  expectationConstant : Prop
  expectationLinearClosed : expectationLinear
  expectationNonnegativeClosed : expectationNonnegative
  expectationConstantClosed : expectationConstant

structure CategoricalExpectationEvidence (E : CategoricalExpectationPackage) where
  expectationLinearClosed : E.expectationLinear
  expectationNonnegativeClosed : E.expectationNonnegative
  expectationConstantClosed : E.expectationConstant

def CategoricalExpectationClosed (E : CategoricalExpectationPackage) : Prop :=
  E.expectationLinear ∧ E.expectationNonnegative ∧ E.expectationConstant

theorem categorical_expectation_closed_from_evidence (E : CategoricalExpectationPackage) (Ev : CategoricalExpectationEvidence E) :
    CategoricalExpectationClosed E := by
  exact And.intro Ev.expectationLinearClosed (And.intro Ev.expectationNonnegativeClosed Ev.expectationConstantClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
