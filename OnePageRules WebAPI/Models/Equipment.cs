namespace OnePageRules_WebAPI.Models
{
    public class Equipment
    {
        public int Id { get; set; }
        public string? Label { get; set; }
    }

    public class EquipmentProfile
    {
        public int Id { get; set; }
        public int FactionId { get; set; }
        public int EquipmentId { get; set; }
        public byte Attacks { get; set; }
        public string? Range { get; set; }
    }
}
