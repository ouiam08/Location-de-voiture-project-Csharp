using LaLocationDeVoiture.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaLocationDeVoiture.Controllers
{
    
    public class AccountController : Controller
    {
        LaLocationDeVoitureEntities objUserEntities = new LaLocationDeVoitureEntities();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            UserModel objUserModel = new UserModel();
            return View(objUserModel);
        }
        [HttpPost]
        public ActionResult Register(UserModel objUserModel)
        {
            if(ModelState.IsValid)
            {
                if(objUserEntities.User.Where(m => m.email == objUserModel.email).FirstOrDefault() == null)
                {
                        User objUser = new Models.User();
                        objUser.email = objUserModel.email;
                        objUser.nom = objUserModel.nom;
                        objUser.prenom = objUserModel.prenom;
                        objUser.cin = objUserModel.cin;
                        objUser.tel = objUserModel.tel;
                        objUser.user_name = objUserModel.user_name;
                        objUser.num_permis = objUserModel.num_permis;
                        objUser.mot_pass = objUserModel.mot_pass;
                        objUserEntities.User.Add(objUser);
                        objUserEntities.SaveChanges();
                        objUserModel = new UserModel();


                        
                        return RedirectToAction("Login", "Account");
                }
                else
                {
                    ModelState.AddModelError("Error", "L'email existe déja!!");
                    return View();
                }
                
            }
            return View();
        }



        public ActionResult Login()
        {
            LoginModel objLoginModel = new LoginModel();
            return View(objLoginModel);
        }
        [HttpPost]
        public ActionResult Login(LoginModel objLoginModel)
        {
            if (ModelState.IsValid)
            {
                if(objUserEntities.User.Where(m=>m.email == objLoginModel.Email && m.mot_pass == objLoginModel.Mot_pass).FirstOrDefault() == null)
                {
                    ModelState.AddModelError("Error", "Le mot de passe entré est incorrect.");
                    return View();
                }
                else
                {
                    if (objUserEntities.User.Where(m => m.email == objLoginModel.Email && m.mot_pass == objLoginModel.Mot_pass && m.role == 0).FirstOrDefault() == null)
                    {
                        User user = objUserEntities.User.Where(m => m.email == objLoginModel.Email && m.mot_pass == objLoginModel.Mot_pass && m.role == 1).FirstOrDefault();
                        objLoginModel.Prenom = user.prenom;
                        Session["PrenomUser"] = objLoginModel.Prenom;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        User user = objUserEntities.User.Where(m => m.email == objLoginModel.Email && m.mot_pass == objLoginModel.Mot_pass && m.role == 0).FirstOrDefault();
                        objLoginModel.Prenom = user.prenom;
                        Session["PrenomAdmin"] = objLoginModel.Prenom;
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }



    }
}