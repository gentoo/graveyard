# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

DESCRIPTION="XMMS plugin applying the bs2b headphone effect"
HOMEPAGE="http://bs2b.sourceforge.net/"
SRC_URI="mirror://sourceforge/bs2b/${P}.tar.bz2"

IUSE="BS2B_HIGH_CLEVEL BS2B_MIDDLE_CLEVEL BS2B_LOW_CLEVEL
	BS2B_HIGH_ECLEVEL BS2B_MIDDLE_ECLEVEL BS2B_LOW_ECLEVEL
	BS2B_CMOY_CLEVEL BS2B_JMEIER_CLEVEL 2.x-default-level"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~x86"

RDEPEND=">=media-libs/libbs2b-3.0.0
		media-sound/xmms"

DEPEND="dev-util/pkgconfig
		${RDEPEND}"

src_compile() {
	# Dirty hack but I don't care too much for the moment
	default_level=BS2B_DEFAULT_CLEVEL
	for flag in ${IUSE} ; do
		if [ ${flag} = 2.x-default-level ] ; then
			default_level=BS2B_HIGH_ECLEVEL
			continue
		fi
		eval "use ${flag} && default_level=${flag}"
	done
	elog "Using ${default_level} as default level"

	econf --with-effect-level=${default_level} || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS README || die "dodoc failed"
}
