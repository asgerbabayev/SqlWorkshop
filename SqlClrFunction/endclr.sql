
 EXEC sp_configure 'show advanced options' , 1;
RECONFIGURE;

EXEC sp_configure 'clr enable' ,1;
RECONFIGURE;


EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;


ALTER DATABASE World SET TRUSTWORTHY ON;




CREATE ASSEMBLY [System.Runtime.Serialization]
FROM 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Runtime.Serialization.dll'
WITH PERMISSION_SET = UNSAFE;

CREATE ASSEMBLY WorldClr
FROM 'C:\Users\acer\Desktop\SqlFunctionDemo\SqlFunctionDemo\bin\Debug\SqlFunctionDemo.dll' 
WITH PERMISSION_SET =UNSAFE;


CREATE FUNCTION JsonGenerator
(
    @connectionString NVARCHAR(255),
    @tableName NVARCHAR(255)
)
RETURNS NVARCHAR(MAX)
AS  EXTERNAL NAME [WorldClr].[JsonConverter].[JsonGenerator]

select dbo.JsonGenerator('server=localhost;database=World;Trusted_Connection=true','People') as JsonData


/*
[    {      "Id": 1,      "Name": "Tural",      "Surname": "Aydinli",      "AdressId": 5    },    {      "Id": 2,      "Name": "Məhəmməd ",      "Surname": "Mustafayev",      "AdressId": 2    },    {      "Id": 3,      "Name": "Elsever",      "Surname": "Xanaliyev",      "AdressId": 3    },    {      "Id": 4,      "Name": "Azad",      "Surname": "Babayev",      "AdressId": 4    },    {      "Id": 5,      "Name": "Aydin",      "Surname": "Ceferli",      "AdressId": 1    }  ]
*/