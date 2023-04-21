using OnePageRules_WebAPI.Models;

namespace OnePageRules_WebAPI.Repositories.Interfaces
{
    public interface IEquipmentRepository
    {
        IEnumerable<Equipment> GetAll();
        Equipment Get(int id);
    }
}
