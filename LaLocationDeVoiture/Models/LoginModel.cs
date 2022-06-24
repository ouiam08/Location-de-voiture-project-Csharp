using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaLocationDeVoiture.Models
{
    public class LoginModel
    {
                [Required(ErrorMessage ="Email est obligatoire")]
                public string Email { get; set; }

                [Display(Name ="Mot de Passe")]
                [Required(ErrorMessage = "Le mot de passe est obligatoire")]
                [DataType(DataType.Password)]
                public string Mot_pass { get; set; }
                public string Prenom { get; set; }

    }
}