import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.CategoricalProbabilitySpace

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure ConditionalIndependence (M : MarkovCategory) (P : CategoricalProbabilitySpace M) (A B C : M.obj) where
  condIndep : M.hom (A ⊗ B) (A ⊗ C ⊗ B) -- placeholder
  axioms : Prop

structure ConditionalIndependenceEvidence {M : MarkovCategory} {P : CategoricalProbabilitySpace M} {A B C : M.obj} (CI : ConditionalIndependence M P A B C) where
  condIndepClosed : CI.condIndep = CI.condIndep
  axiomsClosed : CI.axioms

def ConditionalIndependenceClosed {M : MarkovCategory} {P : CategoricalProbabilitySpace M} {A B C : M.obj} (CI : ConditionalIndependence M P A B C) : Prop :=
  CI.condIndep = CI.condIndep ∧ CI.axioms

theorem conditional_independence_closed_from_evidence {M : MarkovCategory} {P : CategoricalProbabilitySpace M} {A B C : M.obj} (CI : ConditionalIndependence M P A B C) (E : ConditionalIndependenceEvidence CI) :
    ConditionalIndependenceClosed CI := by
  exact And.intro E.condIndepClosed E.axiomsClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse