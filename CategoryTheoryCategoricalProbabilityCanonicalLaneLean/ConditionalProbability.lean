import CategoryTheoryCategoricalProbabilityCanonicalLaneLean.GiryMonad

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure ConditionalProbabilityPackage {M : MarkovCategoryPackage} {G : GiryMonadPackage M} where
  X : M.objects
  Y : M.objects
  prior : M.morphisms
  likelihood : M.morphisms
  posterior : M.morphisms
  bayesRule : Prop
  chapmanKolmogorov : Prop

structure ConditionalProbabilityEvidence {M : MarkovCategoryPackage} {G : GiryMonadPackage M}
    (C : ConditionalProbabilityPackage M G) where
  bayesRuleClosed : C.bayesRule
  chapmanKolmogorovClosed : C.chapmanKolmogorov

def ConditionalProbabilityClosed {M : MarkovCategoryPackage} {G : GiryMonadPackage M}
    (C : ConditionalProbabilityPackage M G) : Prop :=
  C.bayesRule ∧ C.chapmanKolmogorov

theorem conditional_probability_closed_from_evidence {M : MarkovCategoryPackage}
    {G : GiryMonadPackage M} (C : ConditionalProbabilityPackage M G)
    (E : ConditionalProbabilityEvidence C) : ConditionalProbabilityClosed C := by
  exact And.intro E.bayesRuleClosed E.chapmanKolmogorovClosed

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
