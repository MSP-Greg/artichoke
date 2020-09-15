#!/usr/bin/env ruby
# frozen_string_literal: true

SAMPLES = 4096
INT32_MAX = 2**32

r = Random.new(33)
bytes_a = r.bytes(SAMPLES)

r = Random.new(33)
bytes_b = r.bytes(SAMPLES)

raise 'not reproducible' unless bytes_a == bytes_b

r = Random.new(33)
floats_a = SAMPLES.times.map { r.rand }

r = Random.new(33)
floats_b = SAMPLES.times.map { r.rand }

raise 'not reproducible' unless floats_a == floats_b

r = Random.new(33)
int32s_a = SAMPLES.times.map { r.rand INT32_MAX }

r = Random.new(33)
int32s_b = SAMPLES.times.map { r.rand INT32_MAX }

raise 'not reproducible' unless int32s_a == int32s_b

File.open('tests/vectors/mod.rs', 'w') do |rs|
  rs.puts '// This file is automatically generated.'
  rs.puts '//'
  rs.puts '// See `scripts/reproduciblity.rb` if you would like to make changes to these vectors.'
  rs.puts

  rs.puts '#[allow(clippy::unreadable_literal)]'
  rs.puts "pub static BYTES_SEED_32: &[u8] = &#{bytes_a.bytes.inspect};"
  rs.puts

  rs.puts '#[allow(clippy::unreadable_literal)]'
  rs.puts "pub static REAL_SEED_32: &[f64] = &#{floats_a.inspect};"
  rs.puts

  rs.puts '#[allow(clippy::unreadable_literal)]'
  rs.puts "pub static INT32_SEED_32: &[u32] = &#{int32s_a.inspect};"
end
