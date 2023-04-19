using System.Data;
using System.Data.SqlClient;

namespace OnePageRules_WebAPI.Repositories
{
    public abstract class SqlRepository
    {
        public SqlRepository(IConfiguration configuration) =>
            (Configuration) = (configuration); 

        protected IConfiguration Configuration { get; }

        protected DataTable ExecuteQuery(string sql, IEnumerable<SqlParameter>? parameters = null)
        {
            using var connection = CreateConnection();
            using var command = connection.CreateCommand();

            command.CommandText = sql;

            if(parameters != null)
            {
                command.Parameters.AddRange(parameters.ToArray());
            }

            connection.Open();

            var result = new DataTable();
            var adapter = new SqlDataAdapter(command);

            adapter.Fill(result);

            return result;

        }

        protected int ExecuteNonQuery(string sql, IEnumerable<SqlParameter>? parameters = null)
        {
            using var connection = CreateConnection();
            using var command = connection.CreateCommand();

            command.CommandText = sql;

            if (parameters != null)
            {
                command.Parameters.AddRange(parameters.ToArray());
            }

            connection.Open();

            return command.ExecuteNonQuery();
        }

        protected object ExecuteScalar(string sql, IEnumerable<SqlParameter>? parameters = null)
        {
            using var connection = CreateConnection();
            using var command = connection.CreateCommand();

            command.CommandText = sql;

            if (parameters != null)
            {
                command.Parameters.AddRange(parameters.ToArray());
            }

            connection.Open();

            return command.ExecuteScalar();
        }

        protected SqlConnection CreateConnection()
        {
            var section = Configuration.GetSection("Database");
            var builder = new SqlConnectionStringBuilder();

            builder.IntegratedSecurity = bool.Parse(section["TrustedConnection"]);

            if (!builder.IntegratedSecurity)
            {
                builder.UserID = section["UserId"];
                builder.Password = section["Password"];
            }

            builder.DataSource = section["DataSource"];
            builder.TrustServerCertificate = bool.Parse(section["TrustCertificate"]);
            builder.InitialCatalog = section["InitialCatalog"];

            return new SqlConnection(builder.ConnectionString);
        }
    }
}
