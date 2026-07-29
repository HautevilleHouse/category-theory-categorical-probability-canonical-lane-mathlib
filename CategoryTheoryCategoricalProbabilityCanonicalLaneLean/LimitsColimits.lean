import HautevilleHouse.CategoryTheoryCategoricalProbabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure LimitsColimitsPackage (A : CategoryAdmittedObject) where
  diagramType : Type u
  limitObject : A.objects
  colimitObject : A.objects
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop
  limitsExist : universalPropertyLimit ∧ universalPropertyColimit

structure LimitsColimitsEvidence {A : CategoryAdmittedObject} (L : LimitsColimitsPackage A) where
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit

def LimitsColimitsClosed {A : CategoryAdmittedObject} (L : LimitsColimitsPackage A) : Prop :=
  L.universalPropertyLimit ∧ L.universalPropertyColimit

theorem limits_colimits_closed_from_evidence {A : CategoryAdmittedObject} (L : LimitsColimitsPackage A) (E : LimitsColimitsEvidence L) :
  LimitsColimitsClosed L :=
  And.intro E.universalPropertyLimitClosed E.universalPropertyColimitClosed

theorem limits_colimits_supplies_mathlib_statement {A : CategoryAdmittedObject} (L : LimitsColimitsPackage A) :
  L.universalPropertyLimit ∧ L.universalPropertyColimit :=
  L.limitsExist

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse