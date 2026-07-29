import HautevilleHouse.CategoryTheoryCategoricalProbabilityCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace CategoryTheoryCategoricalProbabilityCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  categoricalProbabilityStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary.claimBoundary,
  categoricalProbabilityStatement := "Category-theoretic categorical probability closure with monoidal Markov structures",
  certificateLane := baselineCertificateLane,
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

end CategoryTheoryCategoricalProbabilityCanonicalLaneLean
end HautevilleHouse
