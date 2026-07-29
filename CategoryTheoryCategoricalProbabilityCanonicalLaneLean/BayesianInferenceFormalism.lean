import CategoricalProbabilityCanonicalLaneLean.ConditionalIndependenceFormalism

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure BayesianInferencePackage {M : MarkovCategoryPackage} where
  priorDistribution : M.category
  likelihoodFunction : M.category
  posteriorCalculation : Prop
  bayesRuleApplied : Prop

structure BayesianInferenceEvidence {M : MarkovCategoryPackage} (B : BayesianInferencePackage M) where
  posteriorCalculationClosed : B.posteriorCalculation
  bayesRuleAppliedClosed : B.bayesRuleApplied

def BayesianInferenceClosed {M : MarkovCategoryPackage} (B : BayesianInferencePackage M) : Prop :=
  B.posteriorCalculation ∧ B.bayesRuleApplied

theorem bayesian_inference_closed_from_evidence {M : MarkovCategoryPackage} (B : BayesianInferencePackage M) (E : BayesianInferenceEvidence B) : BayesianInferenceClosed B := by
  exact And.intro E.posteriorCalculationClosed E.bayesRuleAppliedClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse