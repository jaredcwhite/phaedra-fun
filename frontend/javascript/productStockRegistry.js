class ProductStockRegistry {
  stockForProduct(productId) {
    const promise = new Promise(resolution => {
      setTimeout(() => {
        let product
        if (productId == "abc123") {
          product = {inventory: 10, price: 40.95}
        } else {
          product = {inventory: 0, price: 88.45}
        }
        resolution(product)
      }, 1500)
    })

    return promise
  }
}
window.$_productStockRegistry = new ProductStockRegistry()

export default window.$_productStockRegistry