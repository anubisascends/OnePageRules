namespace OnePageRules_WebAPI.Models
{
    public record struct Game(int Id, string? Label, string? ShortLabel) 
    {
        static Game()
        {
            Empty = new Game(int.MinValue, null, null);
        }

        public static readonly Game Empty;

        public static bool IsEmpty(Game game) => Empty.GetHashCode() == game.GetHashCode();

        public override int GetHashCode()
        {
            unchecked
            {
                var hash = 7;

                hash = hash * 23 + Id;
                hash = hash * 23 + (string.IsNullOrEmpty(Label) ? string.Empty.GetHashCode() : Label.GetHashCode());
                hash = hash * 23 + (string.IsNullOrEmpty(ShortLabel) ? string.Empty.GetHashCode() : ShortLabel.GetHashCode());

                return hash;
            }
        }
    }
}
