import CategoricalProbabilityCanonicalLaneLean.CategoricalProbabilityAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovCategoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse