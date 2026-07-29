import CategoricalProbabilityCanonicalLaneLean.CategoricalProbabilityAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure MarkovCategoryPackage where
  category : Type u
  monoidalProduct : Type v
  symmetricStructure : Prop
  copyDiscardStructure : Prop
  markovCondition : Prop

structure MarkovCategoryEvidence (M : MarkovCategoryPackage) where
  symmetricStructureClosed : M.symmetricStructure
  copyDiscardStructureClosed : M.copyDiscardStructure
  markovConditionClosed : M.markovCondition

def MarkovCategoryClosed (M : MarkovCategoryPackage) : Prop :=
  M.symmetricStructure ∧ M.copyDiscardStructure ∧ M.markovCondition

theorem markov_category_closed_from_evidence (M : MarkovCategoryPackage) (E : MarkovCategoryEvidence M) : MarkovCategoryClosed M := by
  exact And.intro E.symmetricStructureClosed (And.intro E.copyDiscardStructureClosed E.markovConditionClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse