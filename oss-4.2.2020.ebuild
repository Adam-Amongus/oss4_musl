# Copyright 2020 Haelwenn (lanodan) Monnier <contact@hacktivis.me>
# Distributed under the terms of the GNU General Public License v2
# Modified by ...

EAPI=7

DESCRIPTION="Open Sound System (OSSv4)"
HOMEPAGE="http://www.opensound.com/"
SRC_URI="https://github.com/Adam-Amongus/oss4_musl/blob/main/oss4_musl.tar.gz"
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
