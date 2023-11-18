SELECT F.name
FROM USER AS U
    JOIN IS_FRIEND_OF AS IFO ON U.user_id = IFO.user1_ID OR U.user_id = IFO.user2_ID
    JOIN USER AS F ON F.user_id != U.user_id and (F.user_id = IFO.user1_ID OR F.user_id = IFO.user2_ID)
    WHERE U.user_id = "B10611008" 