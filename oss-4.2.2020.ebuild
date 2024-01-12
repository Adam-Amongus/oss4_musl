
gpo.zugaina.org
Search Portage & Overlays:
Newest News Repository news GLSAs Browse USE Flags Overlays More...
media-sound/oss
Open Sound System (OSS)

    http://www.opensound.com/

    oss-4.2.9999

    View      Download      Browse     License: GPL-2   
    Overlay: lanodanOverlay
    oss-4.2.2020

    View      Download      Browse     License: GPL-2   
    Overlay: lanodanOverlay
    oss-4.2.2019

    View      Download      Browse     License: GPL-2   
    Overlay: lanodanOverlay

ChangeLog USE Flags Dependencies Reverse Deps Related Bugs



gpo.zugaina.org - An unofficial overlays portage website
"Gentoo" is a trademark of Gentoo Foundation, Inc.
Website code from Mike Valstar and Ycarus
Gentoo Portage Overlays by Ycarus/Zugaina.org
Close

# Copyright 2020 Haelwenn (lanodan) Monnier <contact@hacktivis.me>
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="oss-v$(ver_cut 1-2)-build$(ver_cut 3)-src-gpl"

DESCRIPTION="Open Sound System (OSS)"
HOMEPAGE="http://www.opensound.com/"
SRC_URI="https://github.com/Adam-Amongus/oss4_musl/raw/main/oss4_musl.tar.gz"
S="${WORKDIR}/${MY_P}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPENDS="x11-libs/gtk+:2"
RDEPENDS="${DEPENDS}"

PATCHES=(
	"${FILESDIR}/oss-4.2.2019_sysmacros.patch"
)
#	"${FILESDIR}/oss-4.2.2019_no_compressed_manpages.patch"

src_prepare() {
	default

	mkdir "${S}_build" || die "Failed creating empty build directory"
}

src_configure() {
	cd "${S}_build" || die "Failed changing to build directory"

	"${S}/configure" --enable-libsalsa=NO || die "Failed running ./configure"
}

src_compile() {
	cd "${S}_build" || die "Failed changing to build directory"

	emake build
}

src_install() {
	cd "${S}_build" || die "Failed changing to build directory"

	emake DESTDIR="${D}/" copy
}

