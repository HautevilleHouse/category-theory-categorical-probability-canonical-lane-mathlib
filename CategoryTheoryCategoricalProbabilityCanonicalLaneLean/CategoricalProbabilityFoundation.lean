import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.MarkovCategories
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.BayesianInversion
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure CategoricalProbabilityFoundation (A : AdmissibleClass) where
  markov : MarkovCategoryPackage A
  markovEvidence : MarkovCategoryEvidence markov
  bayesian : BayesianInversionPackage A
  bayesianEvidence : BayesianInversionEvidence bayesian

def CategoricalProbabilityFoundationClosed {A : AdmissibleClass}
    (F : CategoricalProbabilityFoundation A) : Prop :=
  MarkovCategoryClosed F.markov ∧ BayesianInversionClosed F.bayesian

theorem categorical_probability_foundation_closed_from_evidence
    {A : AdmissibleClass} (F : CategoricalProbabilityFoundation A) :
    CategoricalProbabilityFoundationClosed F := by
  exact And.intro
    (markov_category_closed_from_evidence F.markov F.markovEvidence)
    (bayesian_inversion_closed_from_evidence F.bayesian F.bayesianEvidence)

theorem categorical_probability_foundation_yields_endgame
    {A : AdmissibleClass} (F : CategoricalProbabilityFoundation A) :
    ConstrainedCategoricalProbabilityClosure A := by
  exact constrained_categorical_probability_endgame A

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
