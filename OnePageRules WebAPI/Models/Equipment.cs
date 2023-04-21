namespace OnePageRules_WebAPI.Models
{
    public record struct Equipment(int Id, string Label)
    {
        static Equipment()
        {
            Empty = new Equipment(0, string.Empty);
        }

        public static readonly Equipment Empty;

        public static bool IsEmpty(Equipment equipment) => equipment.GetHashCode() == 0;

        public override int GetHashCode() 
        {
            unchecked
            {
                var hash = 3;

                hash = hash * 23 + Id;
                hash = hash * 23 + (string.IsNullOrEmpty(Label) ? string.Empty.GetHashCode() : Label.GetHashCode());

                return hash;
            }
        }
    }
}
