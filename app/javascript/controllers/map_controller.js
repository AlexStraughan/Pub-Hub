import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }


  connect() {
    console.log("Hello from map controller")
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.apiKeyValue);

    this.map = new mapboxgl.Map({
      container: this.element,
      // /style: "mapbox://styles/mapbox/standard-v10"
      style: "mapbox://styles/calnorman/cl44cfu9l000014mtpikuws5i"
    })
    console.dir(this.map)
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
