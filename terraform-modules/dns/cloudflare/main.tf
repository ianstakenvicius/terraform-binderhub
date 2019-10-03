provider "cloudflare" {}

resource "cloudflare_record" "domain" {
  zone_id = "${join(".", slice(split(".", var.domain), 1, length(split(".", var.domain))))}"
  name   = "${element(split(".", var.domain), 0)}"
  value  = "${var.public_ip}"
  type   = "A"
}
