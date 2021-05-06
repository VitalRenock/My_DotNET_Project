using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

using DemoModelClient.Models;
using DemoModelClient.Services;
using DemoWebAPI.Mapper;
using DemoWebAPI.Models;
using VitalTools.Api.Controllers;

namespace DemoWebAPI.Controllers
{
	public class GameController : CrudController<GameClient, GameApi>
	{
		// Constructor
		public GameController()
		{
			Service = new GameClientService();
			Mapper = new GameMapper();
		}

		// CRUD Methods
		[HttpGet]
		public override IEnumerable<GameApi> GetAll()
		{
			return base.GetAll();
		}

		[HttpGet]
		public override GameApi Get(int id)
		{
			return base.Get(id);
		}

		[HttpPost]
		public override int Add([FromBody] GameApi entity)
		{
			return base.Add(entity);
		}

		[HttpPut]
		public override bool Edit(int id, [FromBody] GameApi entity)
		{
			return base.Edit(id, entity);
		}

		[HttpDelete]
		public override bool Delete(int id)
		{
			return base.Delete(id);
		}
	}
}