using Microsoft.AspNetCore.Mvc.Infrastructure;
using System.Data;
using System.Data.Common;
using System.Runtime.CompilerServices;

namespace OnePageRules_WebAPI.Classes
{
    public static class ExtensionMethods
    {
        public static T GetValue<T>(this DbDataReader reader, string columnName, T defaultValue)
        {
            var columns = reader.GetColumnSchema();

            if (columns.FirstOrDefault(x => x.ColumnName.Equals(columnName)) is DbColumn)
            {
                var result = reader[columnName];

                if (!DBNull.Value.Equals(result))
                {
                    return (T)result;
                }
            }

            return defaultValue;
        }

        public static T GetValue<T>(this DbDataReader reader, int index, T defaultValue)
        {
            var result = reader[index];

            if(!DBNull.Value.Equals(result))
            {
                return (T)result;
            }

            return defaultValue;
        }

        public static bool HasRows(this DataTable table) => table.Rows.Count > 0;

        public static DataRow FirstRow(this DataTable table) => table.Rows[0];

        public static DataRow LastRow(this DataTable table) => table.Rows[table.Rows.Count - 1];

        public static T GetValue<T>(this DataRow row, string columnName, T defaultValue)
        {
            if (row.Table.Columns.Contains(columnName))
            {
                var data = row[columnName];

                if (!DBNull.Value.Equals(data))
                {
                    return (T)data;
                }
            }

            return defaultValue;
        }

        public static T GetValue<T>(this DataRow row, int index, T defaultValue)
        {
            var data = row[index];

            return !DBNull.Value.Equals(data) ? (T)data : defaultValue;
        }
    }
}
