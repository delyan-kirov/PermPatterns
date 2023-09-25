# Testing Vincluar agains the Bivincular models

The mixed model seems to have a big influence. Not only did soleving halfed for
SavileRow in the case of length 8, but the actual solving time was also slightly
better. For larger inputs, SavileRow refuses to continue, producing errors
instead.

It also seems that SavileRow is effected by combining models together, even when
this combination is effectively redundant. While the models produce the same
results and SavileRow likely optizes the actual solving process, the overall
time for solving is increased by almost 2 minutes.

---
