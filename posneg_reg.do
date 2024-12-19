generate Review_Length = WC
generate lReviewer_Exper = log(Reviewer_Exper + 1)
generate lCities_Visited = log(Cities_Visited + 1)

generate CSM_lReviewExper = CSM_10 * lReviewer_Exper 
generate CSM_ReviewValence = CSM_10 * Review_Valence
generate CSM_lReviewExper_im_pos = CSM_10_im_pos * lReviewer_Exper 
generate CSM_ReviewValence_im_pos = CSM_10_im_pos * Review_Valence
generate CSM_lReviewExper_im_neg = CSM_10_im_neg * lReviewer_Exper 
generate CSM_ReviewValence_im_neg = CSM_10_im_neg * Review_Valence

** 1
nbreg Num_Helpful CSM_10 LSM_10 CSM_lReviewExper CSM_ReviewValence Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited V0-V199 i.HotelID, vce(cluster HotelID)
outreg2 using "Reg.doc",keep(CSM_10 LSM_10 CSM_lReviewExper CSM_ReviewValence CSM_lReviewExper CSM_ReviewValence Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) replace

nbreg Num_Helpful CSM_10_im_pos LSM_10 CSM_lReviewExper_im_pos CSM_ReviewValence_im_pos Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg.doc",keep(CSM_10_im_pos LSM_10 CSM_lReviewExper_im_pos CSM_ReviewValence_im_pos Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful CSM_10_im_neg LSM_10 CSM_lReviewExper_im_neg CSM_ReviewValence_im_neg Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg.doc",keep(CSM_10_im_neg LSM_10 CSM_lReviewExper_im_neg CSM_ReviewValence_im_neg Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append



** 2
nbreg Num_Helpful CSM_10_im_pos LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2.doc",keep(CSM_10_im_pos LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) replace

nbreg Num_Helpful CSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2.doc",keep(CSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful CSM_10_im_pos CSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2.doc",keep(CSM_10_im_pos CSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful CSM_10_im_pos CSM_10_im_neg CSM_lReviewExper_im_pos CSM_ReviewValence_im_pos LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2.doc",keep(CSM_10_im_pos CSM_10_im_neg CSM_lReviewExper_im_pos CSM_ReviewValence_im_pos  LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful CSM_10_im_pos CSM_10_im_neg CSM_lReviewExper_im_pos CSM_ReviewValence_im_pos CSM_lReviewExper_im_neg CSM_ReviewValence_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2.doc",keep(CSM_10_im_pos CSM_10_im_neg CSM_lReviewExper_im_pos CSM_ReviewValence_im_pos CSM_lReviewExper_im_neg CSM_ReviewValence_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

* wght
nbreg Num_Helpful CSM_10_im_pos_wght LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2_wght.doc",keep(CSM_10_im_pos_wght LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) replace

nbreg Num_Helpful CSM_10_im_neg_wght LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2_wght.doc",keep(CSM_10_im_neg_wght LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful CSM_10_im_pos_wght CSM_10_im_neg_wght LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "Reg2_wght.doc",keep(CSM_10_im_pos_wght CSM_10_im_neg_wght LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

**try 2
generate Review_Length = WC
generate lReviewer_Exper = log(Reviewer_Exper)
generate lCities_Visited = log(Cities_Visited)
generate lCSM_10_im_pos = -1*log(-1*CSM_10_im_pos+0)
generate lCSM_10_im_neg  = -1*log(-1*CSM_10_im_neg+0)
generate lCSM_10  = -1*log(-1*CSM_10+0)
generate lCSM_lReviewExper = lCSM_10 * lReviewer_Exper 
generate lCSM_ReviewValence = lCSM_10 * Review_Valence
generate lCSM_lReviewExper_im_pos = lCSM_10_im_pos * lReviewer_Exper 
generate lCSM_ReviewValence_im_pos = lCSM_10_im_pos * Review_Valence
generate lCSM_lReviewExper_im_neg = lCSM_10_im_neg * lReviewer_Exper 
generate lCSM_ReviewValence_im_neg = lCSM_10_im_neg * Review_Valence

** 1-2
nbreg Num_Helpful lCSM_10 LSM_10 lCSM_lReviewExper lCSM_ReviewValence Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited V0-V199 i.HotelID, vce(cluster HotelID)
outreg2 using "lReg.doc",keep(lCSM_10 LSM_10 lCSM_lReviewExper lCSM_ReviewValence Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) replace

nbreg Num_Helpful lCSM_10_im_pos LSM_10 lCSM_lReviewExper_im_pos lCSM_ReviewValence_im_pos Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg.doc",keep(lCSM_10_im_pos LSM_10 lCSM_lReviewExper_im_pos lCSM_ReviewValence_im_pos Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful lCSM_10_im_neg LSM_10 lCSM_lReviewExper_im_neg lCSM_ReviewValence_im_neg Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg.doc",keep(lCSM_10_im_neg LSM_10 lCSM_lReviewExper_im_neg lCSM_ReviewValence_im_neg Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

** 2-2
nbreg Num_Helpful lCSM_10_im_pos LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg2.doc",keep(lCSM_10_im_pos LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) replace

nbreg Num_Helpful lCSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg2.doc",keep(lCSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful lCSM_10_im_pos lCSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg2.doc",keep(lCSM_10_im_pos lCSM_10_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful lCSM_10_im_pos lCSM_10_im_neg lCSM_lReviewExper_im_pos lCSM_ReviewValence_im_pos LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg2.doc",keep(lCSM_10_im_pos lCSM_10_im_neg lCSM_lReviewExper_im_pos lCSM_ReviewValence_im_pos  LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

nbreg Num_Helpful lCSM_10_im_pos lCSM_10_im_neg lCSM_lReviewExper_im_pos lCSM_ReviewValence_im_pos lCSM_lReviewExper_im_neg lCSM_ReviewValence_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited i.HotelID V0-V199, vce(cluster HotelID)
outreg2 using "lReg2.doc",keep(lCSM_10_im_pos lCSM_10_im_neg lCSM_lReviewExper_im_pos lCSM_ReviewValence_im_pos lCSM_lReviewExper_im_neg lCSM_ReviewValence_im_neg LSM_10 Review_Valence Readability Review_Length Elapsed_Day No_Disclosure Female Mid_Age Old_Age lReviewer_Exper lCities_Visited) adds(Log Likelihood, e(ll)) append

