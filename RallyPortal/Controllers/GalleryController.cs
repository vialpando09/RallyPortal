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
    public class GalleryController : Controller
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Gallery/

        public ViewResult Index()
        {
            return View(db.GallerySet.ToList());
        }

        //
        // GET: /Gallery/Details/5

        public ViewResult Details(int id)
        {
            Gallery gallery = db.GallerySet.Find(id);
            return View(gallery);
        }

        //
        // GET: /Gallery/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Gallery/Create

        [HttpPost]
        public ActionResult Create(Gallery gallery)
        {
            if (ModelState.IsValid)
            {
                db.GallerySet.Add(gallery);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(gallery);
        }
        
        //
        // GET: /Gallery/Edit/5
 
        public ActionResult Edit(int id)
        {
            Gallery gallery = db.GallerySet.Find(id);
            return View(gallery);
        }

        //
        // POST: /Gallery/Edit/5

        [HttpPost]
        public ActionResult Edit(Gallery gallery)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gallery).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gallery);
        }

        //
        // GET: /Gallery/Delete/5
 
        public ActionResult Delete(int id)
        {
            Gallery gallery = db.GallerySet.Find(id);
            return View(gallery);
        }

        //
        // POST: /Gallery/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Gallery gallery = db.GallerySet.Find(id);
            db.GallerySet.Remove(gallery);
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