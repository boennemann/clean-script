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
