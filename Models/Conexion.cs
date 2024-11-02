using Microsoft.EntityFrameworkCore;

namespace API_APP.Models
{
    // Clase Conexion
    class Conexion : DbContext
    {
        public Conexion(DbContextOptions<Conexion> options) : base(options) { }

        public DbSet<Productos> Productos { get; set; }
        public DbSet<Marcas> marcas { get; set; } // Usando "marcas" en minúsculas
    }

    class Conectar
    {
        private const string cadenaConexion = "Server=localhost;Database=bd_proyecto_final;User=root;Password=dhuwjv;Port=3306;";

        public static Conexion Create()
        {
            var constructor = new DbContextOptionsBuilder<Conexion>();
            constructor.UseMySQL(cadenaConexion);
            var cn = new Conexion(constructor.Options);
            return cn;
        }
    }
}
