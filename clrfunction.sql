 EXEC sp_configure 'show advanced options' , 1;
RECONFIGURE;

EXEC sp_configure 'clr enable' ,1;
RECONFIGURE;


EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;


ALTER DATABASE SqlWorkshopp SET TRUSTWORTHY ON;

"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Runtime.Serialization.dll"

CREATE ASSEMBLY [System.Runtime.Serialization]
FROM 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Runtime.Serialization.dll'
WITH PERMISSION_SET = UNSAFE;


CREATE ASSEMBLY WorldClr
FROM 'C:\Users\asger\OneDrive\Masaüstü\SqlClrFunction\SqlFunctionDemo\SqlFunctionDemo\bin\Debug\SqlFunctionDemo.dll' 
WITH PERMISSION_SET =UNSAFE;

CREATE FUNCTION JsonGenerator
(
    @connectionString NVARCHAR(255),
    @tableName NVARCHAR(255)
)
RETURNS NVARCHAR(MAX)
AS  EXTERNAL NAME [WorldClr].[JsonConverter].[JsonGenerator]

select dbo.JsonGenerator('server=localhost;database=SqlWorkshopp;Trusted_Connection=true','Emails')


EXEC sp_changedbowner 'sa'
GO

ALTER AUTHORIZATION ON DATABASE::SqlWorkshopp TO [sa]
GO
