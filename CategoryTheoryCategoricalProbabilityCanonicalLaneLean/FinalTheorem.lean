import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

def ConstrainedCategoricalProbabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_categorical_probability_endgame (A : AdmissibleClass) :
    ConstrainedCategoricalProbabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (A.gateWitness)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
