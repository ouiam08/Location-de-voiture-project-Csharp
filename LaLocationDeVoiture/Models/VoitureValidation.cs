using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaLocationDeVoiture.Models
{
    [MetadataType(typeof(VoitureMetaData))]
    public partial class Voiture
    {   
        public class VoitureMetaData
        {
            [DisplayName("Matricule")]
            public string matricule { get; set; }
            [DisplayName("Marque")]
            public string marque { get; set; }
            [DisplayName("Modèle")]
            public string modele { get; set; }
            [DisplayName("Motorisation")]
            public string motorisation { get; set; }
            [DisplayName("Etat")]
            public string etat { get; set; }
            [DisplayName("Prix")]
            public Nullable<double> prix { get; set; }
        }
    }
}