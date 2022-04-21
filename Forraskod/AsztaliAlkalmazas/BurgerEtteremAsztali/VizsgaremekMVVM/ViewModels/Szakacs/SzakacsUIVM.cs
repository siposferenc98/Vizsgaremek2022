﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using VizsgaremekMVVM.Models;
using VizsgaremekMVVM.Models.BurgerEtterem;
using VizsgaremekMVVM.Models.Buttons;
using VizsgaremekMVVM.Models.Lists;

namespace VizsgaremekMVVM.ViewModels.Szakacs
{
    internal class SzakacsUIVM : INotifyPropertyChanged
    {
        private HttpClientClass _http = new();
        private Tetelek _tetelek = new();
        public BindingList<Tetel> Tetelek { get; set; } = new();
        public Tetel? KivalasztottTetel { get; set; }
        public ICommand TetelKeszButton => new ButtonCE(TetelKesz, TetelKeszCE);
        public SzakacsUIVM()
        {
            Task.Run(() => ListakFrissitAsync());
        }

        /// <summary>
        /// 5 mp-enként frissíti a tételek listát.
        /// </summary>
        private async void ListakFrissitAsync()
        {
            while (true)
            {
                try
                {
                    if (await _tetelek.TetelekFrissit("/Szakacs") && Application.Current is not null)
                        Application.Current.Dispatcher?.Invoke(() =>
                        {
                            TetelekListaFrissit();
                        });
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    break;
                }
                await Task.Delay(5000);
            }
        }

        /// <summary>
        /// Ha a tétel nincs benne a meglévő listába akkor hozzáadja, ha benne van akkor frissíti, utána meghívjuk a törlés funkciót.
        /// </summary>
        private void TetelekListaFrissit()
        {
            _tetelek.TetelLista.ForEach(t =>
            {
                if (!Tetelek.Any(x => x.Tazon == t.Tazon))
                {
                    Tetelek.Add(t);
                }
                else
                {
                    Tetel akttetel = Tetelek.First(x => t.Tazon == x.Tazon);
                    akttetel.SetErtekek(t);
                }
            });

            TetelekTorlese();
        }

        /// <summary>
        /// Ha a meglévő tételek listánkba van olyan tétel ami nincs benne a frisssen lekérdezett listába, azt belerakjuk egy törlésre szánt listába, + hozzáadjuk az összes 4es statusszal (fizetett) rendelkező tételt is. Ha az éppen kiválasztott tételünket törölni kell, akkor az éppen kiválasztott tételünket is null-ra rakjuk.
        /// </summary>
        private void TetelekTorlese()
        {
            List<Tetel> torlesre = Tetelek.Where(x => !_tetelek.TetelLista.Any(o => x.Tazon == o.Tazon)).ToList();
            torlesre.AddRange(Tetelek.Where(x => x.Etelstatus == 4 || x.Italstatus == 4));

            if (torlesre.Contains(KivalasztottTetel))
                KivalasztottTetel = null;
            torlesre.ForEach(x => Tetelek.Remove(x));
        }

        /// <summary>
        /// A kiválasztott tétel ételstátuszát átállitja 2re (kész).
        /// </summary>
        /// <param name="o"></param>
        private async void TetelKesz(object? o)
        {
            KivalasztottTetel.Etelstatus = 2;
            var tetelKeszCall = await _http.httpClient.PutAsync(_http.Url + _http.Endpointok["TetelFrissit"]+"?szakacs=true", _http.contentKrealas(KivalasztottTetel));
            if (tetelKeszCall.IsSuccessStatusCode)
            {
                Tetelek.Remove(KivalasztottTetel);
            }
        }
        private bool TetelKeszCE()
        {
            return KivalasztottTetel is not null;
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        public void RaisePropertyChanged([CallerMemberName] string? propertyName = null)
        {
            var handler = PropertyChanged;
            handler?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}

