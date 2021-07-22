### Methods

| Method | Returns |
| ------ | ------- |
| **GetCurrentLevelName**() | levelName: string |
| **GetCurrentGameModeName**() | gameModeName: string |
| **GetCurrentRounds**() | rounds: int |
| **GetCurrentRound**() | round: int |
| **GetCurrentLevelInfo**() | levelName: string, gameModeName: string, rounds: int, round: int |
| **GetNextLevelName**() | levelName: string |
| **GetNextGameModeName**() | gameModeName: string |
| **GetNextRounds**() | rounds: int |
| **GetNextLevelInfo**() | levelName: string, gameModeName: string, rounds: int |
| **GetLevelNameForIndex**(index: string) | levelName: string |
| **GetGameModeNameForIndex**(index: string) | gameModeName: string |
| **GetRoundsForIndex**(index: string) | rounds: int |
| **GetLevelInfoForIndex**(index: string) | levelName: string, gameModeName: string, rounds: int |
| **IsNextLevelDifferent**(isLevelDestroyed: bool) | isNextLevelDifferent: bool |
| **GetList**() | levelInfo: {levelName: string, gameModeName: string, rounds: int} |
| **SetNextLevel**(levelName: string, gameModeName: string, rounds: int) | bool |
| **SetNextLevelIndex**(index: int) | bool |
| **Add**(levelName: string, gameModeName: string, rounds: int) | bool |
| **Add**(levelName: string, gameModeName: string, rounds: int, index: int) | bool |
| **Remove**(index: int) | bool |
| **Clear**() | bool |
| **Load**() | bool |
| **Save**() | bool |
| **RestartRound**() | bool |
| **RunNextRound**() | bool |
| **EndRound**(winner: TeamId) | bool |
