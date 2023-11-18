SELECT F.user_id , COUNT(*) AS fiend_count
FROM USER AS U
    JOIN IS_FRIEND_OF AS IFO ON U.user_id = IFO.user1_ID OR U.user_id = IFO.user2_ID
    JOIN USER AS F ON F.user_id != U.user_id and (F.user_id = IFO.user1_ID OR F.user_id = IFO.user2_ID)
    GROUP BY U.user_id
    Order By (Count*) DESC