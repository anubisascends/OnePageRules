namespace OnePageRules_WebAPI.Models
{
    public record struct Faction(int Id, int GameId, string? Label, int ParentId)
    {
        static Faction()
        {
            Empty = new Faction(int.MinValue, int.MinValue, null, int.MinValue);
        }

        public static readonly Faction Empty;

        public static bool IsEmpty(Faction faction) => faction.Id == int.MinValue &&
            faction.GameId == int.MinValue &&
            faction.ParentId == int.MinValue &&
            string.IsNullOrEmpty(faction.Label);
    }
}
