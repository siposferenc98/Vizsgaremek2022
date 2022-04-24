using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using VizsgaremekAPI.BurgerAdatbazisEFCore;
using System.Linq;

namespace VizsgaremekAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class RendelesekController : ControllerBase
    {
        burgeretteremContext _context = new();

        // GET: /<Rendelesek>
        [HttpGet]
        public IActionResult Get([FromHeader]string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Rendele> DBContextrendelesek = new(_context.Rendeles);
                DBContextrendelesek.ForEach(r => r.Tetels = _context.Tetels.Where(t => t.Razon == r.Razon).ToList());
                DBContextrendelesek.ForEach(r => r.Tetels.ForEach(t =>
                {
                    t.BazonNavigation = _context.Burgers.First(x=>x.Bazon == t.Bazon);
                    t.DazonNavigation = _context.Desszerts.First(x=>x.Dazon == t.Dazon);
                    t.IazonNavigation = _context.Itals.First(x=>x.Iazon == t.Iazon);
                    t.KazonNavigation= _context.Korets.First(x=>x.Kazon == t.Kazon);

                }));

                return StatusCode(200,DBContextrendelesek);
            }

            return StatusCode(403);
        }

        // GET: /<Rendelesek>/Aktiv>
        [HttpGet("Aktiv")]
        public IActionResult GetAktiv([FromHeader] string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Rendele> DBContextrendelesek = new(_context.Rendeles.Where(x=>x.Italstatus < 4 && x.Etelstatus < 4));
                DBContextrendelesek.ForEach(r => r.Tetels = _context.Tetels.Where(t => t.Razon == r.Razon).ToList());
                DBContextrendelesek.ForEach(r => r.Tetels.ForEach(t =>
                {
                    t.BazonNavigation = _context.Burgers.First(x => x.Bazon == t.Bazon);
                    t.DazonNavigation = _context.Desszerts.First(x => x.Dazon == t.Dazon);
                    t.IazonNavigation = _context.Itals.First(x => x.Iazon == t.Iazon);
                    t.KazonNavigation = _context.Korets.First(x => x.Kazon == t.Kazon);

                }));

                return StatusCode(200, DBContextrendelesek);
            }

            return StatusCode(403);
        }

        [HttpGet("Bevetel")]
        public IActionResult GetBevetel([FromHeader] string auth)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Rendele> DBContextrendelesek = new(_context.Rendeles.Where(x=>x.Etelstatus > 3 && x.Italstatus > 3));
                DBContextrendelesek.ForEach(r => r.Tetels = _context.Tetels.Where(t => t.Razon == r.Razon).ToList());
                DBContextrendelesek.ForEach(r => r.Tetels.ForEach(t =>
                {
                    t.BazonNavigation = _context.Burgers.First(x => x.Bazon == t.Bazon);
                    t.DazonNavigation = _context.Desszerts.First(x => x.Dazon == t.Dazon);
                    t.IazonNavigation = _context.Itals.First(x => x.Iazon == t.Iazon);
                    t.KazonNavigation = _context.Korets.First(x => x.Kazon == t.Kazon);

                }));
                List<int> bevetelek = new();
                bevetelek.Add((int)DBContextrendelesek.Where(x=>x.Ido.Date == System.DateTime.Today).Sum(x=>x.Vegosszeg));
                bevetelek.Add((int)DBContextrendelesek.Where(x=>x.Ido.Month == System.DateTime.Today.Month).Sum(x=>x.Vegosszeg));
                bevetelek.Add((int)DBContextrendelesek.Sum(x=>x.Vegosszeg));

                return StatusCode(200, bevetelek);
            }

            return StatusCode(403);
        }


        // POST /<Rendelesek>
        [HttpPost]
        public IActionResult Post([FromHeader]string auth, Rendele r)
        {
            if(auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                _context.Rendeles.Add(r);
                if (_context.SaveChanges() > 0)
                    return StatusCode(201,r);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
        // PUT /<Rendelesek>
        [HttpPut]
        public IActionResult Put([FromHeader]string auth, Rendele r)
        {
           if(auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                List<Tetel> rendeleshezTartozoTetelek = _context.Tetels.Where(x => x.Razon == r.Razon).ToList();
                rendeleshezTartozoTetelek.ForEach(x =>
                {
                    x.Italstatus = r.Italstatus;
                    x.Etelstatus = r.Etelstatus;
                });
                
                if (_context.SaveChanges() > 0)
                    return StatusCode(200);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete([FromHeader] string auth, int id)
        {
            if (auth == AktivTokenek.AdminToken || auth == AktivTokenek.UserToken)
            {
                Rendele aktr = _context.Rendeles.Find(id);
                _context.Rendeles.Remove(aktr);
                if (_context.SaveChanges() > 0)
                    return StatusCode(200);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
    }
}
