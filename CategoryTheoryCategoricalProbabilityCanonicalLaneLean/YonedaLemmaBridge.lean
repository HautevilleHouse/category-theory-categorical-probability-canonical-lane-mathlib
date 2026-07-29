import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  objects : Type v
  homSets : Type w
  embeddingFullyFaithful : Prop
  naturalIsoExists : Prop
  yonedaLemmaStatement : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  embeddingFullyFaithfulClosed : Y.embeddingFullyFaithful
  naturalIsoExistsClosed : Y.naturalIsoExists
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.embeddingFullyFaithful ∧ Y.naturalIsoExists ∧ Y.yonedaLemmaStatement

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage)
    (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.embeddingFullyFaithfulClosed
    (And.intro E.naturalIsoExistsClosed E.yonedaLemmaStatementClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse