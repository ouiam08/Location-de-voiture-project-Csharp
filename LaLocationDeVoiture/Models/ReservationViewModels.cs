using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaLocationDeVoiture.Models
{
    public class ReservationViewModels
    {
        public int id_reservation { get; set; }
        public string matricule { get; set; }
        public string cin { get; set; }
        public Nullable<System.DateTime> date_deb { get; set; }
        public Nullable<int> nbr_jour { get; set; }
        public string lieu_deb { get; set; }
        public string lieu_fin { get; set; }
        public Nullable<double> montant { get; set; }
        public string etat { get; set; }
        
        
    }
}