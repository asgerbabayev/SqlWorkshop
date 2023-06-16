

using Microsoft.SqlServer.Server;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public class JsonConverter
{
    [SqlFunction(DataAccess = DataAccessKind.Read,SystemDataAccess =SystemDataAccessKind.Read)]
    public static SqlString JsonGenerator(SqlString connectionString,SqlString tableName)
    {
        using (SqlConnection connection= new SqlConnection(connectionString.Value))
        {
            connection.Open();
            using (SqlCommand command=new SqlCommand($"SELECT * FROM {tableName}",connection))
            {
                using (SqlDataReader reader=command.ExecuteReader())
                {
                    DataTable dataTable= new DataTable();
                    dataTable.Load(reader);
                    string json=JsonConvert.SerializeObject(dataTable,Formatting.Indented);
                    return new SqlString(json);
                }
            }
        }
    }
}
