namespace OnePageRules_WebAPI.Models
{
    public class SpecialRule
    {
        public int Id { get; set; }
        public string? Label { get; set; }
        public string? Description { get; set; }
        public bool HasValue { get; set; }
    }
}
