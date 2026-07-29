import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure GiryMonadPackage where
  baseCategory : Type u
  baseTopology : TopologicalSpace baseCategory
  measurableSpace : baseCategory → MeasurableSpace (baseCategory : Type u)
  probabilityMeasureSpace : Type v
  monadStructure : Prop
  returnMap : baseCategory → probabilityMeasureSpace
  bindMap : probabilityMeasureSpace → (baseCategory → probabilityMeasureSpace) → probabilityMeasureSpace
  monadLaws : Prop
  monadStructureClosed : monadStructure
  monadLawsClosed : monadLaws

structure GiryMonadEvidence (G : GiryMonadPackage) where
  monadStructureClosed : G.monadStructure
  monadLawsClosed : G.monadLaws

def GiryMonadClosed (G : GiryMonadPackage) : Prop :=
  G.monadStructure ∧ G.monadLaws

theorem giry_monad_closed_from_evidence (G : GiryMonadPackage) (E : GiryMonadEvidence G) :
    GiryMonadClosed G := by
  exact And.intro E.monadStructureClosed E.monadLawsClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
