﻿using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace VizsgaremekAPI.BurgerAdatbazisEFCore
{
    public partial class Koret
    {
        public Koret()
        {
            Tetels = new HashSet<Tetel>();
        }

        public int Kazon { get; set; }
        public string Knev { get; set; }
        public int Kar { get; set; }
        public string Kleir { get; set; }
        public bool? Aktiv { get; set; }
        [JsonIgnore]
        public virtual ICollection<Tetel> Tetels { get; set; }
    }
}
