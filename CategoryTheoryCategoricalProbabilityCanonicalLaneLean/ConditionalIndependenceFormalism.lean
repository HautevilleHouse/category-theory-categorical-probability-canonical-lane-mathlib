import CategoricalProbabilityCanonicalLaneLean.MarkovCategoryFormalism

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure ConditionalIndependenceStructure {M : MarkovCategoryPackage} where
  randomVariableA : M.category
  randomVariableB : M.category
  randomVariableC : M.category
  independenceProperty : Prop
  joinDistributions : Prop

structure ConditionalIndependenceEvidence {M : MarkovCategoryPackage} (C : ConditionalIndependenceStructure M) where
  independencePropertyClosed : C.independenceProperty
  joinDistributionsClosed : C.joinDistributions

def ConditionalIndependenceClosed {M : MarkovCategoryPackage} (C : ConditionalIndependenceStructure M) : Prop :=
  C.independenceProperty ∧ C.joinDistributions

theorem conditional_independence_closed_from_evidence {M : MarkovCategoryPackage} (C : ConditionalIndependenceStructure M) (E : ConditionalIndependenceEvidence C) : ConditionalIndependenceClosed C := by
  exact And.intro E.independencePropertyClosed E.joinDistributionsClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse