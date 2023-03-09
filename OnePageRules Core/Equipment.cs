using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.ObjectModel;
using System.Reflection;
using System.Text;

namespace OnePageRules.Core
{
    public partial class Equipment : ObservableObject
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        public byte range;

        [ObservableProperty]
        private byte attacks;

        [ObservableProperty]
        private ObservableCollection<SpecialRule> specialRules = new();

        [ObservableProperty]
        private ushort cost;

        public Equipment Copy()
        {
            var result = new Equipment();

            foreach (var property in GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance))
            {
                if(property.GetMethod != null)
                {
                    if(property.SetMethod != null)
                    {
                        property.SetValue(result, property.GetValue(this));
                    }
                }
            }

            return result;
        }

        public override string ToString()
        {
            var builder = new StringBuilder(Name);

            builder.Append(" (");

            if(Range > 0)
            {
                builder.Append(Range);
                builder.Append("\"");
            }

            if(Attacks > 0)
            {
                if (builder[builder.Length - 1] != '(')
                {
                    builder.Append(", ");
                }

                builder.Append("A");
                builder.Append(Attacks);
            }

            var temp = new StringBuilder();

            foreach (var item in SpecialRules)
            {
                if(temp.Length > 0)
                {
                    temp.Append(", ");
                }

                temp.Append(item);
            }

            builder.Append(temp.ToString());
            builder.Append(")");

            return builder.ToString();
        }
    }
}
