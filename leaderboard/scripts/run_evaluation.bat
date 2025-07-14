@echo off
REM === CONFIGURACIÓN DE VARIABLES ===

set CARLA_ROOT=C:\Users\LENOVO\CarlaSimulator\CARLA_0.9.15
set CARLA_SERVER=%CARLA_ROOT%\CarlaUE4.exe

REM === Configurar PYTHONPATH ===

set PYTHONPATH=%PYTHONPATH%;%CARLA_ROOT%\PythonAPI
set PYTHONPATH=%PYTHONPATH%;%CARLA_ROOT%\PythonAPI\carla

@REM set PYTHONPATH=%PYTHONPATH%;%CARLA_ROOT%\PythonAPI\carla\dist\carla-0.9.10-py3.7-win-amd64.egg

set PYTHONPATH=%PYTHONPATH%;leaderboard
set PYTHONPATH=%PYTHONPATH%;leaderboard\team_code
set PYTHONPATH=%PYTHONPATH%;scenario_runner

REM === PARÁMETROS DE EVALUACIÓN ===
set LEADERBOARD_ROOT=leaderboard
set CHALLENGE_TRACK_CODENAME=SENSORS
set PORT=2000
set TM_PORT=8000
set DEBUG_CHALLENGE=0
set REPETITIONS=1

set ROUTES=leaderboard\data\evaluation_routes\eval_routes_weathers.xml
@REM REM set ROUTES=leaderboard\data\validation_routes\routes_town05_short.xml

set TEAM_AGENT=leaderboard\team_code\neat_agent.py
@REM set TEAM_AGENT=leaderboard\team_code\auto_pilot.py

set TEAM_CONFIG=.\model_ckpt\neat
@REM set TEAM_CONFIG=aim\log\aim_ckpt

set CHECKPOINT_ENDPOINT=..\carla_results\auto_pilot.json
@REM set CHECKPOINT_ENDPOINT=results\sample_result.json

set SCENARIOS=leaderboard\data\scenarios\eval_scenarios.json
@REM set SCENARIOS=leaderboard\data\scenarios\no_scenarios.json

set SAVE_PATH=data\expert
set RESUME=0
set RECORD_PATH=..\record

REM === EJECUTAR EVALUACIÓN ===
python %LEADERBOARD_ROOT%\leaderboard\leaderboard_evaluator.py ^
--scenarios=%SCENARIOS% ^
--routes=%ROUTES% ^
--repetitions=%REPETITIONS% ^
--track=%CHALLENGE_TRACK_CODENAME% ^
--checkpoint=%CHECKPOINT_ENDPOINT% ^
--agent=%TEAM_AGENT% ^
--agent-config=%TEAM_CONFIG% ^
--debug=%DEBUG_CHALLENGE% ^
--record=%RECORD_PATH% ^
--resume=%RESUME% ^
--trafficManagerPort=%TM_PORT% ^
--port=%PORT%
@REM --id=%TEAM_CONFIG% ^