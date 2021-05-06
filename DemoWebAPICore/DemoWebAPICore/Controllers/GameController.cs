using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using DemoModelAPICore.Entities;
using DemoModelAPICore.Interfaces;
using DemoModelAPICore.Services;
using DemoWebAPICore.Models;

namespace DemoWebAPICore.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class GameController : ControllerBase
	{
		#region Game Repository
		
		GameRepositoryClient gameRepository; 

		#endregion

		#region Constructor

		public GameController(GameRepositoryClient gameRepository)
		{
			this.gameRepository = gameRepository;
		}

		#endregion

		[HttpGet]
		public IActionResult Get() => Ok(gameRepository.Get());

		[HttpGet("{id}")]
		public IActionResult Get(int id) => Ok(gameRepository.Get(id));

		[HttpGet("byName/{name}")]
		public IActionResult Get(string name) => Ok(gameRepository.Get(name));
	}
}
