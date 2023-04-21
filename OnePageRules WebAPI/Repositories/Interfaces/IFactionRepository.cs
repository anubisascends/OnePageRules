using OnePageRules_WebAPI.Models;

namespace OnePageRules_WebAPI.Repositories.Interfaces
{
    public interface IFactionRepository
    {
        IEnumerable<Faction> GetAll();
        IEnumerable<Faction> GetByGame(int gameId);
        Faction GetByID(int id);
    }
}
