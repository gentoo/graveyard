# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base autotools

MY_PN=scivi
MY_P="${MY_PN}-${PV/_/-}"

SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"
SLOT="0"

RDEPEND="x11-libs/gtk+:1
	dev-libs/glib:1
	media-sound/xmms
	x11-proto/xproto"
DEPEND="sys-devel/bison
	sys-devel/flex"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cd "${S}"

	epatch "${FILESDIR}"/${MY_PN}-0.2.0-rc3-compile.patch

	# Comment out a few lines
	sed -i 's/^\(.*\$x_\(libraries\|includes\)\)/# \1/' configure.ac \
		|| die "sed failed"
	eautoreconf
}

src_install() {
	base_src_install

	dodoc AUTHORS NEWS README || die "dodoc failed"
}
