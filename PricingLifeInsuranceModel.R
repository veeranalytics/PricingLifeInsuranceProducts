# Import Libraries
library(lifecontingencies)

# Import data
# Life Table data downloaded from Society of Acturies website
data(soaLt)

# Generate the actuarial table object using an interest rate of 6%
soaAct <- new("actuarialtable", x=soaLt$x, lx=soaLt$Ix, interest=0.06)

# Export in a dataframe showing corresponding commutation functions
soaActDf <- as(soaAct, "data.frame")
head(soaActDf)

# Definition of terms used in Actuarial Table
# x = Age interval (e.g. 1 year, 0-5 years, etc)
# Nx = Number alive at the beginning of the age interval x
# lx = Proportion alive at the beginning of age interval x
# Dx = Dx = v**x * lx, where v = 1/(1+interest rate)
# Cx =  v**(x+1) * dx, where v = 1/(1+interest rate) and 
# dx is The number of deaths between exact ages x and x+1
# Mx = Cx + Cx+1 + Cx+2 + ....
# Rx = The number of female offspring produced per female of age x 

# Example 01:
# The probability to actually pay 100,000 is, for each age, 
# for the policyholder's age to be 36 and for a simple 3-year term life insurance policy
(probdeath <- -diff(soaActDf$lx)[soaActDf$x%in%36:38]/soaActDf$lx[soaActDf$x==36])

# Calculate Discount Factor
disc <- (1+0.06)^(-(1:3))
disc

# Calculate the actuarial present value
sum(disc*probdeath) * 100000

# Example 02:
# the benefit premium for a whole life insurance of a policyholder aged
# 25 paid at the beginning of the first 10 years the insured is alive
P <- Axn(soaAct,25)/axn(soaAct,25,10)
P

############ Pricing a Life Insurance Product ##################
# Scenario: A term life insurance is to be sold to 1,000 individuals each
# aged 25, term is 40 years. Face value is 100,000, single premium.
# Assume SoA illustrative life table to hold, interest rate 6%
# Acquisition and handling expenses are: 3% of premium. Profit
# load is 15% of the portfolio benefit distribution.
# Calculate Premium

#define the size of the portfolio
portfolioSize=1000 

# price the contract
oneContractDistribution=100000*rLifeContingencies(n=50000,lifecontingency="Axn", object=soaAct,x=25,t=40,parallel=TRUE)

#mean value of the insured benefits for the whole portfolio
meanValue=portfolioSize*100000*Axn(soaAct,25,40)

#VaR allocated capital
allocatedCapital=qnorm(p=0.99,mean=meanValue, sd=sd(oneContractDistribution)*sqrt(portfolioSize))-meanValue 

#allocate profit to single policy
profitLoadPerContract=0.15*allocatedCapital/portfolioSize 
                                                  
#calculate the premium
Premium = (100000*Axn(soaAct,25,40)+profitLoadPerContract)/(1-0.03) 
Premium


             
             





