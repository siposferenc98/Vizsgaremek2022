using VizsgaremekAPI.BurgerAdatbazisEFCore;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace VizsgaremekAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class FelhasznalokController : ControllerBase
    {
        burgeretteremContext _context = new();

        // GET: api/<FelhasznalokController>
        [HttpGet]
        public IActionResult Get([FromHeader]string auth)
        {
            
            if (auth == AktivTokenek.AdminToken)
                return StatusCode(200, _context.Felhasznalos);

            return StatusCode(403);

        }

        // POST api/<FelhasznalokController>
        [HttpPost]
        public IActionResult Post(Felhasznalo bejelFelh)
        {
            Felhasznalo f = _context.Felhasznalos.FirstOrDefault(x => x.Email == bejelFelh.Email && x.Pw == bejelFelh.Pw);
            if(f is null)
                return StatusCode(404,"Hibás felhasználónév vagy jelszó!");

            Response.Headers.Add("auth", f.Jog switch {
                < 4 => AktivTokenek.UserToken, 
                4 => AktivTokenek.AdminToken,
                _ => null });
            return StatusCode(200,f);
        }

        // PUT api/<FelhasznalokController>
        [HttpPut]
        public IActionResult Put(Felhasznalo f)
        {
            Felhasznalo letezike = _context.Felhasznalos.FirstOrDefault(x => x.Email == f.Email);
            if(letezike is null && f.Jog < 4)
            {
                _context.Felhasznalos.Add(f);
                if (_context.SaveChanges() > 0)
                    return StatusCode(201);
            }
            else
            {
                return StatusCode(409, "A felhasználó már létezik!");
            }

            return StatusCode(500);
        }
        // PUT api/<FelhasznalokController>
        [HttpPut("Admin")]
        public IActionResult PutAdmin([FromHeader] string auth, Felhasznalo f)
        {
            if (auth == AktivTokenek.AdminToken)
            {
                Felhasznalo letezike = _context.Felhasznalos.FirstOrDefault(x => x.Email == f.Email);
                if (letezike is null)
                {
                    _context.Felhasznalos.Add(f);
                    if (_context.SaveChanges() > 0)
                        return StatusCode(201);
                }
                else
                {
                    return StatusCode(409, "A felhasználó már létezik!");
                }
            }

            return StatusCode(403);
        }
        // PUT api/<FelhasznalokController>/id
        [HttpPut("{id}")]
        public IActionResult FelhasznaloFrissitese(int id, Felhasznalo f)
        {
            Felhasznalo letezike = _context.Felhasznalos.Find(id);
            if (letezike is null)
            {
                return StatusCode(409, "A felhasználó nem található!");
                
            }
            else
            {
                _context.Entry(letezike).CurrentValues.SetValues(f);
                if (_context.SaveChanges() > 0)
                    return StatusCode(201);
            }

            return StatusCode(500);
        }

    }
}
