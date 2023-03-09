using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;
using System.Data.SqlClient;

namespace OnePageRules_WebAPI.Repositories
{
    public class SqlRepository : IRepository
    {
        public SqlRepository(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        private IConfiguration Configuration { get; }

        public IEnumerable<EquipmentProfile> GetEquipmentProfiles(int factionId, int equipmentId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Faction> GetFactions()
        {
            using var connection = createConnection();
            using var command = connection.CreateCommand();

            command.CommandText = "SELECT * FROM Factions";
            connection.Open();

            var reader = command.ExecuteReader();
            var result = new List<Faction>();

            while (reader.Read())
            {
                var item = new Faction
                {
                    Id = (int)reader[0],
                    GameId = (int)reader[1],
                    Label = (string)reader[2],
                    ParentId = (int)reader[3]
                };

                result.Add(item);
            }

            return result.ToArray();
        }

        public IEnumerable<Faction> GetFactions(int gameId)
        {
            using var connection = createConnection();
            using var command = connection.CreateCommand();

            command.CommandText = "SELECT * FROM Factions WHERE GameId = @GameId";
            command.Parameters.AddWithValue("@GameId", gameId);

            connection.Open();

            var reader = command.ExecuteReader();
            var result = new List<Faction>();

            while (reader.Read())
            {
                var item = new Faction
                {
                    Id = (int)reader[0],
                    GameId = (int)reader[1],
                    Label = (string)reader[2],
                    ParentId = (int)reader[3]
                };

                result.Add(item);
            }

            return result.ToArray();
        }

        public IEnumerable<Game> GetGames()
        {
            using var connection = createConnection();
            using var command = connection.CreateCommand();

            command.CommandText = "SELECT * FROM Games";
            connection.Open();

            var reader = command.ExecuteReader();
            var result = new List<Game>();

            while (reader.Read())
            {
                var game = new Game
                {
                    Id = (int)reader[0],
                    Label = (string)reader[1],
                    ShortLabel= (string)reader[2]
                };

                result.Add(game);
            }

            return result.ToArray();
        }

        private SqlConnection createConnection()
        {
            var section = Configuration.GetSection("Database");
            var builder = new SqlConnectionStringBuilder();

            builder.IntegratedSecurity = bool.Parse(section["TrustedConnection"]);
            
            if(!builder.IntegratedSecurity)
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
