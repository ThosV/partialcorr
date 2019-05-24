# partialcorr
Partial Correlation Function in Python

Implements a simple partial correlation: given vectors X, Y, and Z, partialcorr() returns a tuple (rho, residZX, residZY). 

Rho is the correlation between X and Y when controlling for Z.
ResidZX and residZY are the residuals from corr(Z, X) and corr(Z, Y).
