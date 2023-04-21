using OnePageRules_WebAPI.Models;

namespace OnePageRules_WebAPI.Repositories.Interfaces
{
    public interface IGameRepository
    {
        IEnumerable<Game> Get();
        Game Get(int id);
        Game Get(string acronym);
    }
}
