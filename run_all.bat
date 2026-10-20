@echo off
setlocal enabledelayedexpansion

echo Starting notebook execution using Papermill...

:: Define array elements separated by spaces
set "notebooks=q1_a.ipynb q1_b_c.ipynb q1_d.ipynb q2_a.ipynb q2_b.ipynb q2_c.ipynb q2_d.ipynb q3_a.ipynb q3_b.ipynb q3_c_d.ipynb"

for %%nb in (%notebooks%) do (
    if exist "%%nb" (
        echo ----------------------------------------
        echo Running %%nb ...
        
        rem Overwrites the notebook in-place with executed outputs
        papermill "%%nb" "%%nb"
        
        if !errorlevel! equ 0 (
            echo Successfully completed %%nb
        ) else (
            echo Error executing %%nb. Execution stopped.
            exit /b 1
        )
    ) else (
        echo Warning: File %%nb not found. Skipping...
    )
)

echo ----------------------------------------
echo All notebooks executed successfully!