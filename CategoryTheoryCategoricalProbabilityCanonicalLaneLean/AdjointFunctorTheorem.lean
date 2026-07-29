import CanonicalCategoryTheoryProbability.CategoryTheory.YonedaLemma

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure AdjointFunctorPackage (C D : Type u) [Category.{v} C] [Category.{v} D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  adjunction : Prop
  unitCounit : Prop
  universalProperty : Prop

structure AdjointFunctorEvidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorPackage C D) where
  leftAdjointClosed : A.leftAdjoint = A.leftAdjoint
  rightAdjointClosed : A.rightAdjoint = A.rightAdjoint
  adjunctionClosed : A.adjunction
  unitCounitClosed : A.unitCounit
  universalPropertyClosed : A.universalProperty

def AdjointFunctorClosed {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorPackage C D) : Prop :=
  A.adjunction ∧ A.unitCounit ∧ A.universalProperty

theorem adjoint_functor_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorPackage C D) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.adjunctionClosed (And.intro E.unitCounitClosed E.universalPropertyClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
