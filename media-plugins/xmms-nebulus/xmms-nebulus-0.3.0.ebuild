# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xmms-nebulus/xmms-nebulus-0.3.0.ebuild,v 1.9 2004/10/04 23:15:09 pvdabeel Exp $

IUSE=""

DESCRIPTION="OpenGL/SDL visualization plugin for XMMS"
HOMEPAGE="http://nebulus.tuxfamily.org/"
SRC_URI="http://nebulus.tuxfamily.org/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ppc"

DEPEND="media-sound/xmms
	media-libs/libsdl"

src_install () {
	make DESTDIR=${D} install || die
}
