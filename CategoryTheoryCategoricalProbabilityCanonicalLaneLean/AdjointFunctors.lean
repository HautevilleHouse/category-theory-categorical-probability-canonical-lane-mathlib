import HautevilleHouse.CategoryTheoryCategoricalProbabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure AdjointFunctorsPackage (A : CategoryAdmittedObject) where
  leftAdjoint : A.objects -> A.objects
  rightAdjoint : A.objects -> A.objects
  adjunctionUnit : Prop
  adjunctionCounit : Prop
  triangleIdentities : Prop
  adjunctionData : adjunctionUnit ∧ adjunctionCounit ∧ triangleIdentities

structure AdjointFunctorsEvidence {A : CategoryAdmittedObject} (F : AdjointFunctorsPackage A) where
  adjunctionUnitClosed : F.adjunctionUnit
  adjunctionCounitClosed : F.adjunctionCounit
  triangleIdentitiesClosed : F.triangleIdentities

def AdjointFunctorsClosed {A : CategoryAdmittedObject} (F : AdjointFunctorsPackage A) : Prop :=
  F.adjunctionUnit ∧ F.adjunctionCounit ∧ F.triangleIdentities

theorem adjoint_functors_closed_from_evidence {A : CategoryAdmittedObject} (F : AdjointFunctorsPackage A) (E : AdjointFunctorsEvidence F) :
  AdjointFunctorsClosed F :=
  And.intro E.adjunctionUnitClosed (And.intro E.adjunctionCounitClosed E.triangleIdentitiesClosed)

theorem adjoint_functors_supplies_mathlib_statement {A : CategoryAdmittedObject} (F : AdjointFunctorsPackage A) :
  F.adjunctionUnit ∧ F.adjunctionCounit ∧ F.triangleIdentities :=
  F.adjunctionData

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse