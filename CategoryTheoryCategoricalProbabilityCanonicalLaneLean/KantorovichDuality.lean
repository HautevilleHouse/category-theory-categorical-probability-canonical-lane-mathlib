import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure KantorovichDualityPackage where
  polishSpace : Type u
  polishTopology : TopologicalSpace polishSpace
  metric : polishSpace → polishSpace → ℝ
  probabilityMeasures : Type v
  transportKernel : Type w
  dualCharacterization : Prop
  wassersteinDistance : Prop
  dualCharacterizationClosed : dualCharacterization
  wassersteinDistanceClosed : wassersteinDistance

structure KantorovichDualityEvidence (K : KantorovichDualityPackage) where
  dualCharacterizationClosed : K.dualCharacterization
  wassersteinDistanceClosed : K.wassersteinDistance

def KantorovichDualityClosed (K : KantorovichDualityPackage) : Prop :=
  K.dualCharacterization ∧ K.wassersteinDistance

theorem kantorovich_duality_closed_from_evidence (K : KantorovichDualityPackage) (E : KantorovichDualityEvidence K) :
    KantorovichDualityClosed K := by
  exact And.intro E.dualCharacterizationClosed E.wassersteinDistanceClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
