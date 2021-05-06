using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace DemoWebAPICore.Models
{
	[DataContract]
	public class GameApiCore
	{
		#region Properties

		[DataMember]
		public int Id { get; set; }
		[DataMember]
		public string Name { get; set; }
		[DataMember]
		public string Owner { get; set; }
		[DataMember]
		public string Console { get; set; }
		[DataMember]
		public int Price { get; set; }
		[DataMember]
		public int MaxPlayers { get; set; }
		[DataMember]
		public string Commentary { get; set; }

		#endregion

		#region Constructors

		public GameApiCore(int id, string name, string owner, string console, int price, int maxPlayers, string commentary)
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
