using Microsoft.AspNetCore.Mvc;
using System.Linq;
using API_APP.Models;

namespace API_APP.Controllers
{
    [Route("api/[controller]")]
    public class ProductosController : Controller
    {
        private readonly Conexion dbConexion;

        public ProductosController()
        {
            dbConexion = Conectar.Create();
        }

        // Este GET devuelve todos los valores
        [HttpGet]
        public ActionResult Get()
        {
            var query = from p in dbConexion.Productos
                        join m in dbConexion.marcas on p.id_Marca equals m.id_Marca // Usando "marcas" en minúsculas
                        select new
                        {
                            p.id_Producto,
                            p.producto,
                            Marca = m.marca, // Aquí obtenemos el nombre de la marca
                            p.Descripcion,
                            p.precio_venta,
                            p.precio_costo,
                            p.existencia,
                            p.fecha_ingreso,
                            p.Imagen
                        };

            return Ok(query.ToArray());
        }

        // Este GET devuelve el valor del ID en la dirección api/productos/{id}
        [HttpGet("{id}")]
        public ActionResult GetAction(int id)
        {
            var producto = (from p in dbConexion.Productos
                            join m in dbConexion.marcas on p.id_Marca equals m.id_Marca // Usando "marcas" en minúsculas
                            where p.id_Producto == id
                            select new
                            {
                                p.id_Producto,
                                p.producto,
                                Marca = m.marca, // Aquí obtenemos el nombre de la marca
                                p.Descripcion,
                                p.precio_venta,
                                p.precio_costo,
                                p.existencia,
                                p.fecha_ingreso,
                                p.Imagen
                            }).SingleOrDefault();

            if (producto != null)
            {
                return Ok(producto);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
