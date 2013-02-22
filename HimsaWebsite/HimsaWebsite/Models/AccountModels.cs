using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Globalization;
using System.Web.Security;

namespace HimsaWebsite.Models
{
    public class UsersContext : DbContext
    {
        public UsersContext()
            : base("DefaultConnection")
        {
        }
        //new comment
        public DbSet<UserProfile> UserProfiles { get; set; }
        public DbSet<app_message> app_message { get; set; }
        public DbSet<badge> badges { get; set; }
        public DbSet<lvl_cap> lvl_cap { get; set; }
        public DbSet<setting> settings { get; set; }
        public DbSet<task> tasks { get; set; }
        public DbSet<team> teams { get; set; }
        public DbSet<user_team> user_team { get; set; }
        //public DbSet<webpages_Membership> webpages_Membership { get; set; }
        public DbSet<webpages_OAuthMembership> webpages_OAuthMembership { get; set; }
        public DbSet<webpages_Roles> webpages_Roles { get; set; }
    }

    [Table("UserProfile")]
    public class UserProfile
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int UserId { get; set; }


        public string UserName { get; set; }

        public UserProfile()
        {
            this.badges = new HashSet<badge>();
            this.tasks = new HashSet<task>();
            this.user_team = new HashSet<user_team>();
            this.webpages_Roles = new HashSet<webpages_Roles>();
        }

        [DefaultValue(0)]
        public Nullable <int> lvl_no { get; set; }

        public virtual ICollection<badge> badges { get; set; }
        public virtual ICollection<task> tasks { get; set; }
        public virtual ICollection<user_team> user_team { get; set; }
        public virtual ICollection<webpages_Roles> webpages_Roles { get; set; }
    }


    public  class app_message
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int message_id { get; set; }

        public string name { get; set; }
        public string message_type { get; set; }
    }

    public  class badge
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int badge_id { get; set; }
        public int usr_id { get; set; }
        public byte[] img { get; set; }

        public virtual UserProfile UserProfile { get; set; }
    }


    public  class lvl_cap
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int lvl_no { get; set; }
        public Nullable<int> cap { get; set; }
    }
    public  class setting
    {
        [Key]
        public int idsettings { get; set; }
    }


    public  class task
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int task_id { get; set; }

        public string name { get; set; }
        public Nullable<int> xp { get; set; }
        public Nullable<int> usr_id { get; set; }
        public Nullable<int> complete { get; set; }
        public string message_type { get; set; }
        public Nullable<System.DateTime> end_date { get; set; }
        public string descrp { get; set; }
        public byte[] descrp_story { get; set; }
        public Nullable<int> team_id { get; set; }
        public Nullable<int> difficulty { get; set; }

        public virtual team team { get; set; }
        public virtual UserProfile UserProfile { get; set; }
    }

    public  class team
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


    public  class user_team
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


     [Table("webpages_Membership")]
    public  class webpages_Membership
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int UserId { get; set; }



        public Nullable<System.DateTime> CreateDate { get; set; }
        public string ConfirmationToken { get; set; }
        public Nullable<bool> IsConfirmed { get; set; }
        public Nullable<System.DateTime> LastPasswordFailureDate { get; set; }
        public int PasswordFailuresSinceLastSuccess { get; set; }
        public string Password { get; set; }
        public Nullable<System.DateTime> PasswordChangedDate { get; set; }
        public string PasswordSalt { get; set; }
        public string PasswordVerificationToken { get; set; }
        public Nullable<System.DateTime> PasswordVerificationTokenExpirationDate { get; set; }
     
    }
 


    public  class webpages_OAuthMembership
    {
        [Key]
        [Column(Order = 0)]
        public string Provider { get; set; }
        [Key]
        [Column(Order = 1)]
        public string ProviderUserId { get; set; }
        public int UserId { get; set; }
    }

    public  class webpages_Roles
    {
        public webpages_Roles()
        {
            this.UserProfiles = new HashSet<UserProfile>();
        }
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int RoleId { get; set; }
        public string RoleName { get; set; }

        public virtual ICollection<UserProfile> UserProfiles { get; set; }
    }



    public class RegisterExternalLoginModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }
        public string ExternalLoginData { get; set; }
    }

    public class LocalPasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class ExternalLogin
    {
        public string Provider { get; set; }
        public string ProviderDisplayName { get; set; }
        public string ProviderUserId { get; set; }
    }
}
