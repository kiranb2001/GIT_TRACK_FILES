kiran_beesanakoppa_saadhana:WITH trip_metrics_closed_denominator AS (
    SELECT tripstatus, partnercountryid, partnernetworkid, overallbucketid, roamertype,
        overallbucketidexcludingsor, regbucketid, regsuccessratiobucketid, reglatencybucketid,
        regbucketidexcludingsor, regsuccessratiobucketidexcludingsor, reglatencybucketidexcludingsor,
        callbucketid3g, callccrbucketid3g, callnerbucketid3g, callpddbucketid3g, callbucketidvolte,
        callnerbucketidvolte, callccrbucketidvolte, callpddbucketidvolte, callnerbucketid, callccrbucketid,
        callpddbucketid, callbucketid, databucketid3g, datasuccessratiobucketid3g, datacutoffratiobucketid3g,
        datathroughputbucketid3g, databucketid4g, datasuccessratiobucketid4g, datacutoffratiobucketid4g,
        datathroughputbucketid4g, databucketid, datasuccessratiobucketid, datacutoffratiobucketid,
        datathroughputbucketid
    FROM trip_metrics_closed
    WHERE roamertype = 2 AND tripstatus IN (2, 3) AND partnercountryid = 351 and bintime>=1737676800 and bintime<=1738281599
)
SELECT partnercountryid, partnernetworkid, tripstatus,
    SUM(CASE WHEN roamertype = 2 AND overallbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overall_sordisabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND overallbucketidexcludingsor <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overall_sorenabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND regbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_registrationoverall_sordisabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND regbucketidexcludingsor <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_registrationsuccessratio_sorenabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND regsuccessratiobucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_registrationlatencyratio_sordisabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND regsuccessratiobucketidexcludingsor <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_registrationoverall_sorenabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND reglatencybucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_registrationsuccessratio_sordisabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND reglatencybucketidexcludingsor <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_registrationlatencyratio_sorenabled_denominator,
    SUM(CASE WHEN roamertype = 2 AND callbucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overallcall3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND callccrbucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callccr3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND callnerbucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callner3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND callpddbucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callpdd3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND callbucketidvolte <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overallcallvolte_denominator,
    SUM(CASE WHEN roamertype = 2 AND callccrbucketidvolte <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callccrvolte_denominator,
    SUM(CASE WHEN roamertype = 2 AND callnerbucketidvolte <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callnervolte_denominator,
    SUM(CASE WHEN roamertype = 2 AND callpddbucketidvolte <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callpddvolte_denominator,
    SUM(CASE WHEN roamertype = 2 AND callbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overallcall_denominator,
    SUM(CASE WHEN roamertype = 2 AND callccrbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callccr_denominator,
    SUM(CASE WHEN roamertype = 2 AND callnerbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callner_denominator,
    SUM(CASE WHEN roamertype = 2 AND callpddbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_callpdd_denominator,
    SUM(CASE WHEN roamertype = 2 AND databucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overalldata3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND datasuccessratiobucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datasuccessratio3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND datacutoffratiobucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datacutoffratio3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND datathroughputbucketid3g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datathroughput3g_denominator,
    SUM(CASE WHEN roamertype = 2 AND databucketid4g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overalldata4g_denominator,
    SUM(CASE WHEN roamertype = 2 AND datasuccessratiobucketid4g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datasuccessratio4g_denominator,
    SUM(CASE WHEN roamertype = 2 AND datacutoffratiobucketid4g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datacutoffratio4g_denominator,
    SUM(CASE WHEN roamertype = 2 AND datathroughputbucketid4g <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datathroughput4g_denominator,
    SUM(CASE WHEN roamertype = 2 AND databucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_overalldata_denominator,
    SUM(CASE WHEN roamertype = 2 AND datasuccessratiobucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datasuccessratio_denominator,
    SUM(CASE WHEN roamertype = 2 AND datacutoffratiobucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datacutoffratio_denominator,
    SUM(CASE WHEN roamertype = 2 AND datathroughputbucketid <> 0 THEN 1 ELSE 0 END) AS trip_metrics_closed_datathroughput_denominator
FROM trip_metrics_closed_denominator
GROUP BY partnercountryid, partnernetworkid, tripstatus;
