import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure MarkovCategoryPackage (A : AdmissibleClass) where
  composition : Prop
  identity : Prop
  symmetricMonoidal : Prop
  stochasticMaps : Prop

structure MarkovCategoryEvidence {A : AdmissibleClass} (M : MarkovCategoryPackage A) where
  compositionClosed : M.composition
  identityClosed : M.identity
  symmetricMonoidalClosed : M.symmetricMonoidal
  stochasticMapsClosed : M.stochasticMaps

def MarkovCategoryClosed {A : AdmissibleClass} (M : MarkovCategoryPackage A) : Prop :=
  M.composition ∧ M.identity ∧ M.symmetricMonoidal ∧ M.stochasticMaps

theorem markov_category_closed_from_evidence {A : AdmissibleClass}
    (M : MarkovCategoryPackage A) (E : MarkovCategoryEvidence M) :
    MarkovCategoryClosed M := by
  exact And.intro E.compositionClosed (And.intro E.identityClosed (And.intro E.symmetricMonoidalClosed E.stochasticMapsClosed))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
