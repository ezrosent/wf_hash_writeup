#!/bin/bash
cargo build --release
for occ in 0 8 2 1; do
	for thr in 1 2 4 8 16 32; do
		for muts in 0 10 40 60 80; do
			set -x
			./target/release/bench_ht $thr $occ $muts
			set +x
		done
	done
done | tee results.out
