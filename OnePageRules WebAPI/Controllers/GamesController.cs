using Microsoft.AspNetCore.Mvc;
using OnePageRules_WebAPI.Repositories.Interfaces;

namespace OnePageRules_WebAPI.Controllers
{
    [ApiController]
    [Route("opr/[controller]")]
    public class GamesController : Controller
    {
        public GamesController(IGameRepository repository)
        {
            Repository = repository;
        }

        public IGameRepository Repository { get; }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult Get()
        {
            var result = Repository.Get();

            return result.Any() ? Ok(result) : BadRequest();
        }

        [HttpGet]
        [Route("id/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Get(int id)
        {
            var result = Repository.Get(id);

            return result != null ? Ok(result) : NotFound();
        }

        [HttpGet]
        [Route("acronym/{acronym}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Get(string acronym)
        {
            var result = Repository.Get(acronym);

            return result != null ? Ok(result) : NotFound();
        }

        [HttpPost]
        [Route("post/{label}/{acronym}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public IActionResult Post(string label, string acronym)
        {
            var result = Repository.Update(label, acronym);

            return result.Item1 switch
            {
                -2 => BadRequest(),
                -1 => BadRequest("You attempted to update a system game, this is not a valid operation"),
                0 => Ok(result.Item2),
                _ => Created($"/games/{result.Item2}", result.Item2)
            };
        }

        [HttpDelete]
        [Route("delete/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Delete(int id)
        {
            var result = Repository.Delete(id);

            return result switch
            {
                -1 => BadRequest("You attempted to delete a system game, this is not a valid operation"),
                > 0 => Ok(),
                _ => NotFound()
            };
        }
    }
}
