# PricingLifeInsuranceProducts
## Model to Price Life Insurance Products based on Actuarial Techniques in R.

#### Life insurances products are contracts that promise one or more payments upon occurrence of a life-contingent event. For example,
* Life insurance contracts promise payments of a lump sum in case the insured dies within the period defined in the contract.
* Annuity contracts pay a sum of money at the beginning (or the end) of each period, until the the term of the contract or the insured's death, whichever occurs first.
* Endowment contracts pay a sum at the minimum between insured's death or the term of the contract.

#### Pricing life insurance contracts is performed in several steps:
* Define the financial and demographical assumptions, that is, the interest rate that will be used to discount future cash flows as well as the life table to estimate survival probabilities.
* Determine the actuarial present value (APV) of life-contingent cash flows, that is, the actual price of the contractually promised benefits and eventual expense and profit loads.
* Determine the premium(s), taking into account that it can be paid as a lump sum or within periodic installments.

#### Pricing life insurance contracts requires demographical assumptions to be set out since future cash flows are contingent on policyholders life status (life contingencies).
#### Similarly, financial assumptions are required as well since the long duration of life contracts allows the insurer to invest premiums and reserves proceeds.
#### The example that follows is worked out with R package lifecontingencies
#### The interest rate is assumed as 6%.

### Please open the 'PricingLifeInsuranceModel.R' to view the R code.


