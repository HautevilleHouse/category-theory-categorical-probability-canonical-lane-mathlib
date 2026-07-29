import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure LimitColimitPackage where
  diagramType : Type u
  limitingCone : Prop
  universalProperty : Prop
  colimitCocone : Prop
  conclusion : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitingConeClosed : L.limitingCone
  universalPropertyClosed : L.universalProperty
  colimitCoconeClosed : L.colimitCocone
  conclusionClosed : L.conclusion

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitingCone ∧ L.universalProperty ∧ L.colimitCocone ∧ L.conclusion

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.limitingConeClosed (And.intro E.universalPropertyClosed
    (And.intro E.colimitCoconeClosed E.conclusionClosed))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
