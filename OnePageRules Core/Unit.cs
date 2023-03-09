using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;

namespace OnePageRules.Core
{
    [ObservableObject]
    public partial class Unit
    {
        [ObservableProperty]
        private string? name;

        [ObservableProperty]
        private int quantity;

        [ObservableProperty]
        private ObservableCollection<SpecialRule> specialRules = new();

        [ObservableProperty]
        private int baseCost;

        [ObservableProperty]
        private int quality;

        [ObservableProperty]
        private int defense;

        [ObservableProperty]
        private EquipmentCollection defaultEquipment = new();

        [ObservableProperty]
        private ObservableCollection<Model> models = new();

        public int Cost => getCost();

        public void Reset() 
        {
            foreach (var item in models)
            {
                item.ResetEquipment(defaultEquipment);
            }
        }

        private int getCost() => baseCost + models.Sum(x => x.Equipment.Sum(y => y.Cost));
    }
}
