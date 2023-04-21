using OnePageRules_WebAPI.Classes;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;
using System.Data;
using System.Data.SqlClient;

namespace OnePageRules_WebAPI.Repositories
{
    internal class FactionSqlRepository : SqlRepository, IFactionRepository
    {
        public FactionSqlRepository(IConfiguration configuration) : base(configuration)
        {

        }

        public IEnumerable<Faction> GetAll()
        {
            var sql = "select * from ref.factions";
            var data = ExecuteQuery(sql);

            if (data.HasRows())
            {
                var result = new List<Faction>();

                foreach (DataRow row in data.Rows)
                {
                    result.Add(createFactionFromRow(row));
                }

                return result.ToArray();
            }

            return Array.Empty<Faction>();
        }

        public IEnumerable<Faction> GetByGame(int gameId)
        {
            var sql = "select * from ref.factions where gameId = @gameId";
            var parameters = new SqlParameter[] { new SqlParameter("@gameId", gameId) };
            var data = ExecuteQuery(sql, parameters);

            if (data.HasRows())
            {
                var result = new List<Faction>();

                foreach (DataRow row in data.Rows)
                {
                    result.Add(createFactionFromRow(row));
                }

                return result.ToArray();
            }

            return Array.Empty<Faction>();
        }

        public Faction GetByID(int id)
        {
            var sql = "SELECT * FROM ref.Factions WHERE Id=@Id";
            var parameters = new SqlParameter[] { new SqlParameter("@Id", id) };

            var result = ExecuteQuery(sql, parameters);

            return result.HasRows() ? 
                createFactionFromRow(result.FirstRow()) : 
                Faction.Empty;
        }
       
        private Faction createFactionFromRow(DataRow row) =>
            new Faction
            (
                row.GetValue("Id", 0),
                row.GetValue("GameId", 0),
                row.GetValue("Label", string.Empty),
                row.GetValue("ParentId", 0)
            );
    }
}
