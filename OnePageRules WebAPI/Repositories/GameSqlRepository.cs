﻿using OnePageRules_WebAPI.Classes;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;
using System.Data;
using System.Data.SqlClient;

namespace OnePageRules_WebAPI.Repositories
{
    public class GameSqlRepository : SqlRepository, IGameRepository
    {
        public GameSqlRepository(IConfiguration configuration) : base(configuration) { };

        public int Delete(int id)
        {
            var sql = Properties.Resources.Games_Delete;
            var parameters = new SqlParameter[] { new SqlParameter("@Id", id) };

            return ExecuteNonQuery(sql, parameters);
        }

        public IEnumerable<Game> Get()
        {
            var sql = "SELECT * FROM ref.Games";
            var data = ExecuteQuery(sql);

            if (data.HasRows())
            {
                var result = new List<Game>();

                foreach (DataRow row in data.Rows)
                {
                    result.Add(new Game 
                    {
                        Id = row.GetValue("Id", -1),
                        Label = row.GetValue("Label", string.Empty),
                        ShortLabel = row.GetValue("Short", string.Empty)
                    });
                }

                return result.ToArray();
            }

            return Array.Empty<Game>();
        }

        public Game Get(int id)
        {
            var sql = "SELECT * FROM ref.Games where Id = @Id";
            var parameters = new SqlParameter[] 
            { 
                new SqlParameter("@Id", id)
            };
            var data = ExecuteQuery(sql, parameters);

            if(data.HasRows())
            {
                var row = data.FirstRow();

                return new Game 
                {
                    Id = row.GetValue("Id", -1),
                    Label = row.GetValue("Label", string.Empty),
                    ShortLabel = row.GetValue("Short", string.Empty)
                };
            }

            return null;
        }

        public Game Get(string acronym)
        {
            var sql = "SELECT * FROM ref.Games where Short = @Short";
            var parameters = new SqlParameter[]
            {
                new SqlParameter("@Short", acronym)
            };
            var data = ExecuteQuery(sql, parameters);

            if (data.HasRows())
            {
                var row = data.FirstRow();

                return new Game
                {
                    Id = row.GetValue("Id", -1),
                    Label = row.GetValue("Label", string.Empty),
                    ShortLabel = row.GetValue("Short", string.Empty)
                };
            }

            return null;
        }

        public (int, int) Update(string label, string acronym)
        {
            var sql = Properties.Resources.Games_Update;
            var parameters = new SqlParameter[]
            {
                new SqlParameter("@Label", label),
                new SqlParameter("@Short", acronym)
            };

            var result = ExecuteQuery(sql, parameters);

            if (result.HasRows())
            {
                var row = result.FirstRow();

                return ((int)row[0], Convert.ToInt32(row[1]));
            }

            return (-2, 0);
        }
    }
}