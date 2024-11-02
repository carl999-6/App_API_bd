using System.ComponentModel.DataAnnotations;

namespace API_APP.Models
{
    public class Productos
    {
        [Key]
        public int id_Producto { get; set; }
        public string producto { get; set; }
        public int id_Marca { get; set; } 
        public string Descripcion { get; set; }
        public string Imagen { get; set; }
        public double precio_costo { get; set; }
        public double precio_venta { get; set; }
        public int existencia { get; set; }
        public DateTime fecha_ingreso { get; set; }
        public string marca { get; set; } // Añadido para el nombre de la marca
    }

    public class Marcas
    {
        [Key]
        public int id_Marca { get; set; } // Asegúrate de que este tipo coincida con la columna de unión
        public string marca { get; set; }
    }
}
