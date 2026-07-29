import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure CategoryProbabilityFoundation where
  baseCategory : Type u₁
  baseCategoryStruct : Category baseCategory
  markovCategory : Type u₂
  markovCategoryStruct : Category markovCategory
  functorFromBase : baseCategory ⥤ markovCategory
  probabilityMonad : Monad markovCategory
  monadCompatibility : Prop
  monadCompatibilityTerm : monadCompatibility

structure CategoryProbabilityFoundationEvidence (F : CategoryProbabilityFoundation) where
  monadCompatibilityClosed : F.monadCompatibility

def CategoryProbabilityFoundationClosed (F : CategoryProbabilityFoundation) : Prop :=
  F.monadCompatibility

theorem category_probability_foundation_closed_from_evidence
    (F : CategoryProbabilityFoundation) (E : CategoryProbabilityFoundationEvidence F) :
    CategoryProbabilityFoundationClosed F := by
  exact E.monadCompatibilityClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
