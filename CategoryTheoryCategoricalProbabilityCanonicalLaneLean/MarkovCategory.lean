import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure MarkovCategory (C : Type u) [Category.{v} C] where
  tensor : C → C → C
  unit : C
  copy : (X : C) → Hom X (tensor X X)
  discard : (X : C) → Hom X unit
  assoc : (X Y Z : C) → Hom (tensor (tensor X Y) Z) (tensor X (tensor Y Z))
  swap : (X Y : C) → Hom (tensor X Y) (tensor Y X)
  copyNatural : ∀ (X Y : C) (f : Hom X Y), copy Y ∘ f = (tensor f f) ∘ copy X
  discardNatural : ∀ (X Y : C) (f : Hom X Y), discard Y ∘ f = discard X
  copyComonoid : ∀ (X : C), (tensor (copy X) (id X)) ∘ copy X = (tensor (id X) (copy X)) ∘ copy X
  discardUnital : ∀ (X : C), (tensor (discard X) (id X)) ∘ copy X = id X

def MarkovCategoryClosed {C : Type u} [Category.{v} C] (M : MarkovCategory C) : Prop :=
  ∀ (X : C), (tensor (copy X) (id X)) ∘ (M.copy X) = (tensor (id X) (copy X)) ∘ (M.copy X)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse