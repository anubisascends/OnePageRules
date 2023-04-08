using Microsoft.AspNetCore.Mvc;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;

namespace OnePageRules_WebAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class OprController : Controller
    {
        public OprController(IRepository repository)
        {
            Repository = repository;
        }

        private IRepository Repository { get; }

        [HttpGet]
        [Route("games")]
        public IActionResult GetGames()
        {
            var result = Repository.GetGames();

            if (result.Any())
            {
                return Ok(result);
            }

            return NotFound();
        }

        [HttpGet]
        [Route("factions")]
        public IActionResult GetFactions(int? gameId)
        {
            IEnumerable<Faction>? result = null;

            if (gameId.HasValue)
            {
                result = Repository.GetFactions(gameId.Value);
            }
            else
            {
                result = Repository.GetFactions();
            }

            if(result?.Any() ?? false) 
            {
                return Ok(result);
            }

            return NotFound();
        }

        [HttpGet]
        [Route("equipment")]
        public IActionResult GetEquipment()
        {
            var result = Repository.GetEquipment();

            if (result.Any())
            {
                return Ok(result);
            }

            return NotFound();
        }


    }
}
