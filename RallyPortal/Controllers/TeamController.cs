using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RallyPortal;

namespace RallyPortal.Controllers
{ 
    public class TeamController : Controller
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Team/

        public ViewResult Index()
        {   
            return View(db.TeamSet.ToList());
        }

        //
        // GET: /Team/Details/5

        public ViewResult Details(int id)
        {
            Team team = db.TeamSet.Find(id);
            return View(team);
        }

        //
        // GET: /Team/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Team/Create

        [HttpPost]
        public ActionResult Create(Team team)
        {
            if (ModelState.IsValid)
            {
                db.TeamSet.Add(team);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(team);
        }
        
        //
        // GET: /Team/Edit/5
 
        public ActionResult Edit(int id)
        {
            Team team = db.TeamSet.Find(id);
            return View(team);
        }

        //
        // POST: /Team/Edit/5

        [HttpPost]
        public ActionResult Edit(Team team)
        {
            if (ModelState.IsValid)
            {
                db.Entry(team).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(team);
        }

        //
        // GET: /Team/Delete/5
 
        public ActionResult Delete(int id)
        {
            Team team = db.TeamSet.Find(id);
            return View(team);
        }

        //
        // POST: /Team/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Team team = db.TeamSet.Find(id);
            db.TeamSet.Remove(team);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}