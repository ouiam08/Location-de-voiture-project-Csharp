using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaLocationDeVoiture.Models
{
    [MetadataType(typeof(UserMetaData))]
    public partial class User
    {
        public class UserMetaData
        {
            [DisplayName("CIN")]
            public string cin { get; set; }
            [DisplayName("Nom d'etulisateur")]
            public string user_name { get; set; }
            [DisplayName("Nom")]
            public string nom { get; set; }
            [DisplayName("Prénom")]
            public string prenom { get; set; }
            [DisplayName("Numéro de téléphone")]
            public string tel { get; set; }
            [DisplayName("Numéro de Permis")]
            public string num_permis { get; set; }
            [DisplayName("Email")]
            public string email { get; set; }
            [DisplayName("Mot de Passe")]
            public string mot_pass { get; set; }
           
            
        }
    }
}