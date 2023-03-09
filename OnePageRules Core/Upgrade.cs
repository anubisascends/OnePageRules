using CommunityToolkit.Mvvm.ComponentModel;

namespace OnePageRules.Core
{
    [ObservableObject]
    public partial class Upgrade
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        private int cost;
    }
}
