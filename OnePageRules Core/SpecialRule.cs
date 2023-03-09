using CommunityToolkit.Mvvm.ComponentModel;
using System.Text;

namespace OnePageRules.Core
{
    public partial class SpecialRule : ObservableObject
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        private int value = -1;

        public override string ToString()
        {
            var builder = new StringBuilder();

            builder.Append(Name);

            if(Value > -1)
            {
                builder.Append('(');
                builder.Append(Value);
                builder.Append(')');
            }

            return builder.ToString();
        }
    }
}
