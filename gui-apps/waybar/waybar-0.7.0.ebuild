# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Highly customizable Wayland bar for Sway and Wlroots based compositors."
HOMEPAGE="https://github.com/Alexays/Waybar"
SRC_URI="https://github.com/Alexays/Waybar/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mpd network pulseaudio sway tray wayland"
REQUIRED_USE="wayland"

DEPEND="
	dev-libs/jsoncpp
	dev-cpp/gtkmm
	dev-libs/libsigc++
	>=dev-libs/libfmt-5.3.0
	>=dev-libs/spdlog-1.3.1
"
RDEPEND="${DEPEND}
	dev-libs/wayland
	dev-libs/libinput
	gui-libs/wlroots
	mpd? ( media-libs/libmpdclient )
	network? ( dev-libs/libnl )
	pulseaudio? ( media-sound/pulseaudio )
	sway? ( gui-wm/sway )
	tray? ( dev-libs/libdbusmenu )
"
BDEPEND=""
S="${WORKDIR}/Waybar-${PV}"

PATCHES=(
	"${FILESDIR}"/update-makefile.patch
)

src_configure() {
	local emasonargs=(
		-Dprefix=${EPREFIX}
	)
	meson_src_configure
}

pkg_postinst() {
	elog "Details about configuring Waybar can be found at:"
	elog "https://github.com/Alexays/Waybar/wiki"
}
