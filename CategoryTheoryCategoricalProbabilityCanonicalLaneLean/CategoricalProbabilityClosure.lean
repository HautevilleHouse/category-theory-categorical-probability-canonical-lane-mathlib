import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure CategoricalProbabilityPackage where
  markovKernel : Type u
  lawvereMetric : Prop
  bayesianInversion : Prop
  entropyFunctional : Prop
  conclusion : Prop

structure CategoricalProbabilityEvidence (C : CategoricalProbabilityPackage) where
  markovKernelClosed : C.markovKernel
  lawvereMetricClosed : C.lawvereMetric
  bayesianInversionClosed : C.bayesianInversion
  entropyFunctionalClosed : C.entropyFunctional
  conclusionClosed : C.conclusion

def CategoricalProbabilityClosed (C : CategoricalProbabilityPackage) : Prop :=
  C.markovKernel ∧ C.lawvereMetric ∧ C.bayesianInversion ∧ C.entropyFunctional ∧ C.conclusion

theorem categorical_probability_closed_from_evidence (C : CategoricalProbabilityPackage)
    (E : CategoricalProbabilityEvidence C) : CategoricalProbabilityClosed C := by
  exact And.intro E.markovKernelClosed (And.intro E.lawvereMetricClosed
    (And.intro E.bayesianInversionClosed (And.intro E.entropyFunctionalClosed E.conclusionClosed)))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
