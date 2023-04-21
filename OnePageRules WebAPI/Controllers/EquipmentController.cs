using Microsoft.AspNetCore.Mvc;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;

namespace OnePageRules_WebAPI.Controllers
{
    [ApiController]
    [Route("opr/v{version:apiVersion}/[controller]")]
    public class EquipmentController : Controller
    {
        public EquipmentController(IEquipmentRepository repository)
        {
            Repository = repository;
        }

        public IEquipmentRepository Repository { get; }

        [HttpGet]
        public IActionResult Get(int? id)
        {
            if (id.HasValue)
            {
                var result = Repository.Get(id.Value);

                return !Equipment.IsEmpty(result) ? Ok(result) : NotFound();
            }

            {
                var result = Repository.GetAll();

                return result.Any() ? Ok(result) : NoContent();
            }
        }
    }
}
