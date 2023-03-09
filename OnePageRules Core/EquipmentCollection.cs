using System.Collections.ObjectModel;
using System.Text;

namespace OnePageRules.Core
{
    public class EquipmentCollection : ObservableCollection<Equipment>
    {
        public override string ToString()
        {
            var builder = new StringBuilder();

            foreach (var item in this)
            {
                if (builder.Length > 0)
                {
                    builder.Append(", ");
                }

                builder.Append(item.ToString());
            }

            return builder.ToString();
        }
    }
}
