import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.ConditionalProbability

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure BayesianInferencePackage {M : MarkovCategoryPackage} {G : GiryMonadPackage M}
    {C : ConditionalProbabilityPackage M G} where
  data : M.objects
  model : M.morphisms
  posteriorUpdate : M.morphisms
  bayesianUpdateRule : Prop
  convergence : Prop

structure BayesianInferenceEvidence {M : MarkovCategoryPackage} {G : GiryMonadPackage M}
    {C : ConditionalProbabilityPackage M G} (B : BayesianInferencePackage M G C) where
  bayesianUpdateRuleClosed : B.bayesianUpdateRule
  convergenceClosed : B.convergence

def BayesianInferenceClosed {M : MarkovCategoryPackage} {G : GiryMonadPackage M}
    {C : ConditionalProbabilityPackage M G} (B : BayesianInferencePackage M G C) : Prop :=
  B.bayesianUpdateRule ∧ B.convergence

theorem bayesian_inference_closed_from_evidence {M : MarkovCategoryPackage}
    {G : GiryMonadPackage M} {C : ConditionalProbabilityPackage M G}
    (B : BayesianInferencePackage M G C) (E : BayesianInferenceEvidence B) :
    BayesianInferenceClosed B := by
  exact And.intro E.bayesianUpdateRuleClosed E.convergenceClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
