using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HimsaWebsite.Models
{
    public class UserHomeContext : DbContext
    {

         public DbSet<badge> badges { get; set; }
         public DbSet<lvl_cap> lvl_cap { get; set; }
         public DbSet<setting> settings { get; set; }
         public DbSet<team> teams { get; set; }
         public DbSet<user_team> user_teams { get; set; }
         public DbSet<task> user_tasks { get; set; }
    }

    public class badge
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int badge_id { get; set; }
        public int usr_id { get; set; }
        public byte[] img { get; set; }

        public virtual UserProfile UserProfile { get; set; }
    }


    public class lvl_cap
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int lvl_no { get; set; }
        public Nullable<int> cap { get; set; }
    }
    public class setting
    {
        [Key]
        public int idsettings { get; set; }
    }

    [Table("tasks")]
    public class task
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int task_id { get; set; }
        public string name { get; set; }
        public Nullable<int> xp { get; set; }
        public Nullable<int> complete { get; set; }
        public Nullable<System.DateTime> end_date { get; set; }

    }

    public class team
    {
        public team()
        {
            this.tasks = new HashSet<task>();
            this.user_team = new HashSet<user_team>();
        }


        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int team_id { get; set; }
        public string name { get; set; }
        public byte[] imag { get; set; }
        public Nullable<int> progress { get; set; }

        public virtual ICollection<task> tasks { get; set; }
        public virtual ICollection<user_team> user_team { get; set; }
    }


    public class user_team
    {
        [Key]
        [Column(Order = 0)]
        public int user_team_id { get; set; }
        [Key]
        [Column(Order = 1)]
        public int usr_id { get; set; }
        [Key]
        [Column(Order = 2)]
        public int team_id { get; set; }

        public System.DateTime join_date { get; set; }

        public virtual team team { get; set; }
        public virtual UserProfile UserProfile { get; set; }
    }



}
