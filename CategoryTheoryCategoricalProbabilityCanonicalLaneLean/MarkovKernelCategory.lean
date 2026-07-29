import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure MarkovKernelCategory where
  objectType : Type u
  objectTopology : objectType → TopologicalSpace (objectType : Type u)
  homemorphism : objectType → objectType → Type v
  kernelStructure : Prop
  compositionAssociative : Prop
  identityKernel : Prop
  kernelStructureClosed : kernelStructure
  compositionAssociativeClosed : compositionAssociative
  identityKernelClosed : identityKernel

structure MarkovKernelCategoryEvidence (C : MarkovKernelCategory) where
  kernelStructureClosed : C.kernelStructure
  compositionAssociativeClosed : C.compositionAssociative
  identityKernelClosed : C.identityKernel

def MarkovKernelCategoryClosed (C : MarkovKernelCategory) : Prop :=
  C.kernelStructure ∧ C.compositionAssociative ∧ C.identityKernel

theorem markov_kernel_category_closed_from_evidence (C : MarkovKernelCategory) (E : MarkovKernelCategoryEvidence C) :
    MarkovKernelCategoryClosed C := by
  exact And.intro E.kernelStructureClosed (And.intro E.compositionAssociativeClosed E.identityKernelClosed)

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
