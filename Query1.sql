SELECT 
    T.Name AS [Teacher Name], 
    T.Surname AS [Teacher Surname], 
    G.Name AS [Group Name]
FROM Teachers AS T
CROSS JOIN Groups AS G;