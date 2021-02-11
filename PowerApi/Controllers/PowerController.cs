using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PowerApi.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PowerApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PowerController : ControllerBase
    {
        private readonly ILogger<PowerController> _logger;
        private List<Power> powers { get; set; }

        public PowerController(ILogger<PowerController> logger)
        {
            _logger = logger;

            //setup some initial powers
            powers = new List<Power>
            {
                new Power
                {
                    Id = 1,
                    Abilities = new List<Ability>
                    {
                        new Ability
                        {
                            Name = "POWER!!",
                            Type = TypeEnums.Physical,
                            Limits = "NONE"
                        }
                    },
                    Weaknesses = new List<Weakness>
                    {
                        new Weakness
                        {
                            Name = "Hunger",
                            Type = TypeEnums.Physical,
                            Activation = "Using too much Power"
                        }
                    }
                }
            };
        }

        [HttpGet]
        public async Task<IActionResult> GetPowers()
        {
            return (powers == null || powers.Count == 0)
                ? NoContent()
                : Ok(powers);
        }

        [HttpPost]
        public async Task<IActionResult> AddPower([FromBody] Power p)
        {
            p.Id = powers.Count + 1;
            powers.Add(p);
            return Ok();
        }
    }
}
