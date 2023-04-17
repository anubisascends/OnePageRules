using System.Collections.ObjectModel;

namespace OnePageRules_WebAPI.Models
{
    public class EquipmentProfile
    {
        public int Id { get; set; }
        public int FactionId { get; set; }
        public string? Label { get; set; }
        public byte Attacks { get; set; }
        public string? Range { get; set; }
        public ObservableCollection<SpecialRule> SpecialRules { get; set; } = new();
    }
}
