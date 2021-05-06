using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoModelGlobal.Models
{
	public class GameGlobal
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
	}
}
