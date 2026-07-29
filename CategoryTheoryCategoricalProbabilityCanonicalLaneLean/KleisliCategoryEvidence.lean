import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.CategoryProbabilityFoundation
import canonicalLaneMathlib.GiryMonadStructure

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure KleisliCategoryEvidence (F : CategoryProbabilityFoundation) where
  probabilityMonad : F.probabilityMonad
  kleisliCategory : Type u
  kleisliCategoryStruct : Category kleisliCategory
  embedding : F.markovCategory ⥤ kleisliCategory
  embeddingFullFaithful : Prop
  embeddingFullFaithfulTerm : embeddingFullFaithful

structure KleisliCategoryEvidenceClosed {F : CategoryProbabilityFoundation}
    (K : KleisliCategoryEvidence F) : Prop :=
  K.embeddingFullFaithful

def KleisliCategoryEvidenceClosedDef {F : CategoryProbabilityFoundation}
    (K : KleisliCategoryEvidence F) : Prop :=
  K.embeddingFullFaithful

theorem kleisli_category_evidence_closed_iff
    {F : CategoryProbabilityFoundation} (K : KleisliCategoryEvidence F) :
    KleisliCategoryEvidenceClosedDef K ↔ KleisliCategoryEvidenceClosed K := by
  rfl

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
