
****************************************************************************************************************
*********************************	I)   CODE BOOK ABOUT DATASET FERTILITY AND ZIKV STUDY	*******************************************************
**************************************************************************************************************************

********** 1-   Manuscript Analysis ZIKV Epidemic Period Associated with Fertility Report      

**********Manuscript Analysis ZIKV Epidemic Period Associated with Fertility Report***********************************
use "C:\Users\carlos\Desktop\memoria 500 GB\MATERIAL ENVIO. ZIKA-FORTALEZA\MANUSCRITOS\ZIKA E FECUNDIDADE\BANCO E DO.file\20232802_DATASET_ZikaFertility.dta"

**** 	I- Descriptive Characteristics of Women in the Baseline

*** 1- Socioeconomic and Demographic
tab1 agegroup education skincolor ses employ cashtransfer stateprogram marital householdfood householdresid numberchild poverty wage

*** 2- Household Characteristics
tab1 sewage watersource waterstore

*** 4- Sexual and Reproductive Health
tab1 condomuse frecuencycond condomzikv knowledgemeth agefirst evenpregnant wanted abortion postponpreg  

*** 5- Medical History 
tab1 history comorbidities usedrugs smoker  

*******************************************************
**	II)	Preparing a table showing number of births and exposure to ZIKA virus three years preceding the survey
*******************************************************

***  1)  Variables Century Month Code

*Century Month Code (CMC)   women births 
gen CMCwbirth=((year(womanbirth))-1900)*12+(month(womanbirth))
gen yearwbirth=int((CMCwbirth-1)/12)+1900
gen monthwbirth=int((CMCwbirth-1)/12)+1900

*Century Month Code (CMC)   Date_of_interview
gen CMCdates=((year(dateinterview))-1900)*12+(month(dateinterview))
gen yeardates=int((CMCdates-1)/12)+1900
gen monthdates=int((CMCdates-1)/12)+1900

**Century Month Code (CMC)   Child date of birth  to the most recent birth
gen CMCbirth_02=((year(birthchild_01))-1900)*12+(month(birthchild_01))
gen CMCbirth_03=((year(birthchild_02))-1900)*12+(month(birthchild_02))
gen CMCbirth_04=((year(birthchild_03))-1900)*12+(month(birthchild_03))
gen CMCbirth_05=((year(birthchild_04))-1900)*12+(month(birthchild_04))
gen CMCbirth_06=((year(birthchild_05))-1900)*12+(month(birthchild_05))
gen CMCbirth_01=((year(birthchild_06))-1900)*12+(month(birthchild_06))


*********************************************************************************************************************
*********   III-     Total Fertility Rate, according to socioeconomic and educational gradients, 2014 to 2018 period
*********************************************************************************************************************
tabexp, length(6) ageg(5)  minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) trend(1) endy(2018)

*TFR historic  
tfr2, length(2) ageg(5)  minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) trend(1) endy(2014) 
tfr2, length(2) ageg(5)  minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) trend(1) endy(2016)
tfr2, length(2) ageg(5)  minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) trend(1) endy(2018)

*Educational level  
by education, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by education, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by education, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Socioeconomic status 
by ses, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by ses, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by ses, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Race or skin Color  
by skincolor, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by skincolor, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by skincolor, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Beneficiary of Cash Transfer Programme 
by cashtransfer, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by cashtransfer, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by cashtransfer, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Household Severe Food Insecurity 
by householdfood, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by householdfood, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by householdfood, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Household Residents
by householdresid, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by householdresid, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by householdresid, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Poverty Situation
by poverty, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by poverty, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by poverty, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Water storage 
by waterstore, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by waterstore, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by waterstore, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Uses condom in the last sexual intercourse
by condomuse, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by condomuse, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by condomuse, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 

*Wanted to get pregnant
by wanted, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) 
by wanted, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) 
by wanted, sort: tfr2, length(2) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 




**** III-  Age specific fertility rates and TFR for the last three years by education and period **Reconstructing the TFR (15–39) over 8 years, in broken periods
***********by education 

**2013-2014 period
cd "C:\results\Fertility and ZIKV"


tfr2 if  education==1, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) saver(ASFR1_`loweduc'.dta)
clear
use ASFR1_`loweduc'.dta
rename rates1 asfrlowed_`loweduc'
save, replace
replace asfrlowed_=0.07 if age==37.5

clear
tfr2 if  education==2, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) saver(ASFRhigh1_`higheduc'.dta, replace)
use ASFRhigh1_`higheduc'.dta
rename rates1 asfrhigheduc_`educhaigh'
replace asfrhigheduc_=0.08 if age==37.5
sort date 
save, replace 

merge 1:1 age using ASFR1_`loweduc'.dta
drop _merge
drop if age==.
replace asfrhigh_=. if age==37.5
twoway (line asfr* age, sort) 


**2015-2016 period
tfr2 if  education==1, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) saver(ASFR2_`loweduc'.dta, replace)
use ASFR2_`loweduc'.dta
rename rates1 asfrlowed_`loweduc'
save, replace 

tfr2 if  education==2, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) saver(ASFRhigh2_`higheduc'.dta, replace)
use ASFRhigh2_`higheduc'.dta
rename rates1 asfrhigheduc_`educhaigh'
sort date 
save, replace 

merge 1:1 age using ASFR2_`loweduc'.dta
drop _merge
drop if age==.
twoway (line asfr* age, sort) 


**2016-2018 period
tfr2 if  education==1, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) saver(ASFR3_`loweduc'.dta, replace)
use ASFR3_`loweduc'.dta
rename rates1 asfrlowed_`loweduc'
save, replace 

tfr2 if  education==2, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) saver(ASFRhigh3_`higheduc'.dta, replace)
use ASFRhigh3_`higheduc'.dta
rename rates1 asfrhigheduc_`educhaigh'
sort date 
save, replace 


merge 1:1 age using ASFR3_`loweduc'.dta
drop _merge
drop if age==.
replace asfrhigh_=. if age==37.5
twoway (line asfr* age, sort) 


***Age-specific fertility rates and TFR for the last three years by education and period
***Reconstructing the TFR (15–39) over 9 years, in broken periods
***********by socioeconomic status
 
**2013-2014 period
tfr2 if  ses==2, length(2) ageg(5) cy gr se minage(15)  maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) saver(ASFR1_`lowses'.dta, replace)
use ASFR1_`lowses'.dta
rename rates1 asfrlowses_`lowses'
replace asfrlowses_=0.01 if age==37.5
save, replace 

tfr2 if  ses==1, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2014) saver(ASFRhigh1_`highses'.dta, replace)
use ASFRhigh1_`highses'.dta
rename rates1 asfrhighses_`highses'
sort date 
save, replace 

merge 1:1 age using ASFR1_`lowses'.dta
drop _merge
drop if age==.
twoway (line asfr* age, sort) 

**2015-2016 period
tfr2 if  ses==2, length(2) ageg(5) cy gr se minage(15)  maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) saver(ASFR2_`lowses'.dta, replace)
use ASFR2_`lowses'.dta
rename rates1 asfrlowses_`lowses'
save, replace 

tfr2 if  ses==1, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2016) saver(ASFRhigh2_`highses'.dta, replace)
use ASFRhigh2_`highses'.dta
rename rates1 asfrhighses_`highses'
sort date 
save, replace 

merge 1:1 age using ASFR2_`lowses'.dta
drop _merge
drop if age==.
twoway (line asfr* age, sort) 

**2016-2018 period
tfr2 if  ses==2, length(2) ageg(5) cy gr se minage(15)  maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) saver(ASFR3_`lowses'.dta, replace)
use ASFR3_`lowses'.dta
rename rates1 asfrlowses_`lowses'
save, replace 

tfr2 if  ses==1, length(2) ageg(5) minage(15) cy gr se maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) saver(ASFRhigh3_`highses'.dta, replace)
use ASFRhigh3_`highses'.dta
rename rates1 asfrhighses_`highses'
sort date 
save, replace 

merge 1:1 age using ASFR3_`lowses'.dta
drop _merge
drop if age==.
twoway (line asfr* age, sort) 

***Reconstructing the TFR (15–39) over 9 years, in broken periods by education and socioeconomic status
graph combine education1 ses1 education2 ses2 education3 ses3, c(2) r(3)
clear

**Reconstructing the TFR (15–39) over 39years, in broken periods (2010-2018) (new version of Dr Carl Kendall's review analyzes)
tfr2,mac length(6) ageg(5) minage(15) maxage (39) bvar(CMCbirth_*) cy gt se  dates(CMCdates) wbirth(CMCwbirth)  trend(1) endy(2018) 
tfr2,mac length(6) ageg(5) minage(15) maxage (39) bvar(CMCbirth_*) cy gr se  dates(CMCdates) wbirth(CMCwbirth)  trend(1) endy(2018) 

graph combine tfrhistoric asfrhistoric

**********TFR by Sociodemographic and Socioeconomic variables 
 by agegroup, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by education, sort: tfr2, mac length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by ses, sort: tfr2,mac length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by employ, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by cashtransfer, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by stateprogram, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by householdfood, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by householdresid, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by poverty, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by wage, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by condomuse, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by agefirst, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by wanted, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by abortion, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by comorbidities, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 
 by usedrugs, sort: tfr2, length(6) ageg(5)   minage(15) maxage (39) bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018) 


*******   V-  Univariate Regression Poisson Analysis of Fertility associated with epidemic period of ZIKV
**1-Sociodemographic and Socioeconomic variables 

*Educational Level
xi: tfr2 i.education, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[_Ieducation_2]
di _se[_Ieducation_2]
di (exp(_b[_Ieducation_2]-1.96*_se[_Ieducation_2]))
di (exp(_b[_Ieducation_2]+1.96*_se[_Ieducation_2]))



** Socioeconomic status
xi: tfr2 i.ses, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[ses]
di _se[ses]
di (exp(_b[_Ises_2]-1.96*_se[_Ises_2]))
di (exp(_b[_Ises_2]+1.96*_se[_Ises_2]))

*** work card
xi: tfr2 i.employ, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[_Iemploy_2]
di _se[_Iemploy_2]
di (exp(_b[_Iemploy_2]-1.96*_se[_Iemploy_2]))
di (exp(_b[_Iemploy_2]+1.96*_se[_Iemploy_2]))

di _b[_Iemploy_3]
di _se[_Iemploy_3]
di (exp(_b[_Iemploy_3]-1.96*_se[_Iemploy_3]))
di (exp(_b[_Iemploy_3]+1.96*_se[_Iemploy_3]))

** Cash Transfer
xi: tfr2 i.cashtransfer, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[_Icashtrans_1]
di _se[_Icashtrans_1]
di (exp(_b[_Icashtrans_1]-1.96*_se[_Icashtrans_1]))
di (exp(_b[_Icashtrans_1]+1.96*_se[_Icashtrans_1]))

** Social benefit
xi: tfr2 i.stateprogram, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[_Istateprog_1]
di _se[_Istateprog_1]
di (exp(_b[_Istateprog_1]-1.96*_se[_Istateprog_1]))
di (exp(_b[_Istateprog_1]+1.96*_se[_Istateprog_1]))

** Food security
xi: tfr2 householdfood, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[householdfood]
di _se[householdfood]
di (exp(_b[householdfood]-1.96*_se[householdfood]))
di (exp(_b[householdfood]+1.96*_se[householdfood]))

** Household residents
xi: tfr2 householdresid,  frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[householdresid]
di _se[householdresid]
di (exp(_b[householdresid]-1.96*_se[householdresid]))
di (exp(_b[householdresid]+1.96*_se[householdresid]))

** Poberty situation
xi: tfr2 poverty, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[poverty]
di _se[poverty]
di (exp(_b[poverty]-1.96*_se[poverty]))
di (exp(_b[poverty]+1.96*_se[poverty]))


** Wage Minimum
xi: tfr2 i.wage, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[_Iwage_2]
di _se[_Iwage_2]
di (exp(_b[_Iwage_2]-1.96*_se[_Iwage_2]))
di (exp(_b[_Iwage_2]+1.96*_se[_Iwage_2]))

di _b[_Iwage_3]
di _se[_Iwage_3]
di (exp(_b[_Iwage_3]-1.96*_se[_Iwage_3]))
di (exp(_b[_Iwage_3]+1.96*_se[_Iwage_3]))


**** 2 Household Characteristics
xi: tfr2 watersource, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[watersource]
di _se[watersource]
di (exp(_b[watersource]-1.96*_se[watersource]))
di (exp(_b[watersource]+1.96*_se[watersource]))

xi: tfr2 watersource, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
xi: tfr2 sewage, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
xi: tfr2 storage, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

*** 3- Sexual and Reproductive Health
xi: tfr2 condomuse, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
xi: tfr2  i.frecuencycond, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
xi: tfr2  freqcamis2, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
xi: tfr2 camiprvzika, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)


**Contraceptive Methods
xi: tfr2 i.knowledgemeth , frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[_Iknowledge_2]
di _se[_Iknowledge_2]
di (exp(_b[_Iknowledge_2]-1.96*_se[_Iknowledge_2]))
di (exp(_b[_Iknowledge_2]+1.96*_se[_Iknowledge_2]))

di _b[_Iknowledge_3]
di _se[_Iknowledge_3]
di (exp(_b[_Iknowledge_3]-1.96*_se[_Iknowledge_3]))
di (exp(_b[_Iknowledge_3]+1.96*_se[_Iknowledge_3]))

di _b[Iknowledge_4]
di _se[Iknowledge_4]
di (exp(_b[Iknowledge_4]-1.96*_se[Iknowledge_4]))
di (exp(_b[Iknowledge_4]+1.96*_se[Iknowledge_4]))

** Age at first birth
xi: tfr2 i.agefirst, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)


di _b[_Iagefirst_2 ]
di _se[_Iagefirst_2 ]
di (exp(_b[_Iagefirst_2 ]-1.96*_se[_Iagefirst_2 ]))
di (exp(_b[_Iagefirst_2 ]+1.96*_se[_Iagefirst_2 ]))

di _b[_Iagefirst_3]
di _se[_Iagefirst_3]
di (exp(_b[_Iagefirst_3 ]-1.96*_se[_Iagefirst_3 ]))
di (exp(_b[_Iagefirst_3 ]+1.96*_se[_Iagefirst_3 ]))

di _b[_Iagefirst_4]
di _se[_Iagefirst_4]
di (exp(_b[_Iagefirst_4 ]-1.96*_se[_Iagefirst_4 ]))
di (exp(_b[_Iagefirst_4 ]+1.96*_se[_Iagefirst_4 ]))

di _b[_Iagefirst_5]
di _se[_Iagefirst_5]
di (exp(_b[_Iagefirst_5 ]-1.96*_se[_Iagefirst_5 ]))
di (exp(_b[_Iagefirst_5 ]+1.96*_se[_Iagefirst_5 ]))

** Wanted pregnant
xi: tfr2 wanted , frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[wanted ]
di _se[wanted ]
di (exp(_b[wanted ]-1.96*_se[wanted ]))
di (exp(_b[wanted ]+1.96*_se[wanted ]))

** Had abortion
xi: tfr2 abortion, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[abortion ]
di _se[abortion ]
di (exp(_b[abortion ]-1.96*_se[abortion ]))
di (exp(_b[abortion ]+1.96*_se[abortion ]))

***4 Medical History 
xi: tfr2  history, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

** number of morbities
xi: tfr2  comorbidities, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

di _b[comorbidities ]
di _se[comorbidities ]
di (exp(_b[comorbidities ]-1.96*_se[comorbidities ]))
di (exp(_b[comorbidities ]+1.96*_se[comorbidities ]))


** VI- Multivariate Regression Poisson Analysis of Fertility associated with epidemic period of ZIKV
**  1-Sociodemographic and Socioeconomic variables
xi: tfr2 i.education ses employ cashtransfer stateprogram householdfood householdresid wage poverty, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

xi: tfr2 i.education ses employ cashtransfer stateprogram householdresid wage poverty, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

xi: tfr2 i.education ses cashtransfer stateprogram poverty, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

xi: tfr2 i.education ses cashtransfer householdresid, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

xi: tfr2 i.education ses householdresid, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

xi: tfr2 i.education cashtransfer householdresid, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

**  2- Household Characteristics
xi: tfr2 waterstore, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)


** 3- Sexual and Reproductive Health
xi: tfr2 knowledgemeth wanted abortion comorbidities usedrugs, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

xi: tfr2 knowledgemeth wanted abortion, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

***4 Medical History 
xi: tfr2 history comorbidities smoker, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)

xi: tfr2 comorbidities, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)


****MODEL 1 crude
xi: tfr2  householdresid abortion  i.agegroup i.knowledgemeth  i.education i.ses cashtransfer comorbidities, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

****MODEL 2 crude
xi: tfr2  householdresid abortion  i.agegroup i.knowledgemeth  i.education i.ses wanted, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

****MODEL 1 adjusted 
xi: tfr2 householdresid abortion i.agegroup i.knowledgemeth  i.education, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

****MODEL 2 adjusted 
xi: tfr2  householdresid abortion i.agegroup i.wanted  i.education, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

****MODEL 3 adjusted 
xi: tfr2  abortion i.agegroup i.wanted  i.education i.ses, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

****MODEL 4 adjusted 
xi: tfr2  abortion i.agegroup i.wanted  i.education householdresid,  frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

****MODEL 5 adjusted 
xi: tfr2  abortion i.agegroup i.wanted  i.ses,  frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat





*AQUI QUEDE
*################ Final Analysis 05/09/2022

****MODEL 2 crude
xi: tfr2  householdresid abortion  i.agegroup i.knowledgemeth  i.education i.ses wanted, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat

**Age group 

*15-19
di _b[_Iagegroup_5]
di _se[_Iagegroup_5]
di (exp(_b[_Iagegroup_5]-1.96*_se[_Iagegroup_5]))
di (exp(_b[_Iagegroup_5]+1.96*_se[_Iagegroup_5]))

*20-24
di _b[_Iagegroup_4]
di _se[_Iagegroup_4]
di (exp(_b[_Iagegroup_4]-1.96*_se[_Iagegroup_4]))
di (exp(_b[_Iagegroup_4]+1.96*_se[_Iagegroup_4]))

*25-29
di _b[_Iagegroup_3]
di _se[_Iagegroup_3]
di (exp(_b[_Iagegroup_3]-1.96*_se[_Iagegroup_3]))
di (exp(_b[_Iagegroup_3]+1.96*_se[_Iagegroup_3]))

*30-34
di _b[_Iagegroup_2]
di _se[_Iagegroup_2]
di (exp(_b[_Iagegroup_2]-1.96*_se[_Iagegroup_2]))
di (exp(_b[_Iagegroup_2]+1.96*_se[_Iagegroup_2]))

**Educational level
di _b[_Ieducation_2]
di _se[_Ieducation_2]
di (exp(_b[_Ieducation_2]-1.96*_se[_Ieducation_2]))
di (exp(_b[_Ieducation_2]+1.96*_se[_Ieducation_2]))

**Socioeconomic status
di _b[_Ieducation_2]
di _se[_Ieducation_2]
di (exp(_b[_Ieducation_2]-1.96*_se[_Ieducation_2]))
di (exp(_b[_Ieducation_2]+1.96*_se[_Ieducation_2]))

**Household Residents 
di _b[householdresid]
di _se[householdresid]
di (exp(_b[householdresid]-1.96*_se[householdresid]))
di (exp(_b[householdresid]+1.96*_se[householdresid]))


**Abortion 
di _b[abortion]
di _se[abortion]
di (exp(_b[abortion]-1.96*_se[abortion]))
di (exp(_b[abortion]+1.96*_se[abortion]))


** Contraceptive Methods 
**Long Term
di _b[_Iknowledge_2 ]
di _se[_Iknowledge_2 ]
di (exp(_b[_Iknowledge_2 ]-1.96*_se[_Iknowledge_2]))
di (exp(_b[_Iknowledge_2 ]+1.96*_se[_Iknowledge_2]))

**Dont use 
di _b[_Iknowledge_3 ]
di _se[_Iknowledge_3 ]
di (exp(_b[_Iknowledge_3 ]-1.96*_se[_Iknowledge_3]))
di (exp(_b[_Iknowledge_3 ]+1.96*_se[_Iknowledge_3]))

** Wanted pregnant
di _b[wanted]
di _se[wanted]
di (exp(_b[wanted ]-1.96*_se[wanted]))
di (exp(_b[wanted ]+1.96*_se[wanted]))

** Had abortion
di _b[abortion]
di _se[abortion]
di (exp(_b[abortion ]-1.96*_se[abortion]))
di (exp(_b[abortion ]+1.96*_se[abortion]))


*******************************++++++++++++++++End analysis of Fertility and ZIKV epidemic period
xi: tfr2  pessoas i.fxetariaadjus i.desejavgravREC  i.escolalk2REC abortion, frm length(6)  ageg(5)  minage(15) maxage (39) level(95)bvar(CMCbirth_*) dates(CMCdates) wbirth(CMCwbirth) endy(2018)
fitstat


***Estimation of confidence intervals according to the Shoumaker method SE
**Age group 
*15-19
di _b[_Ifxetariaa_5]
di _se[_Ifxetariaa_5]
di (exp(_b[_Ifxetariaa_5]-1.96*_se[_Ifxetariaa_5]))
di (exp(_b[_Ifxetariaa_5]+1.96*_se[_Ifxetariaa_5]))

*20-24
di _b[_Ifxetariaa_4]
di _se[_Ifxetariaa_4]
di (exp(_b[_Ifxetariaa_4]-1.96*_se[_Ifxetariaa_4]))
di (exp(_b[_Ifxetariaa_4]+1.96*_se[_Ifxetariaa_4]))

*25-29
di _b[_Ifxetariaa_3]
di _se[_Ifxetariaa_3]
di (exp(_b[_Ifxetariaa_3]-1.96*_se[_Ifxetariaa_3]))
di (exp(_b[_Ifxetariaa_3]+1.96*_se[_Ifxetariaa_3]))

*30-34
di _b[_Ifxetariaa_2]
di _se[_Ifxetariaa_2]
di (exp(_b[_Ifxetariaa_2]-1.96*_se[_Ifxetariaa_2]))
di (exp(_b[_Ifxetariaa_2]+1.96*_se[_Ifxetariaa_2]))

**Educational level
di _b[_Iescolalk2_2]
di _se[_Iescolalk2_2]
di (exp(_b[_Iescolalk2_2]-1.96*_se[_Iescolalk2_2]))
di (exp(_b[_Iescolalk2_2]+1.96*_se[_Iescolalk2_2]))

** Wanted pregnant
di _b[_Idesejavgr_2]
di _se[_Idesejavgr_2]
di (exp(_b[_Idesejavgr_2 ]-1.96*_se[_Idesejavgr_2]))
di (exp(_b[_Idesejavgr_2 ]+1.96*_se[_Idesejavgr_2]))

** Had abortion
di _b[abortion]
di _se[abortion]
di (exp(_b[abortion ]-1.96*_se[abortion]))
di (exp(_b[abortion ]+1.96*_se[abortion]))




