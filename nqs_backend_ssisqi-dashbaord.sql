WITH labeled_score_daily_data AS (
    SELECT
        tripstatus,
        partnercountryid,
        partnernetworkid,
        serviceid,
        eventtype,
        rat,
        ingredientid,
        SUM(scorenumerator) AS nqs_numerator_count,
        (sum(case when (trip_status is null or trip_status in (0, 2)) then scoredenominator else 0 end)) as nqs_denominator_count,
        wisdom_count_distinct_long(case when trip_status in (1,3) then imsi_list else null end) as roamercount
    FROM rcem_nqs_dly_latest
    WHERE roamertype = 2
      AND tripstatus IN (2, 3,0,1)
      AND partnernetworkid = 0
      AND partnercountryid = 351 and (trip_status is null or trip_status in (0, 2) or (trip_status in (1, 3) and service_id in (1, 6)))
    GROUP BY
        partnercountryid,
        partnernetworkid,
        serviceid,
        eventtype,
        rat,
        ingredientid
)
select
    partnercountryid ,
    partnernetworkid ,
    CASE
        WHEN serviceid = 0 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = -1 THEN 'overall'
        WHEN serviceid = 1 AND eventtype IN (-1) AND rat INgtp ush  (-1) AND ingredientid = -1 THEN 'registration'
        WHEN serviceid = 1 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 1 THEN 'regSuccessRatio'
        WHEN serviceid = 1 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 0 THEN 'regULDelay'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = -1 THEN 'voice'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 2 THEN 'voiceNER'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 2 THEN 'voiceNER3g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 2 THEN 'voiceNER4g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 4 THEN 'voiceCCR'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 4 THEN 'voiceCCR3g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 4 THEN 'voiceCCR4g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 3 THEN 'voicePDD'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 3 THEN 'voicePDD3g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 3 THEN 'voicePDD4g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = -1 THEN 'voice3g'
        WHEN serviceid = 3 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = -1 THEN 'voice4g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = -1 THEN 'data'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 7 THEN 'dataEstablishment'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 7 THEN 'dataEstablishment3g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 7 THEN 'dataEstablishment4g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 9 THEN 'dataThroughput'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 9 THEN 'dataThroughput3g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 9 THEN 'dataThroughput4g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 8 THEN 'dataRetention'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 8 THEN 'dataRetention3g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 8 THEN 'dataRetention4g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = -1 THEN 'data3g'
        WHEN serviceid = 4 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = -1 THEN 'data4g'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = -1 THEN 'sms'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 5 THEN 'SMSSuccessRatio'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (-1) AND ingredientid = 6 THEN 'SMSDeliveryTime'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = -1 THEN 'sms3g'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 5 THEN 'SMSSuccessRatio3g'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (1) AND ingredientid = 6 THEN 'SMSDeliveryTime3g'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = -1 THEN 'smsvolte'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 5 THEN 'SMSSuccessRatiovolte'
        WHEN serviceid = 2 AND eventtype IN (-1) AND rat IN (6) AND ingredientid = 6 THEN 'SMSDeliveryTimevolte'
        ELSE 'others'
    END AS service_label,
    nqs_numerator_count,
    nqs_denominator_count
FROM labeled_score_daily_data
where
ORDER BY service_label, nqs_numerator_count DESC, nqs_denominator_count DESC;
