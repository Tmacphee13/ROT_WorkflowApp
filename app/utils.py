import subprocess

def run_workflow(workflow, params_file):
    command = [
        "nextflow", "run", workflow,
        "-params-file", params_file,
        "-c", "nextflow.config"  # Load configuration settings
    ]
    result = subprocess.run(command, capture_output=True, text=True)
    return result.stdout, result.stderr
