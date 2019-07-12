# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Select a region in a Wayland compositor"
HOMEPAGE="https://wayland.emersion.fr/slurp"
SRC_URI="https://github.com/emersion/slurp/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="wayland"
REQUIRED_USE="wayland"

DEPEND="
	x11-libs/cairo
	dev-libs/wayland
	app-text/scdoc
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/create-makefile.patch
)

src_configure() {
	local emasonargs=(
		-Dprefix=${EPREFIX}
	)
	meson_src_configure
}
