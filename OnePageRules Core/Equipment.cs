using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.ObjectModel;
using System.Reflection;
using System.Text;

namespace OnePageRules.Core
{
    [ObservableObject]
    public partial class Equipment
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        public byte range;

        [ObservableProperty]
        private byte attacks;

        [ObservableProperty]
        private byte armorPiercing;

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
            var builder = new StringBuilder(name);

            builder.Append(" (");

            if(range > 0)
            {
                builder.Append(range);
                builder.Append("\"");
            }

            if(attacks > 0)
            {
                if (builder[builder.Length - 1] != '(')
                {
                    builder.Append(", ");
                }

                builder.Append("A");
                builder.Append(attacks);
            }

            if(armorPiercing > 0)
            {
                if (builder[builder.Length - 1] != '(')
                {
                    builder.Append(", ");
                }

                builder.Append("AP(");
                builder.Append(armorPiercing);
                builder.Append(")");
            }

            builder.Append(")");

            return builder.ToString();
        }
    }
}
