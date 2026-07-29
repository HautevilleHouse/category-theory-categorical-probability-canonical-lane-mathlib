import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure BayesianInversionPackage (A : AdmissibleClass) where
  priorChoice : Prop
  likelihood : Prop
  posteriorComputed : Prop
  bayesRule : Prop

structure BayesianInversionEvidence {A : AdmissibleClass} (B : BayesianInversionPackage A) where
  priorChoiceClosed : B.priorChoice
  likelihoodClosed : B.likelihood
  posteriorComputedClosed : B.posteriorComputed
  bayesRuleClosed : B.bayesRule

def BayesianInversionClosed {A : AdmissibleClass} (B : BayesianInversionPackage A) : Prop :=
  B.priorChoice ∧ B.likelihood ∧ B.posteriorComputed ∧ B.bayesRule

theorem bayesian_inversion_closed_from_evidence {A : AdmissibleClass}
    (B : BayesianInversionPackage A) (E : BayesianInversionEvidence B) :
    BayesianInversionClosed B := by
  exact And.intro E.priorChoiceClosed (And.intro E.likelihoodClosed (And.intro E.posteriorComputedClosed E.bayesRuleClosed))

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
