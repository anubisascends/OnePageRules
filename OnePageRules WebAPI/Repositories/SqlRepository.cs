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

        public IEnumerable<Equipment> GetEquipment()
        {
            using var connection = createConnection();
            using var command = connection.CreateCommand();

            command.CommandText = "SELECT * FROM dbo.Equipment ORDER BY [Label]";
            connection.Open();

            var reader = command.ExecuteReader();
            var result = new List<Equipment>();

            while (reader.Read())
            {
                result.Add(new Equipment
                {
                    Id = (int)reader["Id"],
                    Label = (string)reader["Label"],
                });
            }

            return result.ToArray();
        }

        public IEnumerable<EquipmentProfile> GetEquipmentProfiles(int factionId)
        {
            using var connection = createConnection();
            using var command = connection.CreateCommand();

            command.CommandText = "SELECT EP.*, E.Label FROM dbo.EquipmentProfiles EP INNER JOIN dbo.Equipment E ON E.Id = EP.EquipmentId WHERE FactionID=@FactionID";
            command.Parameters.AddWithValue("@FactionID", factionId);
            connection.Open();
            
            var reader = command.ExecuteReader();
            var result = new List<EquipmentProfile>();

            while (reader.Read())
            {
                result.Add(new EquipmentProfile 
                {
                    Id = (int)reader["Id"],
                    FactionId = factionId,
                    Label = (string)reader["Label"],
                    Attacks = (byte)reader["Attacks"],
                    Range = (string)reader["Range"]
                });
            }

            populateSpecialRules(result);

            return result.ToArray();
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
        private void populateSpecialRules(IEnumerable<EquipmentProfile> equipmentProfiles)
        {
            using var connection = createConnection();
            using var command = connection.CreateCommand();

            command.CommandText = "SELECT SR.*, ESR.Value FROM SpecialRules SR INNER JOIN EquipmentProfileSpecialRules ESR ON SR.Id = ESR.SpecialRuleId WHERE ESR.ProfileId=@ProfileId";
            command.Parameters.AddWithValue("@ProfileId", 0);

            connection.Open();

            foreach (var item in equipmentProfiles)
            {
                command.Parameters[0].Value = item.Id;

                using var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    item.SpecialRules.Add(new SpecialRule
                    {
                        Id = reader.GetInt32(0),
                        Label = reader.GetString(1),
                        Description = reader.GetString(2),
                        HasValue = reader.GetBoolean(3),
                        Value = reader.GetInt32(4)
                    });
                }
            }
        }
    }
}
