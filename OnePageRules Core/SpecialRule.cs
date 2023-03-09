using CommunityToolkit.Mvvm.ComponentModel;

namespace OnePageRules.Core
{
    [ObservableObject]
    public partial class SpecialRule
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        private int amount;
    }
}
