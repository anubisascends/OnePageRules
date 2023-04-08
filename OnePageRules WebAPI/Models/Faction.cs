namespace OnePageRules_WebAPI.Models
{
    public class Faction
    {
        public int Id { get; set; }
        public int GameId { get; set; }
        public string? Label { get; set; }
        public int ParentId { get; set; }
    }
}
