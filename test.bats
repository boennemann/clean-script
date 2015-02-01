#!/usr/bin/env bats

@test "executes command and exit" {
  run "$BATS_TEST_DIRNAME/bin/clean-script" 'echo "close"' 'echo "cleanup"'

  [ "$status" -eq 0 ]
  [ ${lines[0]} = "close" ]
  [ ${lines[1]} = "cleanup" ]
}

@test "executes exit even when command fails" {
  run "$BATS_TEST_DIRNAME/bin/clean-script" 'echo "error" && exit 1' 'echo "cleanup"'

  [ "$status" -gt 0 ]
  [ ${lines[0]} = "error" ]
  [ ${lines[1]} = "cleanup" ]
}

@test "executes multiples exits in right order" {
  run "$BATS_TEST_DIRNAME/bin/clean-script" 'echo "close"' 'echo "cleanup1"' 'echo "cleanup2"'

  [ "$status" -eq 0 ]
  [ ${lines[0]} = "close" ]
  [ ${lines[1]} = "cleanup1" ]
  [ ${lines[2]} = "cleanup2" ]
}
