SELECT BR.Card_no,
    BR.Name,
    julianday(now()) - recent_loan,
    B.Title
FROM BORROWER AS BR
    LEFT JOIN BOOK_LOANS AS BL ON BR.Card_no = BL.Card_no
    LEFT JOIN (
        SELECT Card_no AS cn,
            MAX(julianday(Date_out)) AS recent_loan
        FROM BORROWER
            JOIN BOOK_LOANS ON BORROWER.Card_no = BOOK_LOANS.Card_no
        GROUP BY BORROWER.Card_no
    ) ON julianday(BL.Date_out) = recent_loan
    AND cn = BR.Card_no
    LEFT JOIN BOOK AS B ON B.Book_id = BL.Book_id