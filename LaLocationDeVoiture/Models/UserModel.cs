using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaLocationDeVoiture.Models
{
    public class UserModel
    {
        public int id_user { get; set; }


        [Required(AllowEmptyStrings = false, ErrorMessage = "CIN est est obligatoire")]
        [Display(Name = "CIN :")]
        public string cin { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "UserName est est obligatoire")]
        [Display(Name = "Nom d'etulisateur :")]
        public string user_name { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "Nom est est obligatoire")]
        [Display(Name = "Nom :")]
        public string nom { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "Prenom est est obligatoire")]
        [Display(Name = "Prenom :")]
        public string prenom { get; set; }



        [Required(AllowEmptyStrings = false, ErrorMessage = "Num de Tel est est obligatoire")]
        [Display(Name = "Numero de Telephone :")]
        public string tel { get; set; }



        [Display(Name = "Numero de permis :")]
        public string num_permis { get; set; }




        [Required(AllowEmptyStrings = false, ErrorMessage = "Email est est obligatoire")]
        [Display(Name = "Email :")]
        public string email { get; set; }



        
        [DataType(DataType.Password)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Mot de passe est est obligatoire")]
        [Display(Name = "Mot de Passe :")]
        public string mot_pass { get; set; }


        [Required(AllowEmptyStrings = false, ErrorMessage = "Confirmation de mot de passe est obligatoire")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirmer Mot de Passe:")]
        [Compare("mot_pass", ErrorMessage = "Les mots de passes ne sont pas identiques!!")]
        public string mot_pass_valider { get; set; }

    }
}