@echo off
setlocal enabledelayedexpansion

echo Starting notebook execution using Papermill...

set "notebooks=q1_a.ipynb q1_b_c.ipynb q1_d.ipynb q2_a.ipynb q2_b.ipynb q2_c.ipynb q2_d.ipynb q3_a.ipynb q3_b.ipynb q3_c_d.ipynb"

for %%n in (%notebooks%) do (
    if exist "%%n" (
        echo ----------------------------------------
        echo Running %%n ...
        
        papermill "%%n" "%%n"
        
        if !errorlevel! equ 0 (
            echo Successfully completed %%n
        ) else (
            echo Error executing %%n. Execution stopped.
            exit /b 1
        )
    ) else (
        echo Warning: File %%n not found. Skipping...
    )
)

echo ----------------------------------------
echo All notebooks executed successfully!