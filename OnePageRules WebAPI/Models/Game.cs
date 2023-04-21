namespace OnePageRules_WebAPI.Models
{
    public record struct Game(int Id, string? Label, string? ShortLabel) 
    {
        static Game()
        {
            Empty = new Game(int.MinValue, null, null);
        }

        public static readonly Game Empty;

        public static bool IsEmpty(Game game) => game.Id == int.MinValue &&
            string.IsNullOrEmpty(game.Label) &&
            string.IsNullOrEmpty(game.ShortLabel);
    }
}
