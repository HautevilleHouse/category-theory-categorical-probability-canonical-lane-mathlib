import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure DisintegrationTheoremPackage where
  sourceMarkovCategory : Type u
  targetMeasurableSpace : Type v
  kernelFamily : sourceMarkovCategory → targetMeasurableSpace → Type w
  conditioningKernel : Prop
  disintegrationUniqueness : Prop
  regularConditionalDistribution : Prop
  conditioningKernelClosed : conditioningKernel
  disintegrationUniquenessClosed : disintegrationUniqueness
  regularConditionalDistributionClosed : regularConditionalDistribution

structure DisintegrationTheoremEvidence (D : DisintegrationTheoremPackage) where
  conditioningKernelClosed : D.conditioningKernel
  disintegrationUniquenessClosed : D.disintegrationUniqueness
  regularConditionalDistributionClosed : D.regularConditionalDistribution

def DisintegrationTheoremClosed (D : DisintegrationTheoremPackage) : Prop :=
  D.conditioningKernel ∧ D.disintegrationUniqueness ∧ D.regularConditionalDistribution

theorem disintegration_theorem_closed_from_evidence (D : DisintegrationTheoremPackage) (E : DisintegrationTheoremEvidence D) :
    DisintegrationTheoremClosed D := by
  exact And.intro E.conditioningKernelClosed (And.intro E.disintegrationUniquenessClosed E.regularConditionalDistributionClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
