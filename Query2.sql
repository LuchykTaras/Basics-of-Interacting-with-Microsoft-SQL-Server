SELECT 
    D.Name AS [Department Name], 
    G.Name AS [Group Name]
FROM Departments AS D
INNER JOIN Groups AS G ON D.Id = G.DepartmentId;