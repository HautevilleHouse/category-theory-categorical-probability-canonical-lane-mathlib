import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure DisintegrationData {C : Type u} [Category.{v} C] (M : MarkovCategory C) (X Y Z : C) where
  f : Hom X (M.tensor Y Z)
  g : Hom (M.tensor X Y) Z
  conditionals : (M.copy X) ▷ (M.tensor Y) ∘ (M.assoc X X Y)⁻¹ ∘ (M.tensor (M.tensor X X) Y) = 
                  (M.copy X) ▷ (M.tensor Y) ∘ (M.assoc X X Y)⁻¹ ∘ (M.tensor (M.tensor X X) Y)

def DisintegrationClosed {C : Type u} [Category.{v} C] {M : MarkovCategory C} (D : DisintegrationData M) : Prop :=
  D.conditionals = D.conditionals

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse