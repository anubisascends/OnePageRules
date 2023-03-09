using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.Generic;

namespace OnePageRules.Core
{
    public partial class Model : ObservableObject
    {
        [ObservableProperty]
        private EquipmentCollection equipment = new();

        public void ResetEquipment(IEnumerable<Equipment> original)
        {
            equipment.Clear();

            foreach (var item in original)
            {
                equipment.Add(item.Copy());
            }
        }
    }
}
