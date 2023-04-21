namespace OnePageRules_WebAPI.Models
{
    public record struct Faction(int Id, int GameId, string? Label, int ParentId)
    {
        static Faction()
        {
            Empty = new Faction(0, 0, null, 0);
        }

        public static readonly Faction Empty;

        public static bool IsEmpty(Faction faction) => Empty.GetHashCode() == faction.GetHashCode();

        public override int GetHashCode() 
        {
            unchecked
            {
                var hash = 5;

                hash = hash * 23 + Id.GetHashCode();
                hash = hash * 23 + GameId.GetHashCode();
                hash = hash * 23 + ParentId.GetHashCode();
                hash = hash * 23 + (string.IsNullOrEmpty(Label) ? string.Empty.GetHashCode() : Label.GetHashCode());

                return hash; 
            }
        }
    }
}
