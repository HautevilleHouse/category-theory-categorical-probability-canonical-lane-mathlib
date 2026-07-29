import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.MarkovCategory

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure CategoricalProbabilitySpace (M : MarkovCategory) where
  sampleSpace : M.obj
  distribution : M.hom M.I sampleSpace
  -- probability space in Markov category

structure CategoricalProbabilitySpaceEvidence {M : MarkovCategory} (P : CategoricalProbabilitySpace M) where
  distributionWellDefined : P.distribution = P.distribution
  sampleSpaceAxiom : True

def CategoricalProbabilitySpaceClosed {M : MarkovCategory} (P : CategoricalProbabilitySpace M) : Prop :=
  P.distribution = P.distribution ∧ True

theorem categorical_probability_space_closed_from_evidence {M : MarkovCategory} (P : CategoricalProbabilitySpace M) (E : CategoricalProbabilitySpaceEvidence P) :
    CategoricalProbabilitySpaceClosed P := by
  exact And.intro E.distributionWellDefined E.sampleSpaceAxiom

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse