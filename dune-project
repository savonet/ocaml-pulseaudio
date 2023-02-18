(lang dune 2.8)
(version 0.1.6)
(name pulseaudio)
(source (github savonet/ocaml-pulseaudio))
(license LGPL-2.1)
(authors "The Savonet Team <savonet-users@lists.sourceforge.net>")
(maintainers "The Savonet Team <savonet-users@lists.sourceforge.net>")

(generate_opam_files true)
(use_standard_c_and_cxx_flags false)

(package
 (name pulseaudio)
 (synopsis "Bindings to Pulseaudio client library")
 (depends
  conf-pulseaudio
  conf-pkg-config
  dune
  dune-configurator)
)
