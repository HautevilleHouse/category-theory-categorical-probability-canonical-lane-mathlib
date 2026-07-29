import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.CategoryProbabilityFoundation

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure GiryMonadStructure (F : CategoryProbabilityFoundation) where
  measurableSpaces : Type u
  giryMonad : Monad measurableSpaces
  monadLaws : Prop
  monadLawsTerm : monadLaws
  functorLifting : F.markovCategory ⥤ measurableSpaces
  liftingCompatibility : Prop
  liftingCompatibilityTerm : liftingCompatibility

structure GiryMonadStructureEvidence {F : CategoryProbabilityFoundation} (G : GiryMonadStructure F) where
  monadLawsClosed : G.monadLaws
  liftingCompatibilityClosed : G.liftingCompatibility

def GiryMonadStructureClosed {F : CategoryProbabilityFoundation} (G : GiryMonadStructure F) : Prop :=
  G.monadLaws ∧ G.liftingCompatibility

theorem giry_monad_structure_closed_from_evidence
    {F : CategoryProbabilityFoundation} (G : GiryMonadStructure F)
    (E : GiryMonadStructureEvidence G) : GiryMonadStructureClosed G := by
  exact And.intro E.monadLawsClosed E.liftingCompatibilityClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
