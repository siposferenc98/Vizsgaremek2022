using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using VizsgaremekAPI.BurgerAdatbazisEFCore;
using System.Linq;

namespace VizsgaremekAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BurgerekController : ControllerBase
    {
        burgeretteremContext _context = new();

        // GET: /<Burgerek>
        [HttpGet]
        public List<Burger> Get()
        {
            return new(_context.Burgers);
        }
        // GET: /<Burgerek>/Aktiv
        [HttpGet("Aktiv")]
        public List<Burger> GetAktiv()
        {
            // == true szükséges mert az EF adatszerkezete nullable bool  
            return new(_context.Burgers.Where(x=>x.Aktiv == true));
        }

        // PUT /<Burgerek>
        [HttpPost]
        public StatusCodeResult Post([FromHeader]string auth, Burger b)
        {
            if(auth == AktivTokenek.AdminToken)
            {
                _context.Burgers.Add(b);
                if (_context.SaveChanges() > 0)
                    return StatusCode(201);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
        // PUT /<Burgerek>
        [HttpPut]
        public IActionResult Put([FromHeader]string auth, Burger b)
        {
           if(auth == AktivTokenek.AdminToken)
            {
                Burger aktb = _context.Burgers.Find(b.Bazon);
                _context.Entry(aktb).CurrentValues.SetValues(b);
                if (_context.SaveChanges() > 0)
                    return StatusCode(200);
                else
                    return StatusCode(500);
            }

            return StatusCode(403);
        }
    }
}
