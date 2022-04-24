using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using VizsgaremekAPI.BurgerAdatbazisEFCore;
using System.Linq;

namespace VizsgaremekAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class FoglalasokController : ControllerBase
    {
        burgeretteremContext _context = new();

        // GET: /<Foglalasok>
        [HttpGet]
        public IActionResult Get([FromHeader]string auth, [FromQuery] int? felh)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                if (felh is not null)
                {
                    List<Foglala> felhasznaloFoglalasai = _context.Foglalas.Where(x => x.Azon == felh).ToList();
                    return StatusCode(200, felhasznaloFoglalasai);
                }
                else
                {
                    List<Foglala> foglalasok = _context.Foglalas.ToList();
                    foglalasok.ForEach(x => x.FelhasznaloNev = _context.Felhasznalos.First(f => f.Azon == x.Azon).Nev);

                    return StatusCode(200,foglalasok);
                }
            }

            return StatusCode(403);
        }

        // GET: /<Foglalasok>/Aktiv
        [HttpGet("Aktiv")]
        public IActionResult GetAktiv([FromHeader] string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Foglala> maiFoglalasok = _context.Foglalas.Where(x => x.Foglalasido.Date == System.DateTime.Today.Date && x.Megjelent == false).ToList();
                maiFoglalasok.ForEach(x => x.FelhasznaloNev = _context.Felhasznalos.First(f => f.Azon == x.Azon).Nev);

                return StatusCode(200, maiFoglalasok);
            }

            return StatusCode(403);
        }

        // POST /<Foglalasok>
        [HttpPost]
        public IActionResult Post([FromHeader]string auth, Foglala f)
        {
            if(auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                _context.Foglalas.Add(f);
                if (_context.SaveChanges() > 0)
                    return StatusCode(201,f);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
        
        [HttpDelete("{id}")]
        public StatusCodeResult Delete([FromHeader] string auth, int id)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                Foglala aktf = _context.Foglalas.Find(id);
                if (aktf is not null)
                {
                    _context.Foglalas.Remove(aktf);
                    if (_context.SaveChanges() > 0)
                        return StatusCode(200);
                    else
                        return StatusCode(500);
                }
                else
                    return StatusCode(404);
                

            }

            return StatusCode(403);
        }
    }
}
