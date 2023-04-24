using OnePageRules_WebAPI.Models;

namespace OnePageRules_WebAPI.Repositories.Interfaces
{
    public interface IEquipmentRepository
    {
        IEnumerable<Equipment> GetAllNames();
        string GetName(int id);
    }
}
