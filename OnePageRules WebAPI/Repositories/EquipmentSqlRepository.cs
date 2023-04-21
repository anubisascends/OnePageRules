using OnePageRules_WebAPI.Classes;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;
using System.Data;
using System.Data.SqlClient;

namespace OnePageRules_WebAPI.Repositories
{
    public class EquipmentSqlRepository : SqlRepository, IEquipmentRepository
    {
        public EquipmentSqlRepository(IConfiguration configuration) : base(configuration)
        {

        }

        public Equipment Get(int id)
        {
            var sql = "SELECT * FROM ref.Equipment WHERE Id = @Id";
            var parameters = new SqlParameter[] { new SqlParameter ("@Id", id) };
            var data = ExecuteQuery(sql, parameters);

            return data.HasRows() ? createFromRow(data.FirstRow()) : Equipment.Empty;
        }

        public IEnumerable<Equipment> GetAll()
        {
            var sql = "SELECT * FROM ref.Equipment";
            var data = ExecuteQuery(sql);

            if (data.HasRows())
            {
                var result = new List<Equipment>();

                foreach (DataRow row in data.Rows)
                {
                    result.Add(createFromRow(row));
                }

                return result.ToArray();
            }

            return Array.Empty<Equipment>();
        }

        private Equipment createFromRow(DataRow row) => new Equipment(row.GetValue("Id", -1), row.GetValue("Label", string.Empty));
    }
}
