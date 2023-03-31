using OnePageRules_WebAPI.Models;

namespace OnePageRules_WebAPI.Repositories.Interfaces
{
    public interface IRepository
    {
        IEnumerable<Game> GetGames();
        IEnumerable<Faction> GetFactions();
        IEnumerable<Faction> GetFactions(int gameId);
        IEnumerable<EquipmentProfile> GetEquipmentProfiles(int factionId);
        IEnumerable<Equipment> GetEquipment();
    }
}
