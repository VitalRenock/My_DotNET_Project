using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DemoModelClient.Models;
using DemoWebAPI.Models;
using VitalTools.Mapper;

namespace DemoWebAPI.Mapper
{
	public class UserMapper : IMapper<UserClient, UserApi>
	{
		public override UserClient ToOrigin(UserApi target)
		{
			return new UserClient(
				target.LastName,
				target.FirstName,
				target.Email,
				target.Password
				);
		}

		public override UserApi ToTarget(UserClient origin)
		{
			return new UserApi(
				origin.LastName,
				origin.FirstName,
				origin.Email,
				origin.Password
				);
		}
	}
}