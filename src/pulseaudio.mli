(** An error occured. *)
exception Error of int

(** Get the description of an error. *)
val string_of_error : int -> string

type sample_format =
  | Sample_format_s16le
  | Sample_format_s16be
  | Sample_format_float32le
  | Sample_format_float32be

type sample =
    {
      sample_format : sample_format;
      sample_rate : int;
      sample_chans : int;
    }

type map

(** Direction of the stream. *)
type dir =
  | Dir_nodirection (** Invalid direction. *)
  | Dir_playback (** Playback stream. *)
  | Dir_record (** Record stream. *)
  | Dir_upload (** Sample upload stream. *)

(** Simple pulseaudio interface. *)
module Simple : sig
  (** Connections to a server. *)
  type t

  val create : ?server:string -> client_name:string -> dir:dir -> ?dev:string -> stream_name:string -> sample:sample -> ?map:map -> unit -> t

  (** Close and free a connection to a server. *)
  val free : t -> unit

  val read : t -> float array array -> int -> int -> unit

  val write : t -> float array array -> int -> int -> unit

  (** Wait until all data already written is played by the daemon. *)
  val drain : t -> unit

  (** Flush the playback buffer. *)
  val flush : t -> unit

  (** Return the playback latency. *)
  val latency : t -> int
end
