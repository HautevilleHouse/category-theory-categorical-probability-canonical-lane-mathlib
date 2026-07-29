import CanonicalCategoryTheoryProbability.CategoryTheory.MonoidalCategory

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure CategoricalProbabilityPackage (C : Type u) [Category.{v} C] [MonoidalCategory.{v} C] where
  markovCategory : Prop
  commutativeComonoid : Prop
  bayesRule : Prop
  disintegration : Prop

structure CategoricalProbabilityEvidence {C : Type u} [Category.{v} C] [MonoidalCategory.{v} C] (P : CategoricalProbabilityPackage C) where
  markovCategoryClosed : P.markovCategory
  commutativeComonoidClosed : P.commutativeComonoid
  bayesRuleClosed : P.bayesRule
  disintegrationClosed : P.disintegration

def CategoricalProbabilityClosed {C : Type u} [Category.{v} C] [MonoidalCategory.{v} C] (P : CategoricalProbabilityPackage C) : Prop :=
  P.markovCategory ∧ P.commutativeComonoid ∧ P.bayesRule ∧ P.disintegration

theorem categorical_probability_closed_from_evidence {C : Type u} [Category.{v} C] [MonoidalCategory.{v} C] (P : CategoricalProbabilityPackage C) (E : CategoricalProbabilityEvidence P) : CategoricalProbabilityClosed P := by
  exact And.intro E.markovCategoryClosed (And.intro E.commutativeComonoidClosed (And.intro E.bayesRuleClosed E.disintegrationClosed))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
