using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoWebAPI.Models
{
	public class GameApi
	{
		#region Properties

		public int Id { get; set; }
		public string Name { get; set; }
		public string Owner { get; set; }
		public string Console { get; set; }
		public int Price { get; set; }
		public int MaxPlayers { get; set; }
		public string Commentary { get; set; }

		#endregion

		#region Constructors

		public GameApi(int id, string name, string owner, string console, int price, int maxPlayers, string commentary)
		{
			Id = id;
			Name = name;
			Owner = owner;
			Console = console;
			Price = price;
			MaxPlayers = maxPlayers;
			Commentary = commentary;
		}

		#endregion
	}
}