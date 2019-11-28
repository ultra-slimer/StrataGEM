﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using strataGEM.Models;

namespace strataGEM.Controllers
{
    public class ReviewController : Controller
    {
        // GET: Review
        public ActionResult IndexRev(int id)
        {
            List<Review> LReviews = Clases.BD.TraerReseñasXJuego(id);
            Game juego = Clases.BD.TraerJuego(LReviews[0].Review_IdGame);
            ViewBag.titulo = juego.Game_Name;
            return View(LReviews);
        }

        public ActionResult PasarNombre(int id)
        {
            Game Juego = Clases.BD.TraerJuego(id);
            return View(Juego.Game_Name);
        }

        // GET: Review/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Review/Create

        // POST: Review/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Review/Edit/5
        public ActionResult Edit(int id)
        {
            Review BB = Clases.BD.TraerReview(id);
            return View(BB);
        }

        // POST: Review/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Review/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Review/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
