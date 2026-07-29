import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.GiryMonadStructure
import canonicalLaneMathlib.KleisliCategoryEvidence
import Mathlib.MeasureTheory.ProbabilityMeasure

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure EndpointClassificationPackage
    {F : CategoryProbabilityFoundation} {G : GiryMonadStructure F}
    (K : KleisliCategoryEvidence F) where
  targetCategory : Type u
  targetCategoryStruct : Category targetCategory
  equivalenceWithKleisli : K.kleisliCategory ≌ targetCategory
  probabilityMeasuresOnTarget : Type v
  morphismsPreserveProbability : Prop
  endpointStatement : Prop

structure EndpointClassificationEvidence
    {F : CategoryProbabilityFoundation} {G : GiryMonadStructure F}
    {K : KleisliCategoryEvidence F}
    (E : EndpointClassificationPackage K) where
  equivalenceClosed : E.equivalenceWithKleisli.isEquivalence
  morphismsPreserveProbabilityClosed : E.morphismsPreserveProbability
  endpointStatementClosed : E.endpointStatement

def EndpointClassificationClosed
    {F : CategoryProbabilityFoundation} {G : GiryMonadStructure F}
    {K : KleisliCategoryEvidence F}
    (E : EndpointClassificationPackage K) : Prop :=
  E.equivalenceWithKleisli.isEquivalence ∧
  E.morphismsPreserveProbability ∧
  E.endpointStatement

theorem endpoint_classification_closed_from_evidence
    {F : CategoryProbabilityFoundation} {G : GiryMonadStructure F}
    {K : KleisliCategoryEvidence F} (E : EndpointClassificationPackage K)
    (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.equivalenceClosed
    (And.intro Ev.morphismsPreserveProbabilityClosed Ev.endpointStatementClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
