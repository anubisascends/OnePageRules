using CommunityToolkit.Mvvm.ComponentModel;

namespace OnePageRules.Core
{
    public partial class Upgrade : ObservableObject
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        private int cost;
    }
}
