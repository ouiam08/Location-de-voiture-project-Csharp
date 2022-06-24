using LaLocationDeVoiture.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace LaLocationDeVoiture.Controllers
{
    public class ReservationController : Controller
    {
        LaLocationDeVoitureEntities db = new LaLocationDeVoitureEntities();

        // GET: Reservation
        public ActionResult Index()
        {
            var resultat = (from r in db.Reservation
                            join v in db.Voiture on r.matricule equals v.matricule
                            select new ReservationViewModels
                            {
                                id_reservation = r.id_reservation,
                                matricule = r.matricule,
                                cin = r.cin,
                                date_deb = r.date_deb,
                                nbr_jour = r.nbr_jour,
                                lieu_deb = r.lieu_deb,
                                lieu_fin = r.lieu_fin,
                                montant = v.prix * r.nbr_jour,
                                etat = v.etat,

                            }).ToList();
            return View(resultat);
        }
        
       


        [HttpGet]
        public ActionResult GetVoiture()
        {
            var voiture = db.Voiture.ToList();
            return Json(voiture, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult GetNomApresCin(string cin)
        {
            var user = (from s in db.User where s.cin == cin select s.nom).ToList();
            
            return Json(user, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult GetPrenomApresCin(string cin)
        {
            var user = (from s in db.User where s.cin == cin select s.prenom).ToList();

            return Json(user, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult GetEtat(string matricule)
        {
            var etatVoiture = (from s in db.Voiture where s.matricule == matricule select s.etat).FirstOrDefault();

            return Json(etatVoiture, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Enregistrer(Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Reservation.Add(reservation);
                var voiture = db.Voiture.SingleOrDefault(e => e.matricule == reservation.matricule);
                if(voiture == null)
                {
                    return HttpNotFound("Lea voiture n'existe pas");
                }
                voiture.etat = "pas disponible";
                db.Entry(voiture).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reservation);
        }




        // GET: User/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservation.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_reservation,matricule,cin,date_deb,nbr_jour,lieu_deb,lieu_fin,montant,etat")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reservation);
        }




        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservation.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }





        // GET: Voiture/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservation.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Voiture/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservation.Find(id);
            db.Reservation.Remove(reservation);
            db.SaveChanges();
            return RedirectToAction("Index");
        }



    }
}