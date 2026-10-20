#!/bin/bash

# List of Jupyter notebooks to run in order
notebooks=(
    "q1_a.ipynb"
    "q1_b_c.ipynb"
    "q1_d.ipynb"
    "q2_a.ipynb"
    "q2_b.ipynb"
    "q2_c.ipynb"
    "q2_d.ipynb"
    "q3_a.ipynb"
    "q3_b.ipynb"
    "q3_c_d.ipynb"
)

echo "Starting notebook execution using Papermill..."

for nb in "${notebooks[@]}"; do
    if [ -f "$nb" ]; then
        echo "----------------------------------------"
        echo "Running $nb ..."
        # Overwrites the notebook in-place with executed outputs
        papermill "$nb" "$nb"
        
        if [ $? -eq 0 ]; then
            echo "Successfully completed $nb"
        else
            echo "Error executing $nb. Execution stopped."
            exit 1
        fi
    else
        echo "Warning: File $nb not found. Skipping..."
    fi
done

echo "----------------------------------------"
echo "All notebooks executed successfully!"