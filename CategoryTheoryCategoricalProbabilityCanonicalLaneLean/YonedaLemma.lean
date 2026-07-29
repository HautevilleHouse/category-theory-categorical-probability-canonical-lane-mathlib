import CanonicalCategoryTheoryProbability.CategoryTheory.FinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure YonedaPackage (C : Type u) [Category.{v} C] where
  functor : C ⥤ Set
  naturality : Prop
  representation : Prop
  yonedaEmbedding : Prop
  yonedaLemma : Prop

structure YonedaEvidence {C : Type u} [Category.{v} C] (Y : YonedaPackage C) where
  functorClosed : Y.functor = Y.functor
  naturalityClosed : Y.naturality
  representationClosed : Y.representation
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  yonedaLemmaClosed : Y.yonedaLemma

def YonedaClosed {C : Type u} [Category.{v} C] (Y : YonedaPackage C) : Prop :=
  Y.naturality ∧ Y.representation ∧ Y.yonedaEmbedding ∧ Y.yonedaLemma

theorem yoneda_closed_from_evidence {C : Type u} [Category.{v} C] (Y : YonedaPackage C) (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact And.intro E.naturalityClosed (And.intro E.representationClosed (And.intro E.yonedaEmbeddingClosed E.yonedaLemmaClosed))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
