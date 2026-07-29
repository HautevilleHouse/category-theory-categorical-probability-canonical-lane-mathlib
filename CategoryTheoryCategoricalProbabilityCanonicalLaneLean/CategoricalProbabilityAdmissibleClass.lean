import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure MarkovCategoryAdmittedObject where
  category : Type u
  monoidalStructure : Type v
  randomMaps : Prop
  deterministicMaps : Prop
  conclusion : randomMaps ∧ deterministicMaps

structure AdmissibleClass where
  object : MarkovCategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovCategoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def MarkovCategoryWitnessClosed (O : MarkovCategoryAdmittedObject) : Prop :=
  O.conclusion

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse