import CanonicalCategoryTheoryProbability.CategoryTheory.AdjointFunctorTheorem

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure MonoidalCategoryPackage (C : Type u) [Category.{v} C] where
  tensorProduct : C × C ⥤ C
  unit : C
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonCondition : Prop
  triangleCondition : Prop

structure MonoidalCategoryEvidence {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) where
  tensorProductClosed : M.tensorProduct = M.tensorProduct
  unitClosed : M.unit = M.unit
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonConditionClosed : M.pentagonCondition
  triangleConditionClosed : M.triangleCondition

def MonoidalCategoryClosed {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonCondition ∧ M.triangleCondition

theorem monoidal_category_closed_from_evidence {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed (And.intro E.leftUnitorClosed (And.intro E.rightUnitorClosed (And.intro E.pentagonConditionClosed E.triangleConditionClosed)))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
