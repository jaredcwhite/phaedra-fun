import { css, customElement, html, LitElement, property } from "lit-element"
import registry from "../../frontend/javascript/productStockRegistry.js"

@customElement("product-price")
class ProductPrice extends LitElement {
  @property()
  sku = ""

  static styles = css`
    .loading {
      opacity: 0.5;
    }
  `

  render() {
    return html`
      <aside class="${!this.productLoaded? "loading" : ""}">
        <div><slot name="price"></slot></div>
        <div>
          ${ this.product.inventory > 0 ?
            html`<slot @click="${this.addToCartHandler}" name="add-to-cart"></slot>` :
            html`We're sorry, this product is currently out of stock.`
          }
        </div>
      </aside>
    `
  }

  connectedCallback() {
    this.loadProduct()
    super.connectedCallback()
  }

  async loadProduct() {
    this.product = {inventory: 1} // initial state
    this.product = await registry.stockForProduct(this.sku)
    this.productLoaded = true
    this.requestUpdate()
  }

  updated() {
    if (this.product.price) {
      this.querySelector("[slot=price]").textContent = `\$${this.product.price}`
    }
  }

  addToCartHandler(e) {
    if (this.productLoaded) {
      // Add the product to the cart! :)
    } else {
      // Uh oh, we don't know if there's real inventory yet
      console.warn("Inventory not yet loaded…")
    }
  }
}
