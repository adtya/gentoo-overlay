# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson vala

DESCRIPTION="GTK-based Mastodon client for Linux"
HOMEPAGE="https://github.com/bleakgrey/tootle"
SRC_URI="https://github.com/bleakgrey/tootle/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-lang/vala
	dev-libs/granite
	dev-libs/json-glib
	>=net-libs/libsoup-2.4
	x11-libs/gtk+
	gui-libs/libhandy
"
DEPEND="${RDEPEND}

"
BDEPEND=""

S="${WORKDIR}/tootle-${PV}"

src_prepare() {
	eapply_user
}

src_configure() {
	local emasonargs=(
		-Dprefix=${EPREFIX}
	)
	meson_src_configure
}

