using Microsoft.AspNetCore.Mvc;
using OnePageRules_WebAPI.Models;
using OnePageRules_WebAPI.Repositories.Interfaces;
using System.Reflection.Emit;

namespace OnePageRules_WebAPI.Controllers
{
    [ApiController]
    [Route("opr/v{version:apiVersion}/[controller]")]
    [ApiVersion("1.0")]
    public class GamesController : Controller
    {
        public GamesController(IGameRepository repository)
        {
            Repository = repository;
        }

        public IGameRepository Repository { get; }

        [HttpGet]
        public IActionResult Get(int? id = null, string? acronym = null)
        {
            if (id.HasValue)
            {
                var result = Repository.Get(id.Value);

                return !Game.IsEmpty(result) ? Ok(result) : NotFound();
            }
            
            if (!string.IsNullOrEmpty(acronym))
            {
                var result = Repository.Get(acronym);

                return !Game.IsEmpty(result) ? Ok(result) : NotFound();
            }

            {
                var result = Repository.Get();

                return result.Any() ? Ok(result) : NotFound();
            }
        }
    }
}
