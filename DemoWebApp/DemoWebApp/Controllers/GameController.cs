using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using DemoWebApp.Models;
using VitalTools.Api;

namespace DemoWebApp.Controllers
{
    public class GameController : Controller
    {
        // API Properties
        ApiRequester apiRequester;

        // Constructors
        public GameController() => apiRequester = new ApiRequester("http://localhost:50070/api/");


        #region CRUD Methods

        [HttpGet]
        public ActionResult Index()
        {
            return View(apiRequester.Get<IEnumerable<GameMvc>>("Game"));
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            return View(apiRequester.Get<GameMvc>($"Game/{id}"));
        }

        [HttpGet]
        public ActionResult Create()
		{
            return View();
		}
        [HttpPost]
        public ActionResult Create(GameMvc game) 
        {
            if (!ModelState.IsValid)
                return View();

            apiRequester.Add(game, "Game");
            return RedirectToAction("Details");
        }

        [HttpGet]
        public ActionResult Edit(int id)
		{
            return View(apiRequester.Get<GameMvc>($"Game/{id}"));
		}
        [HttpPost]
        public ActionResult Edit(int id, GameMvc game)
		{
            if (!ModelState.IsValid)
                return View();

            apiRequester.Edit(game, "Game");
            return RedirectToAction("Index");
		}

        [HttpGet]
        public ActionResult Delete(int id)
		{
            apiRequester.Delete(id, "Game");
            return RedirectToAction("Index");
		}

        #endregion
    }
}