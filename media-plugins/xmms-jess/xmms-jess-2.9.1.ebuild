# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xmms-jess/xmms-jess-2.9.1.ebuild,v 1.13 2005/09/04 10:29:49 flameeyes Exp $

IUSE=""

inherit eutils

MY_P="JESS-${PV}"
S=${WORKDIR}/${MY_P}
DESCRIPTION="JESS Visualization Plugin for XMMS"
SRC_URI="http://arquier.free.fr/${MY_P}.tar.gz"
HOMEPAGE="http://arquier.free.fr/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ppc amd64 sparc"

DEPEND="media-sound/xmms
	>=media-libs/libsdl-1.1.5"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}-gcc34.patch
}

src_install () {
	dodir `xmms-config --visualization-plugin-dir`

	make DESTDIR="${D}" install || die

	dodoc AUTHORS ChangeLog README NEWS
}
