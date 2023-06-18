using Alten.Data;
using Alten.Models;
using Alten.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Alten.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class ProductsController : ControllerBase
    {
        private readonly IProductsRepository _productsRepository;
        private readonly DataContext context;
        public ProductsController(IProductsRepository productsRepository, DataContext context)
        {
            _productsRepository = productsRepository;
            this.context = context;
        }

        [HttpGet]
        [ProducesResponseType(200, Type = typeof(IEnumerable<Product>))]
        public IActionResult GetProducts()
        {
            var products = _productsRepository.GetProducts();
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            return Ok(products);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(200, Type = typeof(Product))]
        [ProducesResponseType(400)]
        public IActionResult GetProduct(int id)
        {
            if (!_productsRepository.ProductExist(id))
            {
                return NotFound();
            }

            var product= _productsRepository.GetProduct(id);

            if(!ModelState.IsValid)
                return BadRequest(ModelState);

            return Ok(product);
        }

        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(400)]
        public IActionResult CreateProduct([FromQuery] string name, [FromQuery] string description, [FromQuery] string code, [FromQuery] string image, [FromQuery] int price, [FromQuery] string category, [FromQuery] int quantity,[FromQuery] string inventoryStatus, [FromQuery] int rating)
        {
            if (!_productsRepository.CreateProduct(name, description, code, image, price, category, quantity, inventoryStatus, rating))
            {
                ModelState.AddModelError("", "Error SQL");
                return StatusCode(500, ModelState);
            }

            return Ok("Successfully created");

        }

        [HttpPut("{id}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(204)]
        [ProducesResponseType(404)]
        public IActionResult UpdateProduct(int id, [FromBody]Product updatedProduct) { 
        
            if(updatedProduct == null)
                return BadRequest(ModelState);

            if(id != updatedProduct.Id)
                return BadRequest(ModelState);

            if (!_productsRepository.ProductExist(id))
                return NotFound();

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (!_productsRepository.UpdateProduct(updatedProduct))
            {
                ModelState.AddModelError("", "Something went wrong updating product");
                return StatusCode(500, ModelState);
            }

            return NoContent();

        }

        [HttpDelete("{id}")]
        [ProducesResponseType(400)]
        [ProducesResponseType(204)]
        [ProducesResponseType(404)]
        public IActionResult DeleteProduct(int id)
        {            
            if (!_productsRepository.ProductExist(id))
                return NotFound();

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var product = _productsRepository.GetProduct(id);            
            if (!_productsRepository.DeleteProduct(product))
            {
                ModelState.AddModelError("", "Something went wrong updating product");
                return StatusCode(500, ModelState);
            }

            return NoContent();

        }
    }
}
