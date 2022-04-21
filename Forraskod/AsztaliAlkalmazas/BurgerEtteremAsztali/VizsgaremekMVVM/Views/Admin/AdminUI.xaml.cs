﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using VizsgaremekMVVM.ViewModels.Admin;
using VizsgaremekMVVM.Models;

namespace VizsgaremekMVVM.Views.Admin
{
    /// <summary>
    /// Interaction logic for AdminUI.xaml
    /// </summary>
    public partial class AdminUI : Window
    {
        public AdminUI()
        {
            InitializeComponent();
            DataContext = new AdminUIVM();
            Nav(fooldalNav, null);
            kijelentkezesMenu.Click += Kijelentkezes.kijelentkezes;
            jelszoValtoztatMenu.Click += JelszoValtoztatEljaras.jelszoValtoztat;
        }

        private void Nav(object sender, RoutedEventArgs e)
        {
            UIElementCollection gombok = NavGrid.Children;
            Button aktiv = (Button)sender;
            switch(aktiv.Name)
            {
                case "fooldalNav":
                    contentControl.Content = new Attekintes();
                    break;
                case "termekekNav":
                    contentControl.Content = new Termekek();
                    break;
                case "felhasznalokNav":
                    contentControl.Content = new Felhasznalok();
                    break;
                case "foglalasokNav":
                    contentControl.Content = new Foglalasok();
                    break;
                case "rendelesNav":
                    contentControl.Content = new Rendelesek();
                    break;
            }
            foreach (object gomb in gombok)
            {
                Button button = (Button)gomb;
                if (aktiv.Name == button.Name)
                {
                    button.Foreground = new SolidColorBrush(Colors.White);
                }
                else
                {
                    button.Foreground = new SolidColorBrush(Colors.Black);
                }
            }
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = (MenuItem)sender;
            switch (menuItem.Name)
            {
                case "fAblak":
                    Felszolgalo.FelszolgaloUI felszolgaloUI = new();
                    felszolgaloUI.Show();
                    break;
                case "szAblak":
                    Szakacs.SzakacsUI szakacsUI = new();
                    szakacsUI.Show();
                    break;
                case "pAblak":
                    Pultos.PultosUI pultosUI = new();
                    pultosUI.Show();
                    break;
            }

        }
    }
}
