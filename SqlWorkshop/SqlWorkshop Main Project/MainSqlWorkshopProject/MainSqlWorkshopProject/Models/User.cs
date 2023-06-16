using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MainSqlWorkshopProject.Models
{
	internal class Users
	{
	//	public string FullName { get; set; }
		//public string Title { get; set; }
		public string Firstname { get; set; }
		public string Lastname { get; set; }
		public DateTime BirthDate { get; set; }
		public int Age { get; set; }
		public decimal Salary { get; set; }
		public string CreditCard { get; set; }
	    //public DateTime registeredDate { get; set; }
		//public int registeredAge { get; set; }
		public string Nationality { get; set; }
		public string Gender { get; set; }
	}
}
