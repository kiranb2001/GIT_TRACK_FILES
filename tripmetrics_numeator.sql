------- ********** VOICE NER RATIO 3G ------------- ************

SELECT partnercountryid,partnernetworkid,tripstatus,sum(nerratio3g) from
(
    select
	partnercountryid,partnernetworkid,tripstatus,
	CAST((mocallsuccess3g + mtcallsuccess3g) AS DOUBLE) / NULLIF(CAST((mocallattempts3g + mtcallattempts3g) AS DOUBLE), 0) AS nerratio3g
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
) group by partnercountryid,partnernetworkid,tripstatus;


------- ********** VOICE NER RATIO VOLTE ------------- ************

SELECT partnercountryid,partnernetworkid,tripstatus,sum(nerratiovolte) from
(
    select
	partnercountryid,partnernetworkid,tripstatus,
	CAST((mocallsuccessvolte + mtcallsuccessvolte) AS DOUBLE) / NULLIF(CAST((mocallattemptsvolte + mtcallattemptsvolte) AS DOUBLE), 0) AS nerratiovolte
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
) group by partnercountryid,partnernetworkid,tripstatus;


---------------------- *********** VOICE NER OVERALL RATIO ***************------------------------

SELECT  partnercountryid,partnernetworkid,tripstatus,sum(nerratio) from
(
    select
    CAST((mocallsuccessvolte + mtcallsuccessvolte+mocallsuccess3g+mtcallsuccess3g) AS DOUBLE) / NULLIF(CAST((mocallattemptsvolte + mtcallattemptsvolte+mocallattempts3g+ mtcallattempts3g) AS DOUBLE), 0) AS nerratio
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

----------- ******** VOICE CCR_3G RATIO  ********** ---------------------

select
	partnercountryid,partnernetworkid,tripstatus,sum(ccrratio3g)
from
	(
	select
		cast((mocallanswered3g + mtcallanswered3g)-((mocalldrop3g + mtcalldrop3g )) as DOUBLE) / nullif(cast((mocallanswered3g + mtcallanswered3g) as DOUBLE),
		0) as ccrratio3g
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

----------- ******** VOICE CCR_VOLTE RATIO  ********** ---------------------

select
	partnercountryid,partnernetworkid,tripstatus,sum(ccrratiovolte)
from
	(
	select
		cast((mocallansweredvolte + mtcallansweredvolte)-((mocalldropvolte + mtcalldropvolte )) as DOUBLE) / nullif(cast((mocallansweredvolte + mtcallansweredvolte) as DOUBLE),
		0) as ccrratiovolte
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* VOICE  CCR OVERALL RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(ccrratio)
from
	(
	select
		cast((mocallansweredvolte + mtcallansweredvolte + mocallanswered3g + mtcallanswered3g)-((mocalldropvolte + mtcalldropvolte + mocalldrop3g + mtcalldrop3g)) as DOUBLE) / nullif(cast((mocallansweredvolte + mtcallansweredvolte + mocallanswered3g + mtcallanswered3g) as DOUBLE),
		0) as ccr_ratio
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


-------- ********* VOICE  3G RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(callavgscore3g)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* VOICE  4g RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(callavgscorevolte)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* VOICE  OVERALL RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(callavgscore)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


*************--------------- Registration overallscore without excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(regavgscore)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


*************--------------- Registration overallscore with excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(regavgscoreexcludingsor)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

*************--------------- Registration successscore without excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(regsucessratioscore)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

*************--------------- Registration successscore with excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(regsucessratioscoreexcludingsor)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

*************--------------- Registration latencyscore without excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(reglatencyratioscore)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


*************--------------- Registration latencyscore with excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(reglatencyratioscoreexcludingsor)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

*************---------------  overallscore without excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(overallavgscore)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


*************--------------- overallscore with excluding sor -----------------***************

select
	partnercountryid,partnernetworkid,tripstatus,sum(overallavgscoreexcludingsor)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

**************----------- DATA SESSION ESTABLISHMENT 3G SCORE -----------------*************
select
	partnercountryid,partnernetworkid,tripstatus,sum(data_establishment_3g)
from
	(
	select
		cast((sessionattempts3g-sessionfailures3g) as DOUBLE) / nullif(cast((sessionattempts3g) as DOUBLE),0) as data_establishment_3g
	FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

**************----------- DATA SESSION ESTABLISHMENT 4g SCORE -----------------*************
select
	partnercountryid,partnernetworkid,tripstatus,sum(data_establishment_4g)
from
	(
	select
		cast((sessionattempts4g-sessionfailures4g) as DOUBLE) / nullif(cast((sessionattempts4g) as DOUBLE),0) as data_establishment_4g
	FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

***********-------- DATA SESSION ESTABLISHMENT SCORE -------------------*************
select
	partnercountryid,partnernetworkid,tripstatus,sum(data_establishment)
from
	(
	select
		cast((sessionattempts4g+sessionattempts3g)-(sessionfailures4g+sessionfailures3g) as DOUBLE) / nullif(cast((sessionattempts4g+sessionattempts3g) as DOUBLE),0) as data_establishment
	FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

****************--------- DATA RETENTION SCORE ----------------************

select
	partnercountryid,partnernetworkid,tripstatus,sum(data_retention)
from
	(
	select
		cast((sessionattempts4g+sessionattempts3g)-(sessionfailures4g+sessionfailures3g)-(sessiondropped4g+sessiondropped3g) as DOUBLE) / nullif(cast((sessionattempts4g+sessionattempts3g)-(sessionfailures4g+sessionfailures3g) as DOUBLE),0) as data_retention
		FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


****************--------- DATA RETENTION 3g SCORE ----------------************

select
	partnercountryid,partnernetworkid,tripstatus,sum(data_retention_3g)
from
	(
	select
		cast((sessionattempts3g)-(sessionfailures3g)-(sessiondropped3g) as DOUBLE) / nullif(cast((sessionattempts3g)-(sessionfailures3g) as DOUBLE),0) as data_retention_3g
    FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

****************--------- DATA RETENTION 4g SCORE ----------------************

select
	partnercountryid,partnernetworkid,tripstatus,sum(data_retention_4g)
from
	(
	select
		cast((sessionattempts4g)-(sessionfailures4g)-(sessiondropped4g) as DOUBLE) / nullif(cast((sessionattempts4g)-(sessionfailures4g) as DOUBLE),0) as data_retention_4g
    FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

----------************** SMS SUCCESS RAIO OVERALL ***************---------------------------

SELECT partnercountryid,partnernetworkid,tripstatus,sum(smsoverall) from
(
    select
	CAST((mosmssuccess3g + mtsmssuccess3g + mosmssuccessvolte + mtsmssuccessvolte) AS DOUBLE) / NULLIF(CAST((mosmsattempts3g + mtsmsattempts3g + mosmsattemptsvolte + mtsmsattemptsvolte) AS DOUBLE), 0) AS smsoverall
    from  trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
) group by partnercountryid,partnernetworkid,tripstatus;


----------************** SMS SUCCESS RAIO 3G ***************---------------------------

SELECT partnercountryid,partnernetworkid,tripstatus,sum(smsoverall3g) from
(
    select
	CAST((mosmssuccess3g + mtsmssuccess3g) AS DOUBLE) / NULLIF(CAST((mosmsattempts3g + mtsmsattempts3g) AS DOUBLE), 0) AS smsoverall3g
from  trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


----------************** SMS SUCCESS RAIO volte ***************---------------------------

SELECT partnercountryid,partnernetworkid,tripstatus,sum(smsoverallvolte) from
(
    select
	CAST((mosmssuccessvolte + mtsmssuccessvolte) AS DOUBLE) / NULLIF(CAST((mosmsattemptsvolte + mtsmsattemptsvolte) AS DOUBLE), 0) AS smsoverallvolte
from  trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

----------************** SMS latency RAIO OVERALL ***************---------------------------

SELECT partnercountryid,partnernetworkid,tripstatus,sum(smsoverall) from
(
    select
	CAST((mosmslatency3g + mtsmslatency3g + mosmslatencyvolte + mtsmslatencyvolte) AS DOUBLE) / NULLIF(CAST((mosmsattempts3g + mtsmsattempts3g + mosmsattemptsvolte + mtsmsattemptsvolte) AS DOUBLE), 0) AS smsoverall
    from  trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
) group by partnercountryid,partnernetworkid,tripstatus;


----------************** SMS latency RAIO 3G ***************---------------------------

SELECT partnercountryid,partnernetworkid,tripstatus,sum(smsoverall3g) from
(
    select
	CAST((mosmslatency3g + mtsmslatency3g) AS DOUBLE) / NULLIF(CAST((mosmsattempts3g + mtsmsattempts3g) AS DOUBLE), 0) AS smsoverall3g
from  trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;


----------************** SMS latency RAIO volte ***************---------------------------

SELECT partnercountryid,partnernetworkid,tripstatus,sum(smsoverallvolte) from
(
    select
	CAST((mosmslatencyvolte + mtsmslatencyvolte) AS DOUBLE) / NULLIF(CAST((mosmsattemptsvolte + mtsmsattemptsvolte) AS DOUBLE), 0) AS smsoverallvolte
from  trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* SMS  3G RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(smsavgscore3g)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* SMS volte RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(smsavgscorevolte)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* SMS OVERALL RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(smsavgscore)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- *********DATA Throughput 3G RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(datathroughputscore3g)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

-------- ********* Data Throughput 4g RATIO --------------- **************

select
	partnercountryid,partnernetworkid,tripstatus,sum(datathroughputscore4g)
FROM
    trip_metrics_closed where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599
)group by partnercountryid,partnernetworkid,tripstatus;

--------******* VOICE PDD SCORE 3G ------------****************

select partnercountryid,partnernetworkid,tripstatus,sum(totalpddunderthreshold3g/totalsuccesfulcalls3g) as pddratio3g
(
select partnercountryid,partnernetworkid,tripstatus,mtcallpddunderthreshold3g+mocallpddunderthreshold3g as totalpddunderthreshold3g,
mocallsuccess3g+mtcallsuccess3g as totalsuccesfulcalls3g
from trip_metrics_closed
where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599 and mocallpddbucketid3g<>0 and mtcallpddbucketid3g<>0
)group by partnercountryid,partnernetworkid,tripstatus;

--------******* VOICE PDD SCORE VOLTE  ------------****************

select partnercountryid,partnernetworkid,tripstatus,sum(totalpddunderthresholdvolte/totalsuccesfulcallsvolte) as pddratiovolte
(
select partnercountryid,partnernetworkid,tripstatus,mtcallpddunderthresholdvolte+mocallpddunderthresholdvolte as totalpddunderthresholdvolte,
mocallsuccessvolte+mtcallsuccessvolte as totalsuccesfulcallsvolte
from trip_metrics_closed
where  partnercountryid = 351 AND roamertype = 2 and bintime>=1737676800 and bintime<=1738281599 and mocallpddbucketidvolte<>0 and mtcallpddbucketidvolte<>0
)group by partnercountryid,partnernetworkid,tripstatus;

--------*** VOICE PDD OVERALL SCORE ******-------------

