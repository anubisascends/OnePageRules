using Microsoft.AspNetCore.Mvc;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;

namespace OnePageRules_WebAPI.Controllers
{
    [ApiController]
    [Route("opr/v{version:apiVersion}/[controller]")]
    [ApiVersion("1.0")]
    public class FactionsController : Controller
    {
        public FactionsController(IFactionRepository repository) =>
            Repository = repository;

        public IFactionRepository Repository { get; }

        [HttpGet]
        public IActionResult Get(int? id = null, int? gameId = null)
        {
            if(id.HasValue)
            {
                var result = Repository.GetByID(id.Value);

                return !Faction.IsEmpty(result) ? Ok(result) : NotFound();
            }

            if (gameId.HasValue)
            {
                var result = Repository.GetByGame(gameId.Value);

                return result.Any() ? Ok(result) : NotFound();
            }

            { 
                var result = Repository.GetAll();

                return result.Any() ? Ok(result) : BadRequest();
            }
        }
    }
}