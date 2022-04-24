using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using VizsgaremekAPI.BurgerAdatbazisEFCore;
using System.Linq;

namespace VizsgaremekAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TetelekController : ControllerBase
    {
        burgeretteremContext _context = new();

        // GET: /<Tetelek>
        [HttpGet]
        public IActionResult Get([FromHeader] string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
                return StatusCode(200, _context.Tetels);

            return StatusCode(403);
        }

        [HttpGet("Pultos")]
        public IActionResult GetPultos([FromHeader] string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Tetel> pultosTetelek = _context.Tetels.Where(x => x.Iazon > 1 && x.Italstatus < 2 && x.Etelstatus < 3).ToList();
                pultosTetelek.ForEach(x =>
                {
                    x.IazonNavigation = _context.Itals.First(i => x.Iazon == i.Iazon);
                });
                return StatusCode(200, pultosTetelek);
            }
            return StatusCode(403);
        }
        [HttpGet("Szakacs")]
        public IActionResult GetSzakacs([FromHeader] string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Tetel> szakacsTetelek = _context.Tetels.Where(x => (x.Bazon > 1 || x.Dazon > 1 || x.Kazon > 1) && x.Italstatus < 3 && x.Etelstatus < 2).ToList();
                szakacsTetelek.ForEach(x =>
                {
                    x.BazonNavigation = _context.Burgers.First(b => b.Bazon == x.Bazon);
                    x.DazonNavigation = _context.Desszerts.First(d => d.Dazon == x.Dazon);
                    x.KazonNavigation = _context.Korets.First(k => k.Kazon == x.Kazon);
                });
                return StatusCode(200, szakacsTetelek);
            }
            return StatusCode(403);
        }

        // POST /<Tetelek>
        [HttpPost]
        public StatusCodeResult Post([FromHeader] string auth, Tetel t)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                _context.Tetels.Add(t);
                if (_context.SaveChanges() > 0)
                    return StatusCode(201);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
        // PUT /<Tetelek>/Status
        [HttpPut("Status")]
        public IActionResult PutStatus([FromHeader] string auth, Tetel t, [FromQuery]bool szakacs = false)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                Tetel aktt = _context.Tetels.Find(t.Tazon);
                if (szakacs)
                    aktt.Etelstatus = t.Etelstatus;
                else
                    aktt.Italstatus = t.Italstatus;
                
                if (_context.SaveChanges() > 0)
                    return StatusCode(200);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
        // PUT /<Tetelek>
        [HttpPut]
        public IActionResult Put([FromHeader] string auth, Tetel t)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                Tetel aktt = _context.Tetels.Find(t.Tazon);
                if (aktt is not null)
                {
                    _context.Entry(aktt).CurrentValues.SetValues(t);
                }
                if (_context.SaveChanges() > 0)
                    return StatusCode(200);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
        // DELETE /<Tetelek>/{id}
        [HttpDelete("{id}")]
        public IActionResult Delete([FromHeader] string auth, int id)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                Tetel t = _context.Tetels.Find(id);
                _context.Tetels.Remove(t);
                if (_context.SaveChanges() > 0)
                    return StatusCode(200);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
    }
}
