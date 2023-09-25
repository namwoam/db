SELECT S.Ssn,
    COUNT(*) as Manage_count
FROM Employee E
    JOIN Employee S ON E.Super_ssn = S.Ssn
GROUP BY E.Super_ssn